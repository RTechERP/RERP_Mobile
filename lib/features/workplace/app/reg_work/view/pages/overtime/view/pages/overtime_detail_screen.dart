import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/overtime_model.dart';
import '../bloc/overtime_bloc.dart';
import '../widgets/overtime_add_constants.dart';
import '../widgets/overtime_slip_form_fields.dart';

class OvertimeDetailScreenPage extends StatefulWidget {
  const OvertimeDetailScreenPage({super.key, this.item});

  /// Item truyền từ list (dùng làm fallback khi API chưa load xong).
  final OvertimeItem? item;

  @override
  State<OvertimeDetailScreenPage> createState() =>
      _OvertimeDetailScreenPageState();
}

class _OvertimeDetailScreenPageState
    extends BaseState<OvertimeDetailScreenPage, OvertimeEvent, OvertimeState,
        OvertimeBloc> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _slipKey = 'det';

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc
        ..add(OvertimeEvent.fetchDetail(id: widget.item?.id ?? 0))
        ..add(const OvertimeEvent.initAdd());
    });
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  DateTime? _getSlipTimeStart() =>
      _formKey.currentState?.fields['ot_slip_${_slipKey}_time_start']?.value
          as DateTime?;

  double? _computeSlipHours() {
    final form = _formKey.currentState;
    if (form == null) return null;
    final ts =
        form.fields['ot_slip_${_slipKey}_time_start']?.value as DateTime?;
    final te = form.fields['ot_slip_${_slipKey}_time_end']?.value as DateTime?;
    if (ts == null || te == null) return null;
    final diff = te.difference(ts);
    return diff.isNegative ? null : diff.inMinutes / 60.0;
  }

  List<PlatformFile> _getAttachedFiles() {
    final v = _formKey.currentState?.fields['det_attachment']?.value;
    if (v is List<PlatformFile>) return v;
    return [];
  }

  bool _getIsProblem() =>
      (_formKey.currentState?.fields['det_is_problem']?.value as bool?) ??
      false;

  // ── Reactive callbacks ─────────────────────────────────────────────────────

  void _onSlipTimeStartChanged(String _, DateTime? __) => setState(() {});

  void _onSlipEndTimeChanged(String slipKey, DateTime? value) {
    if (value == null) {
      setState(() {});
      return;
    }
    final ts = _getSlipTimeStart();
    if (ts != null && !value.isAfter(ts)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _formKey.currentState
            ?.fields['ot_slip_${slipKey}_time_end']
            ?.didChange(null);
        context.showMessage(
          'Thời gian kết thúc phải sau thời gian bắt đầu',
          type: SnackBarType.error,
        );
      });
      setState(() {});
      return;
    }
    final isAt20OrAfter = value.hour >= 20;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final field =
          _formKey.currentState?.fields['ot_slip_${slipKey}_overnight'];
      final current = field?.value as bool? ?? false;
      if (isAt20OrAfter && !current) field?.didChange(true);
      if (!isAt20OrAfter && current) field?.didChange(false);
    });
    setState(() {});
  }

  void _onSlipOvernightChanged(String slipKey, bool? value) {
    if (value != true) return;
    final te = _formKey.currentState
        ?.fields['ot_slip_${slipKey}_time_end']
        ?.value as DateTime?;
    if (te != null && te.hour < 20) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _formKey.currentState
            ?.fields['ot_slip_${slipKey}_overnight']
            ?.didChange(false);
        context.showMessage(
          'Phụ cấp ăn tối chỉ hỗ trợ từ 20:00',
          type: SnackBarType.error,
        );
      });
    }
  }

  // ── Bottom sheets ──────────────────────────────────────────────────────────

  Future<void> _openApproverSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;
    final items =
        bloc.state.approvers.where((e) => e.isDeleted != true).toList();
    if (items.isEmpty) {
      context.showMessage('Chưa có người kiểm duyệt',
          type: SnackBarType.error);
      return;
    }
    await openSelectBottomSheet<ApproverItem>(
      context: context,
      title: 'Chọn người duyệt',
      items: items,
      displayText: (a) => '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
      onSelected: (a) {
        final id = approvedOvertimePayloadValue(a);
        form.fields['det_approver_id']?.didChange(id.toString());
        form.fields['det_approver_text']
            ?.didChange('${a.code ?? ''} - ${a.fullName ?? ''}'.trim());
        setState(() {});
      },
    );
  }

  Future<void> _openTypeSheet(String slipKey) async {
    final form = _formKey.currentState;
    if (form == null) return;
    final items =
        bloc.state.overtimeTypes.where((e) => e.isDeleted != true).toList();
    if (items.isEmpty) {
      context.showMessage('Chưa có loại làm thêm', type: SnackBarType.error);
      return;
    }
    await openSelectBottomSheet<OvertimeType>(
      context: context,
      title: 'Chọn loại làm thêm',
      items: items,
      displayText: (o) => o.type ?? '',
      onSelected: (o) {
        form.fields['ot_slip_${slipKey}_type_id']?.didChange(o.id.toString());
        form.fields['ot_slip_${slipKey}_type_text']?.didChange(o.type ?? '');
        setState(() {});
      },
    );
  }

  Future<void> _openProjectSheet(String slipKey) async {
    final form = _formKey.currentState;
    if (form == null) return;
    final items =
        bloc.state.overtimeProjects.where((e) => e.isDeleted != true).toList();
    if (items.isEmpty) {
      context.showMessage('Chưa có dự án', type: SnackBarType.error);
      return;
    }
    await openSelectBottomSheet<OvertimeProject>(
      context: context,
      title: 'Chọn dự án',
      items: items,
      displayText: (p) =>
          '${p.projectCode ?? ''} - ${p.projectName ?? ''}'.trim(),
      onSelected: (p) {
        form.fields['ot_slip_${slipKey}_project_id']
            ?.didChange(p.id.toString());
        form.fields['ot_slip_${slipKey}_project_text']
            ?.didChange(p.projectName ?? '');
        setState(() {});
      },
    );
  }

  // ── Submit ─────────────────────────────────────────────────────────────────

  void _onSave(OvertimeDetailItem detail) {
    FocusScope.of(context).unfocus();
    final formState = _formKey.currentState;
    if (formState == null) return;
    formState.save();
    final values = formState.value;

    final isProblem = _getIsProblem();
    final attachedFiles = _getAttachedFiles();
    final dateRegister = detail.dateRegister ?? DateTime.now();

    final ts = values['ot_slip_${_slipKey}_time_start'] as DateTime?;
    final te = values['ot_slip_${_slipKey}_time_end'] as DateTime?;
    final typeId =
        int.tryParse('${values['ot_slip_${_slipKey}_type_id'] ?? ''}') ?? 0;
    final location =
        int.tryParse('${values['ot_slip_${_slipKey}_location_id'] ?? ''}') ??
            0;
    final projectId =
        int.tryParse('${values['ot_slip_${_slipKey}_project_id'] ?? ''}');
    final overnight =
        (values['ot_slip_${_slipKey}_overnight'] as bool?) ?? false;
    final reason = '${values['ot_slip_${_slipKey}_reason'] ?? ''}'.trim();

    final err = ValidateHelper.validateOvertimeAddSubmit(
      approverIdRaw: '${values['det_approver_id'] ?? ''}',
      dateRegister: dateRegister,
      isProblem: isProblem,
      slips: [
        (
          timeStart: ts,
          endTime: te,
          typeId: typeId,
          location: location,
          projectId: projectId,
          overnight: overnight,
          reason: reason,
        ),
      ],
      hasAttachment: attachedFiles.isNotEmpty,
      departmentId: null,
    );

    // Validate form first (inline errors)
    if (!formState.validate()) {
      FormHelper.focusFirstError(formState: formState);

      context.showMessage(
        'Vui lòng điền đầy đủ thông tin các phiếu',
        type: SnackBarType.error,
      );
      return;
    }

    // Then check complex logic from helper
    if (err != null) {
      context.showMessage(err, type: SnackBarType.error);
      return;
    }

    formState.save();

    Map<String, String?>? fileInfo;
    if (attachedFiles.isNotEmpty) {
      fileInfo = {
        'fileName': attachedFiles.first.name,
        'originPath': attachedFiles.first.path,
      };
    }

    bloc.add(OvertimeEvent.submitEdit(
      id: detail.id ?? 0,
      approvedId:
          int.tryParse('${values['det_approver_id'] ?? ''}'.trim()) ?? 0,
      dateRegister: dateRegister,
      isProblem: isProblem,
      slip: OvertimeAddSlip(
        timeStart: ts!,
        endTime: te!,
        typeId: typeId,
        location: location,
        overnight: overnight,
        reason: reason,
        projectId: projectId,
      ),
      fileInfo: fileInfo,
    ));
  }

  // ── Label lookup helpers ───────────────────────────────────────────────────

  String _approverText(OvertimeState state, int? approvedId) {
    if (approvedId == null) return '';
    for (final a in state.approvers) {
      if (approvedOvertimePayloadValue(a) == approvedId) {
        return '${a.code ?? ''} - ${a.fullName ?? ''}'.trim();
      }
    }
    return '';
  }

  String _typeLabel(OvertimeState state, int? typeId) {
    if (typeId == null) return '';
    for (final t in state.overtimeTypes) {
      if (t.id == typeId) return t.type ?? '';
    }
    return '';
  }

  String _projectLabel(OvertimeState state, int? projectId) {
    if (projectId == null) return '';
    for (final p in state.overtimeProjects) {
      if (p.id == projectId) return p.projectName ?? '';
    }
    return '';
  }

  // ── renderUI ──────────────────────────────────────────────────────────────

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
      BlocListener<OvertimeBloc, OvertimeState>(
        listenWhen: (p, c) =>
            p.editSuccess != c.editSuccess ||
            (c.message != null &&
                c.message!.isNotEmpty &&
                p.message != c.message &&
                !c.isSubmitting),
        listener: (ctx, state) {
          if (state.editSuccess) {
            bloc.add(const OvertimeEvent.clearSubmitState());
            context.showMessage(
                state.message ?? 'Cập nhật thành công',
                type: SnackBarType.success);
            Future.delayed(
                const Duration(milliseconds: 300), () {
              if (mounted) context.pop(true);
            });
            return;
          }
          if (state.status == BaseStateStatus.failed &&
              (state.message ?? '').isNotEmpty &&
              !state.isSubmitting) {
            context.showMessage(state.message!, type: SnackBarType.error);
          }
        },
        child: BlocBuilder<OvertimeBloc, OvertimeState>(
        buildWhen: (p, c) =>
            p.detailItem != c.detailItem ||
            p.isFetchingDetail != c.isFetchingDetail ||
            p.isSubmitting != c.isSubmitting ||
            p.approvers != c.approvers ||
            p.overtimeTypes != c.overtimeTypes ||
            p.overtimeProjects != c.overtimeProjects,
        builder: (context, state) {
          // Đợi cả detail lẫn dropdown data sẵn sàng rồi mới render form.
          final dropdownsReady = state.approvers.isNotEmpty ||
              state.overtimeTypes.isNotEmpty;
          if (state.isFetchingDetail || !dropdownsReady) {
            return BaseScaffold(
              appBar: AppBarCommon(title: const Text('Chi tiết đơn tăng ca')),
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          final detail = state.detailItem;
          if (detail == null) {
            return BaseScaffold(
              appBar: AppBarCommon(title: const Text('Chi tiết đơn tăng ca')),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Không tải được dữ liệu'),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () => bloc.add(
                          OvertimeEvent.fetchDetail(id: widget.item?.id ?? 0)),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              ),
            );
          }

          return BaseScaffold(
            appBar: AppBarCommon(
              onBackTap: () => context.pop(),
              title: const Text('Chi tiết đơn tăng ca'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: () => setState(() {}),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // ── Card 1: Thông tin tăng ca ──────────────
                            FormCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 4),

                                  // Ngày đăng ký (readonly)
                                  FormReadonlyField(
                                    name: 'det_date_display',
                                    label: 'Ngày đăng ký *', // Manually added asterisk for consistency
                                    icon: Icons.date_range_outlined,
                                    initialValue: detail.dateRegister,
                                    valueTransformer: (v) => v is DateTime
                                        ? DateFormat('dd/MM/yyyy').format(v)
                                        : '—',
                                  ),
                                  const SizedBox(height: 12),

                                  // Người duyệt
                                  FormBuilderField<String>(
                                    name: 'det_approver_id',
                                    initialValue:
                                        detail.approvedId?.toString() ?? '',
                                    builder: (_) => const SizedBox.shrink(),
                                  ),
                                  GestureDetector(
                                    onTap: state.status ==
                                            BaseStateStatus.loading
                                        ? null
                                        : _openApproverSheet,
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        readOnly: true,
                                        nameForm: 'det_approver_text',
                                        nameTextField: 'det_approver_text_tf',
                                        label: 'Người duyệt',
                                        icon: Icons.person_outlined,
                                        initialValue:
                                            _approverText(state, detail.approvedId),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        isRequired: true,
                                        validator: (v) {
                                          if (v == null || v.isEmpty) return 'Vui lòng chọn người duyệt';
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // Checkbox bổ sung
                                  FormCheckbox(
                                    name: 'det_is_problem',
                                    initialValue: detail.isProblem ?? false,
                                    title: const Text(
                                      'Đăng ký bổ sung',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    onChanged: (value) {
                                      if (value == true &&
                                          !state
                                              .isSupplementaryRegistrationOpen) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) return;
                                          _formKey.currentState
                                              ?.fields['det_is_problem']
                                              ?.didChange(false);
                                        });
                                        context.showMessage(
                                          'Nhân sự chưa mở đăng ký bổ sung',
                                          type: SnackBarType.error,
                                        );
                                        return;
                                      }
                                      setState(() {});
                                    },
                                  ),

                                  // File đính kèm
                                  FormFilePicker(
                                    name: 'det_attachment',
                                    label:
                                        'File đính kèm${_getIsProblem() ? ' (bắt buộc)' : ''}',
                                    icon: Icons.attach_file_outlined,
                                    allowMultiple: true,
                                    onChanged: (_) => setState(() {}),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),

                            // ── Card 2: Thông tin công việc ────────────
                            FormCard(
                              title: 'Thông tin đăng ký',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 4),
                                  OvertimeSlipFormFields(
                                    slipKey: _slipKey,
                                    dateRegister:
                                        detail.dateRegister ?? DateTime.now(),
                                    onTypeTap: _openTypeSheet,
                                    onProjectTap: _openProjectSheet,
                                    computedHours: _computeSlipHours(),
                                    initialTimeStart: detail.timeStart,
                                    initialTimeEnd: detail.endTime,
                                    initialTypeId: detail.typeId,
                                    initialTypeLabel: _typeLabel(state, detail.typeId),
                                    initialLocationId: detail.location,
                                    initialProjectId: detail.projectId,
                                    initialProjectLabel: _projectLabel(state, detail.projectId),
                                    initialReason: detail.reason,
                                    initialOvernight: detail.overnight ?? false,
                                    onTimeStartChanged: _onSlipTimeStartChanged,
                                    onEndTimeChanged: _onSlipEndTimeChanged,
                                    onOvernightChanged: _onSlipOvernightChanged,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),

                    // ── Actions ──────────────────────────────────────────
                    FormActions(
                      mode: FormActionMode.edit,
                      saveEnabled: !state.isSubmitting,
                      onCancel: () => context.pop(),
                      onSave: state.isSubmitting ? null : () => _onSave(detail),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      ),

      // Loading overlay khi submit
      BlocBuilder<OvertimeBloc, OvertimeState>(
        buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
        builder: (context, state) {
          if (!state.isSubmitting) return const SizedBox.shrink();
          return Positioned.fill(
            child: AbsorbPointer(
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
    );
  }
}
