// Date: 10/09/2026
// Nội dung/Chức năng: Màn gia hạn / bàn giao bàn test ESL.
//
// Flow:
//   1. Mở màn → load lookup data (cache từ list) + currentUser.
//   2. User chọn loại (Gia hạn / Bàn giao) → bloc lưu vào form state.
//   3. Ngày bắt đầu lấy từ card (detail.endDate hoặc detail.startDate),
//      Ngày kết thúc = startDate + 7 ngày (readonly).
//   4. Nếu gia hạn → Người sử dụng = OwnerID hiện tại của card.
//      Nếu bàn giao → cho user chọn người mới.
//   5. Người duyệt lấy từ card.approverId (mặc định, vẫn cho chọn lại).
//   6. Submit → extendHandoverSubmit() gọi /ESLRegistration/extend-handover.
//
// Lưu ý: API trả về "Gửi yêu cầu thành công, đang chờ duyệt" —
// phiếu sau gia hạn sẽ có status = 0 (chờ duyệt), card sẽ được refresh.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/test_table_model.dart';
import '../bloc/test_table_bloc.dart';

/// Loại yêu cầu: gia hạn / bàn giao.
enum ExtendHandoverType {
  /// Gia hạn — giữ nguyên người sử dụng.
  extend(1, 'Gia hạn', Icons.update),

  /// Bàn giao — đổi người sử dụng.
  handover(2, 'Bàn giao', Icons.swap_horiz);

  final int apiValue;
  final String label;
  final IconData icon;
  const ExtendHandoverType(this.apiValue, this.label, this.icon);
}

class TestTableExtendHandoverScreen extends StatefulWidget {
  const TestTableExtendHandoverScreen({
    super.key,
    required this.registrationId,
    required this.cardItem,
  });

  /// Registration ID của phiếu cần gia hạn / bàn giao.
  final int registrationId;

  /// Card hiện tại (pre-populate form).
  final TestCardItem cardItem;

  @override
  State<TestTableExtendHandoverScreen> createState() =>
      _TestTableExtendHandoverScreenState();
}

