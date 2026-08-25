import 'dart:async';

import 'package:intl/intl.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../di/injection.dart';
import '../../../features/workplace/app/reg_work/view/pages/salary/view/bloc/salary_bloc.dart';

import '../../../features/workplace/app/reg_work/view/pages/work_trip/data/datasource/models/work_trip_model.dart';
import '../../../features/workplace/app/reg_work/view/pages/work_trip/view/widgets/work_trip_add_constants.dart';
import '../../../features/workplace/app/reg_work/view/pages/work_trip/view/widgets/work_trip_vehicle_dialog.dart';
import '../../../features/workplace/app/reports/view/tech/view/bloc/tech_bloc.dart';
import '../../../routes/route_names.dart';
import '../../app_theme/index.dart';
import '../../common_ui.dart';
import '../../constants/index.dart';
import '../../services/custom_toast.dart';
import '../../services/update/force_update_service.dart';

import '../../widgets/form/index.dart';
import '../navigation/navigation_utils.dart';
import 'base_dialog/base_dialog.dart';
import '../../../features/workplace/app/reg_general/view/pages/work_category/view/widgets/work_problem_dialog.dart';
import '../../../features/workplace/app/reg_work/view/pages/salary/pincode/pincode.dart';

class DialogService {
  static DateTime? _lastToastTime;
  static const int _toastCooldownSeconds = 3;
  static const int _maxPinRetry = 3;
  static int _pinFailedCount = 0;
  static bool _isPinDialogShown = false;

  static void resetPinFailedCount() {
    _pinFailedCount = 0;
  }

  static Future<bool?> showPinDialog({
    required BuildContext context,
    bool isLoading = false,
    String? errorMessage,
  }) async {
    if (_isPinDialogShown) return null;
    _isPinDialogShown = true;

    bool? confirmed;
    bool _waitingScreenResult = false;
    final Completer<bool?> _screenResultCompleter = Completer<bool?>();

    final controller = PinInputController();
    int currentRetryCount = _pinFailedCount;
    bool isLocked = _pinFailedCount >= _maxPinRetry;

    await showDialog<bool?>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BlocProvider(
          create: (_) => getIt<SalaryBloc>(),
          child: BlocConsumer<SalaryBloc, SalaryState>(
            listenWhen: (prev, curr) =>
                prev.pinVerified != curr.pinVerified ||
                prev.pinError != curr.pinError ||
                prev.isVerifyingPin != curr.isVerifyingPin,
            listener: (blocContext, state) {
              if (state.pinVerified) {
                confirmed = true;
                _pinFailedCount = 0;
                Navigator.of(dialogContext).pop(true);
                return;
              }
              if (state.pinError != null && !state.isVerifyingPin) {
                currentRetryCount = _pinFailedCount + 1;
                _pinFailedCount = currentRetryCount;
                isLocked = _pinFailedCount >= _maxPinRetry;
                controller.setError();
              }
            },
            builder: (blocContext, state) {
              return PinDialogWidget(
                controller: controller,
                state: state,
                pinRetryCount: currentRetryCount,
                isPinLocked: isLocked,
                onSubmit: (pin) {
                  if (isLocked) return;
                  blocContext.read<SalaryBloc>().add(
                    SalaryEvent.verifyPin(pin),
                  );
                },
                onCancel: () {
                  _pinFailedCount = 0;
                  confirmed = false;
                  Navigator.of(dialogContext).pop(false);
                  context.pop();
                },
                onForgotPin: () {
                  _pinFailedCount = 0;
                  confirmed = null;
                  _waitingScreenResult = true;
                  Navigator.of(dialogContext).pop(null);
                  context.push<bool>(RouteNames.salaryForgotPin).then((result) {
                    confirmed = result == true ? true : false;
                    _isPinDialogShown = false;
                    _waitingScreenResult = false;
                    if (!_screenResultCompleter.isCompleted) {
                      _screenResultCompleter.complete(confirmed);
                    }
                  });
                },
              );
            },
          ),
        );
      },
    );

    if (_waitingScreenResult) {
      return _screenResultCompleter.future;
    }

    _isPinDialogShown = false;
    return confirmed;
  }

  /// Toast error
  static void showToastFailed({
    required BuildContext context,
    String? mess,
    PositionedToastBuilder? positionedToastBuilder,
  }) {
    if (!context.mounted) return;

    final now = DateTime.now();
    if (_lastToastTime != null &&
        now.difference(_lastToastTime!).inSeconds < _toastCooldownSeconds) {
      return;
    }

    _lastToastTime = now;

    CustomToast.showToastWithoutAppIcon(
      context: context,
      toastDuration: const Duration(seconds: _toastCooldownSeconds),
      positionedToastBuilder: positionedToastBuilder,
      message: mess ?? 'dialog_service.an_error_occurred_please_try_again'.tr(),
    );
  }

  /// Dialog processing / developing
  static Future<void> showProcessing({required BuildContext context}) {
    return BaseDialog.oneOptionDialog(
      context: context,
      title: 'common.notification'.tr(),
      description: 'common.process'.tr(),
      onTapFunc: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
  }

  /// Dialog bắt buộc cập nhật phiên bản mới.
  /// - Cập nhật ngay: mở store.
  /// - Huỷ: thoát app.
  static Future<void> showForceUpdate({required BuildContext context}) {
    return BaseDialog.twoOptionVerticalDialog(
      context: context,
      image: const Icon(Icons.system_update, size: 64, color: AppColors.main),
      title: 'Cập nhật phiên bản mới',
      description: 'Vui lòng cập nhật phiên bản mới để tiếp tục sử dụng.',
      contentTopButton: 'Cập nhật',
      topButtonFunc: () {
        Navigator.of(context, rootNavigator: true).pop();
        ForceUpdateService.openStoreAndExit();
      },
      contentBottomButton: 'Huỷ',
      bottomButtonFunc: () {
        Navigator.of(context, rootNavigator: true).pop();
        ForceUpdateService.exitApp();
      },
    );
  }

  static Future<void> showOverall({
    required BuildContext context,
    required contentWidget,
  }) {
    return BaseDialog.baseDialog(
      context: context,
      haveCancelBottomBtn: false,
      contentWidget: contentWidget,
      barrierDismissible: true,
    );
  }

  static Future<T?> showFullscreen<T>({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x99000000),
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: barrierColor,
      pageBuilder: (_, __, ___) => child,
      transitionBuilder: (context, animation, secondaryAnimation, dialogChild) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.04),
              end: Offset.zero,
            ).animate(curved),
            child: dialogChild,
          ),
        );
      },
    );
  }

  static Future<String?> showProblemDialog({
    required BuildContext context,
    String? initialProblems,
    List<dynamic> problems = const [],
    void Function(String content)? onSave,
  }) async {
    return showDialog<String>(
      context: context,
      builder: (_) => WorkProblemDialog(
        problems: problems,
        initialProblems: initialProblems,
        onSave: onSave,
      ),
    );
  }

  static Future<void> showMailReport({
    required BuildContext context,
    required TechState state,
    required DateTime dateReport,
    required Future<void> Function() onSubmit,
    required Future<void> Function() onSendMail,
    VoidCallback? onConfirm,
    bool isEdit = false,
  }) async {
    final confirmed = await BaseDialog.twoOptionVerticalDialog(
      context: context,
      title: 'Xem trước nội dung báo cáo',
      descriptionWidget: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: buildMailPreview(context, state, dateReport),
      ),
      image: Image.asset(AppImages.logo_login, width: 30, height: 30),
      contentTopButton: 'Lưu báo cáo',
      contentBottomButton: 'Hủy',
      topButtonFunc: () => context.pop(true),
      bottomButtonFunc: () => context.pop(false),
    );

    if (confirmed != true) return;

    await _runFlow(
      context: context,
      dateReport: dateReport,
      onSubmit: onSubmit,
      onSendMail: onSendMail,
      onConfirm: onConfirm,
      isEdit: isEdit,
    );
  }

  static Future<void> _runFlow({
    required BuildContext context,
    required DateTime dateReport,
    required Future<void> Function() onSubmit,
    required Future<void> Function() onSendMail,
    VoidCallback? onConfirm,
    required bool isEdit,
  }) async {
    final bloc = context.read<TechBloc>();

    try {
      bloc.add(const TechEvent.resetSubmitFlags());

      await onSubmit();

      await _waitUntil(
        bloc,
        (s) => s.submitSuccess == true || s.saveSuccess == true,
      );

      if (!context.mounted) return;

      await onSendMail();

      await _waitUntil(bloc, (s) => s.sendMailSuccess == true);

      if (!context.mounted) return;

      final latestState = bloc.state;
      final text = buildMailPreviewText(latestState, dateReport);

      await Clipboard.setData(ClipboardData(text: text));

      await Future.delayed(const Duration(milliseconds: 150));

      final box = context.findRenderObject() as RenderBox?;
      if (box != null) {
        await SharePlus.instance.share(
          ShareParams(
            subject: 'Báo cáo công việc',
            text: text,
            sharePositionOrigin: Rect.fromLTWH(
              0,
              0,
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 2,
            ),
          ),
        );
      }

      if (!context.mounted) return;

      context.pop(true);

      onConfirm?.call();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> _waitUntil(
    TechBloc bloc,
    bool Function(TechState) predicate, {
    Duration timeout = const Duration(seconds: 30),
  }) async {
    await bloc.stream.firstWhere(predicate).timeout(timeout);
  }

  /// Chờ sendMailSuccess = true từ bloc.
  static Future<void> waitUntilMailSuccess(TechBloc bloc) async {
    await bloc.stream
        .firstWhere((s) => s.sendMailSuccess == true)
        .timeout(const Duration(seconds: 30));
  }

  static String buildMailPreviewText(TechState state, DateTime dateReport) {
    final b = StringBuffer();
    final projects = state.projects;

    String _clean(String? v) => (v ?? '').trim();

    void _writeSection(String title, List<String> lines) {
      b.writeln('\n* $title:');
      if (lines.isEmpty) {
        b.writeln('- Không có');
      } else {
        for (final l in lines) {
          b.writeln(l);
        }
      }
    }

    b.writeln(
      'Báo cáo công việc ngày ${DateFormat('dd/MM/yyyy').format(dateReport)}',
    );

    /// Mã dự án
    _writeSection(
      'Mã dự án - Tên dự án',
      projects
          .map((p) => '${_clean(p.projectCode)} - ${_clean(p.name)}')
          .where((e) => e.trim() != '-')
          .toList(),
    );

    /// Nội dung công việc
    final contents = <String>[];
    for (final p in projects) {
      for (final w in p.works) {
        final lines = _clean(
          w.content,
        ).split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty);
        if (lines.isNotEmpty) {
          contents.add('${w.code}:');
          contents.addAll(lines);
          contents.add('');
        }
      }
    }
    _writeSection('Nội dung công việc', contents);

    /// Kết quả công việc
    final results = <String>[];
    for (final p in projects) {
      for (final w in p.works) {
        final lines = _clean(
          w.results,
        ).split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty);
        if (lines.isNotEmpty) {
          results.add('${w.code}:');
          results.addAll(lines);
          results.add('');
        }
      }
    }
    _writeSection('Kết quả công việc', results);

    /// Tồn đọng
    final backlogs = <String>[];
    for (final p in projects) {
      for (final w in p.works) {
        final v = _clean(w.backlog);
        if (v.isNotEmpty) {
          backlogs.add('${w.code}: $v');
        }
      }
    }

    /// Tồn đọng
    _writeSection(
      'Tồn đọng',
      _clean(state.backlog).isNotEmpty ? [state.backlog!.trim()] : [],
    );

    /// Ghi chú
    _writeSection(
      'Ghi chú',
      _clean(state.note).isNotEmpty ? [state.note!.trim()] : [],
    );

    /// Vấn đề phát sinh
    _writeSection(
      'Vấn đề phát sinh',
      _clean(state.problem).isNotEmpty ? [state.problem!.trim()] : [],
    );

    /// Giải pháp
    _writeSection(
      'Giải pháp cho vấn đề phát sinh',
      _clean(state.problemSolve).isNotEmpty ? [state.problemSolve!.trim()] : [],
    );

    /// Kế hoạch ngày tiếp theo
    _writeSection(
      'Kế hoạch ngày tiếp theo',
      _clean(state.planNextDay).isNotEmpty ? [state.planNextDay!.trim()] : [],
    );

    return b.toString().trimRight();
  }

  static Widget buildMailPreview(
    BuildContext context,
    TechState state,
    DateTime dateReport,
  ) {
    final projects = state.projects;

    String _clean(String? v) => (v ?? '').trim();

    Widget _section(String title, List<Widget> children) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          _h('* $title:'),
          if (children.isEmpty) _p('- Không có') else ...children,
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _h(
            'Báo cáo công việc ngày ${DateFormat('dd/MM/yyyy').format(dateReport)}',
          ),
          const SizedBox(height: 8),

          /// Mã dự án
          _section(
            'Mã dự án - Tên dự án',
            projects
                .map((p) => '${_clean(p.projectCode)} - ${_clean(p.name)}')
                .where((e) => e.trim() != '-')
                .map((e) => _p(e))
                .toList(),
          ),

          /// Nội dung công việc
          _section(
            'Nội dung công việc',
            projects
                .expand((p) => p.works)
                .where((w) => _clean(w.content).isNotEmpty)
                .map(
                  (w) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_b('${w.code}:'), _p(_clean(w.content))],
                  ),
                )
                .toList(),
          ),

          /// Kết quả công việc
          _section(
            'Kết quả công việc',
            projects
                .expand((p) => p.works)
                .where((w) => _clean(w.results).isNotEmpty)
                .map(
                  (w) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_b('${w.code}:'), _p(_clean(w.results))],
                  ),
                )
                .toList(),
          ),

          /// Tồn đọng
          _section(
            'Tồn đọng',
            _clean(state.backlog).isNotEmpty ? [_p(_clean(state.backlog))] : [],
          ),

          /// Ghi chú
          _section(
            'Ghi chú',
            _clean(state.note).isNotEmpty ? [_p(_clean(state.note))] : [],
          ),

          /// Vấn đề phát sinh
          _section(
            'Vấn đề phát sinh',
            _clean(state.problem).isNotEmpty ? [_p(_clean(state.problem))] : [],
          ),

          /// Giải pháp
          _section(
            'Giải pháp cho vấn đề phát sinh',
            _clean(state.problemSolve).isNotEmpty
                ? [_p(_clean(state.problemSolve))]
                : [],
          ),

          /// Kế hoạch ngày tiếp theo
          _section(
            'Kế hoạch ngày tiếp theo',
            _clean(state.planNextDay).isNotEmpty
                ? [_p(_clean(state.planNextDay))]
                : [],
          ),
        ],
      ),
    );
  }

  static Widget _h(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
  );

  static Widget _b(String text) => Padding(
    padding: const EdgeInsets.only(top: 4),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
  );

  static Widget _p(String text) => Padding(
    padding: const EdgeInsets.only(left: 8, bottom: 4),
    child: Text(text),
  );

  static Future<void> showCancelLunch({
    required BuildContext context,
    VoidCallback? onConfirm,
  }) {
    return BaseDialog.twoOptionVerticalDialog(
      context: context,
      description: 'Bạn có chắc chắn muốn huỷ?',

      /// 🖼 Icon / Image huỷ
      image: Image.asset(AppImages.logo_login, width: 40, height: 40),

      /// 🔴 Nút xác nhận huỷ
      topButtonFunc: () {
        onBack(context);
        onConfirm?.call();
      },

      /// ⚪ Nút thoát
      bottomButtonFunc: () {
        onBack(context);
      },
    );
  }

  static Future<void> showSelectHr({required BuildContext context}) {
    return BaseDialog.twoOptionHorizontalDialog(
      context: context,

      haveCancelBottomBtn: true,
      heading: 'Lựa chọn',
      contentLeftButton: 'Hành chính - IT',
      leftAssetPath: AppImages.report_hr_it,
      leftBgColor: AppColors.grey_bg,
      leftButtonFunc: () async {
        onBack(context); // đóng dialog trước
        return context.push(RouteNames.reportHRAdmin);
      },

      contentRightButton: 'Lái xe - Cắt phim',
      rightAssetPath: AppImages.report_hr_driver,
      rightBgColor: AppColors.grey_bg,
      rightButtonFunc: () async {
        onBack(context);
        return context.push(RouteNames.reportHRLXCP);
      },
    );
  }

  static Future<void> showSelectSale({required BuildContext context}) {
    return BaseDialog.twoOptionHorizontalDialog(
      context: context,

      haveCancelBottomBtn: true,
      heading: 'Lựa chọn',
      contentLeftButton: 'Sale Admin',
      leftAssetPath: AppImages.report_sale_admin,
      leftBgColor: AppColors.grey_bg,
      leftButtonFunc: () async {
        onBack(context); // đóng dialog trước
        // return context.push(RouteNames.reportSaleAdmin);
        return null;
      },

      contentRightButton: 'Nhân viên sale',
      rightAssetPath: AppImages.report_saler,
      rightBgColor: AppColors.grey_bg,
      rightButtonFunc: () async {
        onBack(context);
        // return context.push(RouteNames.reportSaleStaff);
        return null;
      },
    );
  }

  static Future<String?> showCreateReport({
    required BuildContext context,
  }) async {
    final formKey = GlobalKey<FormBuilderState>();

    return await BaseDialog.twoOptionVerticalDialog(
      context: context,
      image: const Icon(
        Icons.post_add_outlined,
        size: 64,
        color: AppColors.main,
      ),

      title: 'Thêm loại báo cáo',

      /// ===== FORM =====
      descriptionWidget: FormBuilder(
        key: formKey,
        child: FormBuilderTextField(
          name: 'report_type',
          decoration: const InputDecoration(
            labelText: 'Tên loại báo cáo',
            prefixIcon: Icon(Icons.category_outlined),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Vui lòng nhập tên loại báo cáo',
            ),
          ]),
        ),
      ),

      /// ===== LƯU =====
      contentTopButton: 'Lưu',
      topButtonFunc: () {
        final state = formKey.currentState;
        if (state?.saveAndValidate() ?? false) {
          final value = state!.value['report_type'] as String;
          Navigator.of(context).pop(value);
        }
      },

      /// ===== HUỶ =====
      contentBottomButton: 'Huỷ',
      bottomButtonFunc: () {
        Navigator.of(context).pop();
      },
    );
  }

  /// Hiển thị dialog chọn phương tiện công tác.
  /// Trả về [List<WorkTripVehicleEntry>] đã được lưu, hoặc null nếu huỷ.
  static Future<List<WorkTripVehicleEntry>?> showVehicle({
    required BuildContext context,
    required List<WorkTripTypeVehicle> vehicleTypes,
    List<WorkTripVehicleEntry> initialEntries = const [],
  }) => showWorkTripVehicleDialog(
    context: context,
    vehicleTypes: vehicleTypes,
    initialEntries: initialEntries,
  );

  static Future<bool> showConfirmExit({required BuildContext context}) async {
    bool confirmed = false;

    await BaseDialog.twoOptionVerticalDialog(
      context: context,
      image: const Icon(Icons.exit_to_app, size: 64, color: Colors.orange),
      title: 'Thoát ứng dụng',
      description: 'Bạn có chắc muốn thoát ứng dụng?',
      contentTopButton: 'Thoát',
      topButtonFunc: () {
        confirmed = true;
        onBack(context);
      },
      contentBottomButton: 'Huỷ',
      bottomButtonFunc: () {
        confirmed = false;
        onBack(context);
      },
    );

    return confirmed;
  }

  static Future<bool> showConfirmDelete({required BuildContext context}) async {
    bool confirmed = false;

    await BaseDialog.twoOptionVerticalDialog(
      context: context,
      image: const Icon(Icons.delete_outline, size: 64, color: Colors.red),
      title: 'Xác nhận xoá',
      description: 'Bạn có chắc muốn xoá báo cáo này không?',
      contentTopButton: 'Xoá',
      topButtonFunc: () {
        confirmed = true;
        onBack(context); // giống pattern showMailReport
      },
      contentBottomButton: 'Huỷ',
      bottomButtonFunc: () {
        confirmed = false;
        onBack(context);
      },
    );

    return confirmed;
  }

  static Future<bool?> showConfirmDeleteSignature({
    required BuildContext context,
    String title = 'Xoá chữ ký',
    String message = 'Bạn có chắc muốn xoá chữ ký này không?',
  }) async {
    bool confirmed = false;

    await BaseDialog.twoOptionHorizontalDialogWithCompany(
      context: context,
      logo:Image.asset(AppImages.logo_login, width: 32, height: 32),
      companyName: "RTC",
      title: title,
      description: message,
      contentLeftButton: 'Xoá',
      leftButtonFunc: () {
        confirmed = true;
        onBack(context);
      },
      contentRightButton: 'Huỷ',
      rightButtonFunc: () {
        confirmed = false;
        onBack(context);
      }
    );

    return confirmed;
  }

  static Future<void> showCancelBooking({
    required BuildContext context,
    VoidCallback? onConfirm,
  }) {
    return BaseDialog.twoOptionVerticalDialog(
      context: context,
      description: 'Bạn có chắc chắn muốn huỷ đăng ký đặt xe?',

      /// 🖼 Icon / Image huỷ
      image: Image.asset(AppImages.logo_login, width: 40, height: 40),

      /// Chỉ đóng dialog một lần — `context.pop` + `onBack` lần hai sẽ pop luôn route phía dưới.
      topButtonFunc: () {
        onBack(context);
        onConfirm?.call();
      },

      /// ⚪ Nút thoát
      bottomButtonFunc: () {
        onBack(context);
      },
    );
  }

  static Future<void> showNotificationLeave({
    required BuildContext context,
    VoidCallback? onConfirm,
  }) {
    return BaseDialog.twoOptionVerticalDialog(
      context: context,
      title: "Ghi chú",
      descriptionWidget: FormLeftBorderCard(
        icon: Icons.warning_amber_outlined,
        borderColor: Colors.red,
        backgroundColor: Colors.red.shade50,
        borderWidth: 4,
        child: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
            children: [
              TextSpan(
                text: '• Nghỉ phép (P): ',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text:
                    'Đăng ký trên ứng dụng trước 19h ngày liền trước ngày nghỉ, '
                    'quỹ phép phải còn dương tại thời điểm xin nghỉ (không ứng phép). '
                    'Nhân sự đang thử việc được tính phép nhưng chưa được sử dụng, '
                    'không hoàn phép nếu không ký HĐLĐ chính thức.\n\n',
              ),
              TextSpan(
                text: '• Nghỉ không lương (Ro): ',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text:
                    'Xin nghỉ sau 19h của ngày liền trước ngày nghỉ hoặc khi không còn phép.\n\n',
              ),
              TextSpan(
                text: '• Nghỉ việc riêng có hưởng lương (R): ',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text:
                    'NLĐ kết hôn (03 ngày); Con NLĐ kết hôn (01 ngày); '
                    'Cha/Mẹ/Vợ/Chồng/Con mất (03 ngày).',
              ),
            ],
          ),
        ),
      ),
      image: Image.asset(AppImages.logo_login, width: 40, height: 40),
      topButtonFunc: () {
        onBack(context);
        onConfirm?.call();
      },
      bottomButtonFunc: () {
        onBack(context);
      },
    );
  }

  static Future<void> showNotificationOvertime({
    required BuildContext context,
    VoidCallback? onConfirm,
  }) {
    return BaseDialog.twoOptionVerticalDialog(
      context: context,
      title: "Lưu ý",
      descriptionWidget: FormLeftBorderCard(
        icon: Icons.warning_amber_outlined,
        borderColor: Colors.red,
        backgroundColor: Colors.red.shade50,
        borderWidth: 4,
        child: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
            children: [
              TextSpan(
                text:
                    '• Thời gian làm thêm không tính thời gian ăn ca, nghỉ giữa giờ, đợi xe, '
                    'ngồi trên xe khi đi công tác (không bao gồm Lái xe).\n\n'
                    '• Thời gian làm thêm tại văn phòng được tính từ 18:00.\n\n'
                    '• Làm thêm đến 20:00 được hưởng phụ cấp ăn tối.\n\n'
                    '• CBNV cần khai báo đúng quy định. Trường hợp quên khai báo công có thể '
                    'khai báo bổ sung. Nếu quên khai báo/chấm công từ 3 lần/tháng sẽ bị trừ 100% PCCC.',
              ),
            ],
          ),
        ),
      ),
      image: Image.asset(AppImages.logo_login, width: 40, height: 40),
      topButtonFunc: () {
        onBack(context);
        onConfirm?.call();
      },
      bottomButtonFunc: () {
        onBack(context);
      },
    );
  }

  static Future<Map<String, dynamic>?> showApproveTask({
    required BuildContext context,
    String title = 'Xác nhận duyệt công việc',
    String? initialComment,
    bool isCommentRequired = false,
    int initialRating = 5,
    void Function(int rating, String? comment)? onConfirm,
  }) async {
    final formKey = GlobalKey<FormBuilderState>();
    int selectedRating = initialRating;
    Map<String, dynamic>? result;

    await BaseDialog.twoOptionVerticalDialog(
      context: context,
      image: const Icon(Icons.check_circle_outline, size: 64, color: AppColors.stateSuccessColor),
      title: title,
      descriptionWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Đánh giá hoàn thành',
            style: AppStyles.body2.copyWith(color: AppColors.textSecondaryColor),
          ),
          SizedBox(height: AppUICommons.smallVerticalSpacing),
          StatefulBuilder(
            builder: (context, setState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        selectedRating = index + 1;
                      });
                    },
                    icon: Icon(
                      index < selectedRating
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      size: 36,
                      color: AppColors.stateWarningColor,
                    ),
                  );
                }),
              );
            },
          ),
          SizedBox(height: AppUICommons.smallVerticalSpacing),
          FormBuilder(
            key: formKey,
            child: FormBuilderTextField(
              name: 'comment',
              initialValue: initialComment,
              decoration: InputDecoration(
                labelText: isCommentRequired ? 'Nhận xét *' : 'Nhận xét',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppUICommons.mediumRadius),
                ),
              ),
              maxLines: 3,
              validator: isCommentRequired
                  ? FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Vui lòng nhập nhận xét',
                      ),
                    ])
                  : null,
            ),
          ),
        ],
      ),
      contentTopButton: 'Xác nhận',
      topButtonFunc: () {
        final formState = formKey.currentState;
        if (formState?.saveAndValidate() ?? false) {
          final comment = formState!.value['comment'] as String?;
          result = {
            'rating': selectedRating,
            'comment': comment?.isNotEmpty == true ? comment : null,
          };
          onConfirm?.call(selectedRating, comment);
          onBack(context);
        }
      },
      contentBottomButton: 'Huỷ',
      bottomButtonFunc: () {
        onBack(context);
      },
    );

    return result;
  }

  static Future<Map<String, dynamic>?> showRejectTask({
    required BuildContext context,
    String title = 'Lý do từ chối',
    String? initialReason,
    void Function(String reason)? onConfirm,
  }) async {
    final formKey = GlobalKey<FormBuilderState>();
    Map<String, dynamic>? result;

    await BaseDialog.twoOptionVerticalDialog(
      context: context,
      image: const Icon(Icons.cancel_outlined, size: 64, color: Colors.red),
      title: title,
      descriptionWidget: FormBuilder(
        key: formKey,
        child: FormBuilderTextField(
          name: 'reason',
          initialValue: initialReason,
          decoration: InputDecoration(
            labelText: 'Lý do từ chối *',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppUICommons.mediumRadius),
            ),
          ),
          maxLines: 4,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Vui lòng nhập lý do từ chối',
            ),
          ]),
        ),
      ),
      contentTopButton: 'Xác nhận',
      topButtonFunc: () {
        final formState = formKey.currentState;
        if (formState?.saveAndValidate() ?? false) {
          final reason = formState!.value['reason'] as String;
          result = {'reason': reason};
          onConfirm?.call(reason);
          onBack(context);
        }
      },
      contentBottomButton: 'Huỷ',
      bottomButtonFunc: () {
        onBack(context);
      },
    );

    return result;
  }

  // static Future<dynamic> showRequestStoragePermissionDialog(
  //     BuildContext context,
  //     ) {
  //   return BaseDialog.oneOptionDialog(
  //     context: context,
  //     image: Assets.icon.iconDownChapter.svg(height: 100.w, width: 100.w),
  //     description:
  //     'request_permission.please_allow_storage_access_to_load_book_data'
  //         .tr(),
  //     contentButton: 'common.understand'.tr(),
  //     onTapFunc: () {
  //       if (context.mounted) {
  //         context.router.maybePop();
  //       } else {
  //         try {
  //           Navigator.of(context, rootNavigator: true)
  //               .context
  //               .router
  //               .maybePop();
  //         } catch (e) {
  //           if (kDebugMode) {
  //             print('error pop to home: $e');
  //           }
  //         }
  //       }
  //     },
  //   );
  // }

  // static Future<dynamic> showRequestCameraPermissionDialog(
  //     BuildContext context, {
  //       String? description,
  //     }) {
  //   return BaseDialog.oneOptionDialog(
  //     context: context,
  //     image: Assets.icon.iconCamera.svg(height: 100.w, width: 100.w),
  //     description:
  //     description ?? 'request_permission.please_allow_camera_access'.tr(),
  //     contentButton: 'common.understand'.tr(),
  //     haveCancelBottomBtn: true,
  //     onTapFunc: () {
  //       if (context.mounted) {
  //         context.router.maybePop(true);
  //       } else {
  //         try {
  //           Navigator.of(context, rootNavigator: true)
  //               .context
  //               .router
  //               .maybePop(true);
  //         } catch (e) {
  //           if (kDebugMode) {
  //             print('error pop to home: $e');
  //           }
  //         }
  //       }
  //     },
  //   );
  // }

  // static Future<dynamic> showRequestNotiPermissionDialog(
  //     BuildContext context, {
  //       void Function()? cancelButton,
  //       required void Function()? settingsButton,
  //     }) {
  //   return BaseDialog.yesNoDialog(
  //     context: context,
  //     image: Lottie.asset(
  //       Assets.lotties.notiError.path,
  //       width: 100.h,
  //     ),
  //     title: 'common.error'.tr(),
  //     description:
  //     'dialog_service.to_use_this_feature_Please_allow_access_to_notification_permissions'
  //         .tr(),
  //     noFunc: cancelButton,
  //     yesFunc: settingsButton,
  //     contentYesFunc: 'dialog_service.setting'.tr(),
  //   );
  // }

  // static Future<dynamic> showRemoveDialog(
  //     BuildContext context, {
  //       Widget? image,
  //       String? title,
  //       TextStyle? titleStyle,
  //       String? description,
  //       TextStyle? descriptionStyle,
  //       void Function()? cancelFunc,
  //       String? contentCancelFunc,
  //       Color? colorTextCancel,
  //       Color? colorCancelButton,
  //       required void Function()? removeFunc,
  //       String? contentRemoveFunc,
  //       Color? colorRemoveButton,
  //       Color? colorTextRemoveButton,
  //       bool? hiddenShadowDialog,
  //     }) {
  //   return BaseDialog.yesNoDialog(
  //       context: context,
  //       image: image ?? Assets.icon.bookDelete.svg(),
  //       title: title ?? 'common.delete'.tr(),
  //       titleStyle: titleStyle,
  //       description:
  //       description ?? 'dialog_service.do_you_really_want_to_delete'.tr(),
  //       descriptionStyle: descriptionStyle,
  //       noFunc: cancelFunc,
  //       contentNoFunc: contentCancelFunc,
  //       colorNoButton: colorCancelButton,
  //       colorTextNoButton: colorTextCancel,
  //       yesFunc: removeFunc,
  //       colorYesButton: colorRemoveButton,
  //       colorTextYesButton: colorTextRemoveButton,
  //       contentYesFunc: contentRemoveFunc ?? 'common.delete'.tr(),
  //       hiddenShadowDialog: hiddenShadowDialog);
  // }
  //
  // static Future<void> showDialogLogin(BuildContext context,
  //     {String? title,
  //       String? content,
  //       String? contentBtn1,
  //       String? contentBtn2}) {
  //   return BaseDialog.twoOptionVerticalDialog(
  //     context: context,
  //     haveCancelBottomBtn: true,
  //     heading: 'common.login'.tr(),
  //     image: Assets.icon.loginIcon.svg(height: 80.h),
  //     description: 'dialog_service.login_to_continue'.tr(),
  //     contentTopButton: 'dialog_service.login_now'.tr(),
  //     topButtonFunc: () async {
  //       final rootContext = context.router.navigatorKey.currentContext;
  //       if (rootContext != null) {
  //         Navigator.of(context, rootNavigator: true).pop();
  //         rootContext.router.replaceAll([const LoginScreenRoute()]);
  //       }
  //     },
  //     contentBottomButton: 'dialog_service.support'.tr(),
  //     bottomButtonFunc: () => goToFanPageMessenger(context),
  //   );
  // }

  // static void showLoadingDialog(BuildContext context, {String? message}) {
  //   EasyLoading.instance
  //     ..loadingStyle = EasyLoadingStyle.custom
  //     ..backgroundColor = Colors.white
  //     ..indicatorColor = AppColors.main
  //     ..textColor = AppColors.black
  //     ..textStyle = AppStyles.body1.copyWith(fontWeight: FontWeight.w600)
  //     ..radius = 16.r
  //     ..textPadding = EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h)
  //     ..contentPadding = EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h);
  //   EasyLoading.show(
  //     maskType: EasyLoadingMaskType.black,
  //     status: message,
  //   );
  // }

  // static void hideLoadingDialog(BuildContext context) {
  //   EasyLoading.dismiss();
  // }

  // static Future<void> showDialogLostInternetConnection(
  //     BuildContext context, {
  //       String? title,
  //       String? content,
  //       String? contentBtn1,
  //       String? contentBtn2,
  //       Function()? onPressedBtn1,
  //       Function()? onPressedBtn2,
  //     }) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       bool pushToHome = false;
  //       ValueNotifier<bool> canPopNotify = ValueNotifier(false);
  //       InternetCheckerService internetCheckerService =
  //       getIt<InternetCheckerService>();
  //       StreamSubscription<bool> internetConnectionSubscription =
  //       internetCheckerService.internetStatusStream
  //           .listen((bool isInternetConnected) async {
  //         canPopNotify.value = isInternetConnected;
  //       });
  //       return ValueListenableBuilder(
  //           valueListenable: canPopNotify,
  //           builder: (context, canPop, child) {
  //             if (pushToHome) {
  //               context.router.maybePop();
  //               getIt<EventBus>().fire(
  //                 ChangeHomePage(0),
  //               );
  //               context.router.replaceAll([HomeRoute()]);
  //             }
  //             return PopScope(
  //               canPop: canPop,
  //               onPopInvokedWithResult: (didPop, result) =>
  //                   internetConnectionSubscription.cancel(),
  //               child: Dialog(
  //                 insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
  //                 backgroundColor: Colors.transparent,
  //                 elevation: 0.0,
  //                 child: Container(
  //                   padding:
  //                   EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h)
  //                       .copyWith(top: 30.h),
  //                   decoration: BoxDecoration(
  //                     color: AppColors.white,
  //                     borderRadius: BorderRadius.circular(24.r),
  //                   ),
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Column(
  //                         children: [
  //                           Assets.icon.noInternet.svg(
  //                               height: 70.h,
  //                               width: 70.w,
  //                               colorFilter: const ColorFilter.mode(
  //                                   AppColors.stateSuccessColor,
  //                                   BlendMode.srcIn)),
  //                           SizedBox(height: 16.h),
  //                           Text(
  //                             title ??
  //                                 'dialog_service.lost_internet_connection'
  //                                     .tr(),
  //                             style: AppStyles.titleDetail.copyWith(
  //                                 fontSize: 24.sp, color: AppColors.black),
  //                             textAlign: TextAlign.center,
  //                           ),
  //                           SizedBox(height: 6.h),
  //                           Text(
  //                             content ??
  //                                 'dialog_service.please_check_internet_connection_and_try_again'
  //                                     .tr(),
  //                             style: AppStyles.body1
  //                                 .copyWith(fontWeight: FontWeight.w300),
  //                             textAlign: TextAlign.center,
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(height: 40.h),
  //                       ButtonDialog(
  //                         text:
  //                         contentBtn1 ?? 'dialog_service.back_to_home'.tr(),
  //                         bgColor: AppColors.main,
  //                         borderRadius: 24.r,
  //                         textStyle: AppStyles.button1
  //                             .copyWith(color: AppColors.white),
  //                         buttonFn: () {
  //                           getIt<EventBus>().fire(ChangeHomePage(0));
  //                           pushToHome = true;
  //                           if (canPopNotify.value == true) {
  //                             canPopNotify.value = false;
  //                           }
  //                           canPopNotify.value = true;
  //                         },
  //                       ),
  //                       SizedBox(height: 8.h),
  //                       ButtonDialog(
  //                         text: contentBtn2 ?? 'dialog_service.retry'.tr(),
  //                         bgColor: AppColors.white,
  //                         borderRadius: 24.r,
  //                         textStyle:
  //                         AppStyles.button1.copyWith(color: AppColors.main),
  //                         buttonFn: () async {
  //                           DialogService.showLoadingDialog(context);
  //                           await Future.delayed(
  //                             const Duration(seconds: 3),
  //                                 () {
  //                               if (context.mounted) {
  //                                 DialogService.hideLoadingDialog(context);
  //                               }
  //                               if (canPop && context.mounted) {
  //                                 context.router.maybePop();
  //                               }
  //                             },
  //                           );
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           });
  //     },
  //   );
  // }
  //
  //
  // static Future<void> showDialogDisconnect(
  //     BuildContext context, {
  //       String? title,
  //       String? content,
  //       String? contentBtn1,
  //     }) {
  //   return BaseDialog.oneOptionDialog(
  //     context: context,
  //     image: Assets.icon.noInternet.svg(
  //       height: 70.h,
  //       width: 70.w,
  //     ),
  //     title: title ?? 'dialog_service.lost_internet_connection'.tr(),
  //     titleStyle: AppStyles.titleDetail
  //         .copyWith(fontSize: 24.sp, color: AppColors.main),
  //     description: content ??
  //         'dialog_service.please_select_exit_to_initialize_new_room_when_network_is_stable'
  //             .tr(),
  //     descriptionStyle: AppStyles.body1.copyWith(fontWeight: FontWeight.w300),
  //     contentButton: contentBtn1 ?? 'common.exit'.tr(),
  //     onTapFunc: () {
  //       DeviceTypeHandler.isMobile
  //           ? context.router.pushAndPopUntil(ModeBattleRoute(),
  //           predicate: (route) => route.settings.name == AppRoutesName.home)
  //           : context.router.replaceAll([HomeRoute()]);
  //     },
  //     colorButton: AppColors.main,
  //   );
  // }
}