class _TestTableExtendHandoverScreenState
    extends BaseShareState<TestTableExtendHandoverScreen, TestTableEvent,
        TestTableState, TestTableBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final TextEditingController _endDateController;
  late final TextEditingController _ownerController;
  late final TextEditingController _approverController;

  /// Loại yêu cầu đang chọn (mặc định: gia hạn).
  ExtendHandoverType _selectedType = ExtendHandoverType.extend;

  /// Ngày bắt đầu lấy từ card.
  late DateTime _startDate;

  /// Tổng số lần đăng ký + gia hạn + bàn giao. Mặc định luôn là 2/3.
  late final int _totalCount = 2;

  @override
  void initState() {
    super.initState();

    _endDateController = TextEditingController();
    _ownerController = TextEditingController();
    _approverController = TextEditingController();

    // Lấy startDate từ card.
    _startDate = _extractStartDate(widget.cardItem);

    // Đảm bảo có lookup data cho screen này (cache từ list).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const TestTableEvent.init());
    });
  }

  @override
  void dispose() {
    _endDateController.dispose();
    _ownerController.dispose();
    _approverController.dispose();
    super.dispose();
  }

  @override
  bool listenWhen(TestTableState previous, TestTableState current) {
    return false;
  }

  @override
  void listener(BuildContext context, TestTableState state) {}

  /// Lấy ngày bắt đầu từ card (ưu tiên detailEndDate để nối tiếp,
  /// fallback sang detailStartDate).
  DateTime _extractStartDate(TestCardItem item) {
    final src = item.detailEndDate ?? item.detailStartDate;
    if (src != null) {
      return DateTime(src.year, src.month, src.day);
    }
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// Đếm tổng số lần đăng ký + gia hạn + bàn giao từ DetailsJson.
  /// Nếu DetailsJson null/rỗng → mặc định 1 (chính phiếu hiện tại).
  int _extractDetailCount(TestCardItem item) {
    final raw = item.detailsJson;
    if (raw == null || raw.trim().isEmpty) return 1;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List) return decoded.length;
    } catch (_) {
      // fall-through
    }
    return 1;
  }

  /// Sync endDate controller khi startDate thay đổi (được gọi từ BlocListener
  /// khi state lookup data đổi — startDate chỉ thay đổi qua date picker).
  void _syncControllers(TestTableState state) {
    final endStr = DateFormat('dd/MM/yyyy')
        .format(_startDate.add(const Duration(days: 7)));
    _endDateController.text = endStr;

    // Owner — gia hạn: lấy từ card, bàn giao: để trống cho user chọn.
    if (_selectedType == ExtendHandoverType.extend) {
      final ownerId = widget.cardItem.ownerId;
      if (ownerId != null) {
        final picked = state.employee.firstWhere(
          (e) => (e.id ?? -1) == ownerId,
          orElse: () => EmployeeInfoItem(
            id: state.currentUser?.employeeId,
            code: state.currentUser?.code,
            fullName: state.currentUser?.fullName,
          ),
        );
        _ownerController.text =
            '${picked.code ?? ''} - ${picked.fullName ?? ''}'
                .trim()
                .replaceAll(RegExp(r'^-\s*|\s*-$'), '')
                .trim();
      }
    } else {
      // Bàn giao → để trống cho user chọn.
      _ownerController.text = '';
    }

    // Approver — mặc định từ card, vẫn cho chọn lại.
    final approverId = widget.cardItem.approverId;
    if (approverId != null) {
      final item = state.approver.firstWhere(
        (e) => (e.id ?? approverId) == approverId ||
            (e.userId ?? -1) == approverId,
        orElse: () => const ApproverItem(),
      );
      _approverController.text =
          '${item.code ?? ''} - ${item.fullName ?? ''}'
              .trim()
              .replaceAll(RegExp(r'^-\s*|\s*-$'), '')
              .trim();
    }
  }

  void _onChangeType(ExtendHandoverType? value) {
    if (value == null) return;
    setState(() => _selectedType = value);
    _syncControllers(bloc.state);
  }

  Future<void> _pickOwner() async {
    final items = bloc.state.employee;
    if (items.isEmpty) return;
    await openSelectBottomSheet<EmployeeInfoItem>(
      context: context,
      title: 'Chọn người sử dụng',
      items: items,
      displayText: (e) => '${e.code ?? ''} - ${e.fullName ?? ''}'.trim(),
      hintText: 'Tìm nhân viên...',
      onSelected: (item) {
        if (item.id == null) return;
        final display =
            '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        _ownerController.text = display;
      },
    );
  }

  Future<void> _pickApprover() async {
    final items = bloc.state.approver;
    if (items.isEmpty) return;
    await openSelectBottomSheet<ApproverItem>(
      context: context,
      title: 'Chọn người duyệt',
      items: items,
      displayText: (e) => '${e.code ?? ''} - ${e.fullName ?? ''}'.trim(),
      hintText: 'Tìm người duyệt...',
      onSelected: (item) {
        final display =
            '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        _approverController.text = display;
      },
    );
  }

  /// Đọc ownerId đã chọn từ controller — match code trong lookup employee.
  int? _resolveOwnerId() {
    final text = _ownerController.text.trim();
    if (text.isEmpty) return null;
    final picked = bloc.state.employee.firstWhere(
      (e) =>
          '${e.code ?? ''} - ${e.fullName ?? ''}'.trim() == text ||
          (e.fullName ?? '').trim() == text ||
          (e.code ?? '').trim() == text,
      orElse: () => const EmployeeInfoItem(),
    );
    return picked.id;
  }

  /// Đọc approverId đã chọn từ controller.
  int? _resolveApproverId() {
    final text = _approverController.text.trim();
    if (text.isEmpty) return null;
    final picked = bloc.state.approver.firstWhere(
      (e) =>
          '${e.code ?? ''} - ${e.fullName ?? ''}'.trim() == text ||
          (e.fullName ?? '').trim() == text ||
          (e.code ?? '').trim() == text,
      orElse: () => const ApproverItem(),
    );
    return picked.id ?? picked.userId;
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();

    final ownerId = _resolveOwnerId();
    if (ownerId == null) {
      showMessage(context, 'Vui lòng chọn người sử dụng',
          type: SnackBarType.error);
      return;
    }
    final approverId = _resolveApproverId();
    if (approverId == null) {
      showMessage(context, 'Vui lòng chọn người duyệt',
          type: SnackBarType.error);
      return;
    }

    final startDate = _dateOnly(_startDate);
    final endDate =
        _dateOnly(_startDate.add(const Duration(days: 7)));

    bloc.add(TestTableEvent.extendHandoverSubmit(
      registrationId: widget.registrationId,
      startDate: startDate,
      endDate: endDate,
      ownerId: ownerId,
      approverId: approverId,
      type: _selectedType.apiValue,
    ));
  }

  String _dateOnly(DateTime d) {
    final mm = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    return '${d.year}-$mm-$dd';
  }

  @override
  Widget renderUI(BuildContext context) {
    return PopScope(
      canPop: !bloc.state.isSubmitting,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        showMessage(
          context,
          'Đang gửi yêu cầu, vui lòng đợi...',
          type: SnackBarType.info,
        );
      },
      child: Stack(
        children: [
          _buildForm(context),

          // Sync controllers khi lookup đổi.
          BlocListener<TestTableBloc, TestTableState>(
            listenWhen: (prev, curr) =>
                prev.employee != curr.employee ||
                prev.approver != curr.approver ||
                prev.currentUser != curr.currentUser,
            listener: (context, state) => _syncControllers(state),
            child: const SizedBox.shrink(),
          ),

          // Feedback sau submit.
          BlocListener<TestTableBloc, TestTableState>(
            listenWhen: (p, c) =>
                p.extendHandoverSuccess != c.extendHandoverSuccess ||
                (p.extendHandoverError ?? '') != (c.extendHandoverError ?? '') ||
                p.isSubmitting != c.isSubmitting,
            listener: _handleFeedback,
            child: const SizedBox.shrink(),
          ),

          // Loading overlay.
          BlocBuilder<TestTableBloc, TestTableState>(
            buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
            builder: (context, state) {
              if (!state.isSubmitting) return const SizedBox.shrink();
              return Positioned.fill(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.45),
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      'assets/lotties/Loading.json',
                      width: 240,
                      height: 240,
                      repeat: true,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleFeedback(BuildContext context, TestTableState state) {
    if (state.extendHandoverSuccess) {
      showMessage(context, 'Gửi yêu cầu thành công, đang chờ duyệt',
          type: SnackBarType.success);
      bloc.add(const TestTableEvent.clearExtendHandoverFeedback());
      Future.microtask(() {
        if (mounted) context.pop(true);
      });
      return;
    }
    final err = state.extendHandoverError;
    if (err != null && err.isNotEmpty && !state.isSubmitting) {
      showMessage(context, err, type: SnackBarType.error);
      bloc.add(const TestTableEvent.clearExtendHandoverFeedback());
    }
  }

  Widget _buildForm(BuildContext context) {
    return BlocBuilder<TestTableBloc, TestTableState>(
      bloc: bloc,
      buildWhen: (prev, curr) =>
          prev.employee != curr.employee ||
          prev.approver != curr.approver ||
          prev.isSubmitting != curr.isSubmitting,
      builder: (context, state) {
        return BaseScaffold(
          backgroundColor: const Color(0xFFF4F7FB),
          appBar: AppBarCommon(
            title: const Text('Gia hạn / Bàn giao'),
            onBackTap: () => context.pop(false),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormCard(
                          title: 'Thông tin',
                          child: Column(
                            children: [
                              _buildCountBadge(),
                              const SizedBox(height: 12),
                              FormChoiceGroup<ExtendHandoverType>(
                                name: 'eh_type',
                                label: 'Loại yêu cầu',
                                icon: Icons.category_outlined,
                                isRequired: true,
                                initialValue: _selectedType,
                                onChanged: _onChangeType,
                                columns: 2,
                                options: const [
                                  FormChoiceOption(
                                    value: ExtendHandoverType.extend,
                                    label: 'Gia hạn',
                                  ),
                                  FormChoiceOption(
                                    value: ExtendHandoverType.handover,
                                    label: 'Bàn giao',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              FormDateTimePicker(
                                nameForm: 'eh_start_date',
                                nameTimePicker: 'eh_start_date_picker',
                                label: 'Ngày bắt đầu',
                                icon: Icons.calendar_today_outlined,
                                inputType: InputType.date,
                                format: DateFormat('dd/MM/yyyy'),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                                initialValue: _startDate,
                                isRequired: true,
                                onChanged: (v) {
                                  if (v == null) return;
                                  setState(() {
                                    _startDate = DateTime(
                                      v.year, v.month, v.day,
                                    );
                                  });
                                },
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                nameForm: 'eh_end_date',
                                nameTextField: 'eh_end_date_tf',
                                label: 'Ngày kết thúc',
                                icon: Icons.event_outlined,
                                enabled: false,
                                readOnly: true,
                                controller: _endDateController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        FormCard(
                          title: 'Thông tin đăng ký',
                          child: Column(
                            children: [
                              FormInputField(
                                nameForm: 'eh_owner',
                                nameTextField: 'eh_owner_tf',
                                label: 'Người sử dụng',
                                icon: Icons.person_outline,
                                readOnly: _selectedType ==
                                    ExtendHandoverType.extend,
                                controller: _ownerController,
                                isRequired: true,
                                onTap: _pickOwner,
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                nameForm: 'eh_approver',
                                nameTextField: 'eh_approver_tf',
                                label: 'Người duyệt',
                                icon: Icons.verified_user_outlined,
                                readOnly: true,
                                controller: _approverController,
                                isRequired: true,
                                onTap: _pickApprover,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: BlocBuilder<TestTableBloc, TestTableState>(
                  bloc: bloc,
                  buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
                  builder: (context, subState) {
                    return FormActions(
                      mode: FormActionMode.edit,
                      onCancel: () => context.pop(false),
                      onSave: subState.isSubmitting ? null : _onSubmit,
                      saveText: 'Gửi yêu cầu',
                      cancelText: 'Huỷ',
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Badge hiển thị số lần đăng ký / gia hạn / bàn giao: x/3.
  Widget _buildCountBadge() {
    final color = _totalCount >= 3 ? AppColors.alert : AppColors.primaryERP;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(Icons.replay_circle_filled_outlined, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Số lần đăng ký / gia hạn / bàn giao: $_totalCount/3',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
