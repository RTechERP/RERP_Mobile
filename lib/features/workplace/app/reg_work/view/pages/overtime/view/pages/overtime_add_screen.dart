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
import '../../../../../../../../../common/helpers/validate_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/overtime_model.dart';
import '../bloc/overtime_bloc.dart';
import '../widgets/overtime_add_constants.dart';
import '../widgets/overtime_slip_form_fields.dart';

class OvertimeAddScreenPage extends StatefulWidget {
  const OvertimeAddScreenPage({super.key});

  @override
  State<OvertimeAddScreenPage> createState() => _OvertimeAddScreenPageState();
}

class _OvertimeAddScreenPageState
    extends BaseState<OvertimeAddScreenPage, OvertimeEvent, OvertimeState,
        OvertimeBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final DateTime _todayStart;
  late final List<String> _slipKeys;
  int _selectedSlipIndex = 0;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);
    _slipKeys = ['k_${now.millisecondsSinceEpoch}'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const OvertimeEvent.clearSubmitState());
      bloc.add(const OvertimeEvent.initAdd());
    });
  }

  int get _safeSlipIndex {
    if (_slipKeys.isEmpty) return 0;
    if (_selectedSlipIndex < 0) return 0;
    if (_selectedSlipIndex >= _slipKeys.length) return _slipKeys.length - 1;
    return _selectedSlipIndex;
  }

  // ── Date register helper ──────────────────────────────────────────────
  DateTime _getDateRegister() {
    final v = _formKey.currentState?.fields['ot_date_register']?.value;
    if (v is DateTime) return v;
    return _todayStart;
  }

  DateTime _defaultSlipTimeStart() {
    final base = _getDateRegister();
    return DateTime(base.year, base.month, base.day, 18, 0);
  }

  // ── Tab helpers ───────────────────────────────────────────────────────
  void _addSlip() {
    setState(() {
      _slipKeys.add(
        'k_${DateTime.now().microsecondsSinceEpoch}_${_slipKeys.length}',
      );
      _selectedSlipIndex = _slipKeys.length - 1;
    });
  }

  void _removeSlipAt(int index) {
    if (_slipKeys.length <= 1 || index < 0 || index >= _slipKeys.length) {
      return;
    }
    setState(() {
      _slipKeys.removeAt(index);
      if (_selectedSlipIndex >= _slipKeys.length) {
        _selectedSlipIndex = _slipKeys.length - 1;
      } else if (index < _selectedSlipIndex) {
        _selectedSlipIndex -= 1;
      }
    });
  }

  void _selectSlip(int index) {
    if (index < 0 || index >= _slipKeys.length) return;
    setState(() => _selectedSlipIndex = index);
  }

  String _slipTabLabel(int index) => 'Phiếu ${index + 1}';

  // ── Hours calculation ─────────────────────────────────────────────────
  double? _computeSlipHours(String slipKey) {
    final form = _formKey.currentState;
    if (form == null) return null;
    final start =
        form.fields['ot_slip_${slipKey}_time_start']?.value as DateTime?;
    final end =
        form.fields['ot_slip_${slipKey}_time_end']?.value as DateTime?;
    if (start == null || end == null) return null;
    final diff = end.difference(start);
    if (diff.isNegative) return null;
    return diff.inMinutes / 60.0;
  }

  double _computeTotalHours() {
    double total = 0;
    for (final key in _slipKeys) {
      final h = _computeSlipHours(key);
      if (h != null && h > 0) total += h;
    }
    return total;
  }

  DateTime? _getSlipTimeStart(String slipKey) =>
      _formKey.currentState?.fields['ot_slip_${slipKey}_time_start']?.value
          as DateTime?;

  // ── Reactive callbacks ────────────────────────────────────────────────

  /// Khi ô "Từ" thay đổi — chỉ rebuild để cập nhật firstDate của ô "Đến".
  void _onSlipTimeStartChanged(String slipKey, DateTime? value) {
    setState(() {});
  }

  /// Khi ô "Đến" thay đổi:
  /// - Nếu ≤ "Từ" → xoá và báo lỗi.
  /// - Nếu > 20:00 → auto-tick phụ cấp ăn tối.
  void _onSlipEndTimeChanged(String slipKey, DateTime? value) {
    if (value == null) {
      setState(() {});
      return;
    }

    final ts = _getSlipTimeStart(slipKey);

    // Kiểm tra endTime phải sau startTime
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

    // >= 20:00 → auto-tick; < 20:00 → auto-untick
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

  /// Khi user bật checkbox "Phụ cấp ăn tối" thủ công:
  /// nếu "Đến" < 20:00 → revert + báo lỗi.
  void _onSlipOvernightChanged(String slipKey, bool? value) {
    if (value != true) return;
    final te = _formKey.currentState
        ?.fields['ot_slip_${slipKey}_time_end']
        ?.value as DateTime?;
    if (te == null) return;
    if (te.hour < 20) {
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

  // ── Collect slip rows for validate ────────────────────────────────────
  List<OvertimeAddSlipRow> _collectSlipRows(Map<String, dynamic> values) {
    return [
      for (final key in _slipKeys)
        (
          timeStart:
              values['ot_slip_${key}_time_start'] as DateTime?,
          endTime: values['ot_slip_${key}_time_end'] as DateTime?,
          typeId:
              int.tryParse('${values['ot_slip_${key}_type_id'] ?? ''}') ?? 0,
          location: int.tryParse(
                  '${values['ot_slip_${key}_location_id'] ?? ''}') ??
              0,
          projectId:
              int.tryParse('${values['ot_slip_${key}_project_id'] ?? ''}'),
          overnight: (values['ot_slip_${key}_overnight'] as bool?) ?? false,
          reason: '${values['ot_slip_${key}_reason'] ?? ''}'.trim(),
        ),
    ];
  }

  bool _computeSubmitEnabled() {
    final form = _formKey.currentState;
    if (form == null) return false;
    form.save();
    final v = form.value;
    return ValidateHelper.isOvertimeAddSubmitEnabled(
      approverIdRaw: '${v['ot_approver_id'] ?? ''}',
      dateRegister: v['ot_date_register'] as DateTime?,
      slips: _collectSlipRows(v),
    );
  }

  bool _getIsProblem() {
    final v =
        _formKey.currentState?.fields['ot_is_problem']?.value as bool?;
    return v ?? false;
  }

  List<PlatformFile> _getAttachedFiles() {
    final v = _formKey.currentState?.fields['ot_attachment']?.value;
    if (v is List<PlatformFile>) return v;
    return [];
  }

  // ── Bottom sheets ─────────────────────────────────────────────────────
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
      onSelected: (item) {
        final idValue = approvedOvertimePayloadValue(item);
        final line = '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        form.fields['ot_approver_id']?.didChange(idValue.toString());
        form.fields['ot_approver_text']?.didChange(line);
        setState(() {});
      },
    );
  }

  Future<void> _openTypeSheet(String slipKey) async {
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.overtimeTypes
        .where((e) => e.isDeleted != true)
        .toList();
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
        form.fields['ot_slip_${slipKey}_type_id']
            ?.didChange(o.id.toString());
        form.fields['ot_slip_${slipKey}_type_text']?.didChange(o.type ?? '');
        setState(() {});
      },
    );
  }

  Future<void> _openLocationSheet(String slipKey) async {
    final form = _formKey.currentState;
    if (form == null) return;

    await openSelectBottomSheet<OvertimeLocationOption>(
      context: context,
      title: 'Chọn địa điểm',
      items: kOvertimeLocationOptions,
      displayText: (o) => o.label,
      onSelected: (o) {
        form.fields['ot_slip_${slipKey}_location_id']
            ?.didChange(o.value.toString());
        form.fields['ot_slip_${slipKey}_location_text']
            ?.didChange(o.label);
        setState(() {});
      },
    );
  }

  Future<void> _openProjectSheet(String slipKey) async {
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.overtimeProjects
        .where((e) => e.isDeleted != true)
        .toList();
    if (items.isEmpty) {
      context.showMessage('Chưa có danh sách dự án', type: SnackBarType.error);
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

  // ── Submit ────────────────────────────────────────────────────────────
  void _onSubmit(OvertimeState state) {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;
    if (!_computeSubmitEnabled()) return;
    formState.save();

    final values = formState.value;
    final isProblem = (values['ot_is_problem'] as bool?) ?? false;
    final attachedFiles = _getAttachedFiles();

    final err = ValidateHelper.validateOvertimeAddSubmit(
      approverIdRaw: '${values['ot_approver_id'] ?? ''}',
      dateRegister: values['ot_date_register'] as DateTime?,
      isProblem: isProblem,
      slips: _collectSlipRows(values),
      hasAttachment: attachedFiles.isNotEmpty,
      departmentId: null,
    );
    if (err != null) {
      context.showMessage(err, type: SnackBarType.error);
      return;
    }

    final approvedId =
        int.tryParse('${values['ot_approver_id'] ?? ''}'.trim()) ?? 0;
    final dateRegister = values['ot_date_register'] as DateTime;

    final slips = <OvertimeAddSlip>[];
    for (final key in _slipKeys) {
      final ts = values['ot_slip_${key}_time_start'] as DateTime;
      final te = values['ot_slip_${key}_time_end'] as DateTime;
      final typeId =
          int.tryParse('${values['ot_slip_${key}_type_id'] ?? ''}') ?? 0;
      final location =
          int.tryParse('${values['ot_slip_${key}_location_id'] ?? ''}') ?? 0;
      final projectId =
          int.tryParse('${values['ot_slip_${key}_project_id'] ?? ''}');
      final overnight =
          (values['ot_slip_${key}_overnight'] as bool?) ?? false;
      final reason =
          '${values['ot_slip_${key}_reason'] ?? ''}'.trim();

      slips.add(OvertimeAddSlip(
        timeStart: ts,
        endTime: te,
        typeId: typeId,
        location: location,
        overnight: overnight,
        reason: reason,
        projectId: projectId,
      ));
    }

    Map<String, String?>? fileInfo;
    if (attachedFiles.isNotEmpty) {
      final f = attachedFiles.first;
      fileInfo = {'fileName': f.name, 'originPath': f.path};
    }

    bloc.add(OvertimeEvent.submitBatch(
      approvedId: approvedId,
      dateRegister: dateRegister,
      isProblem: isProblem,
      slips: slips,
      fileInfo: fileInfo,
    ));
  }

  // ── UI ────────────────────────────────────────────────────────────────
  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<OvertimeBloc, OvertimeState>(
          listenWhen: (p, c) =>
              p.submitSuccess != c.submitSuccess ||
              p.message != c.message ||
              p.status != c.status,
          listener: (context, state) {
            if (state.status == BaseStateStatus.failed &&
                (state.message ?? '').isNotEmpty &&
                !state.isSubmitting) {
              context.showMessage(state.message!, type: SnackBarType.error);
            }
            if ((state.message ?? '').isNotEmpty && state.submitSuccess) {
              context.showMessage(state.message!, type: SnackBarType.success);
            }
            if (state.submitSuccess) {
              bloc.add(const OvertimeEvent.clearSubmitState());
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Tạo đơn làm thêm giờ'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: BlocBuilder<OvertimeBloc, OvertimeState>(
                builder: (context, state) {
                  final submitOk = _computeSubmitEnabled();

                  return FormBuilder(
                    key: _formKey,
                    onChanged: () => setState(() {}),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // ── Card 1: Thông tin tăng ca ──────────
                                FormCard(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),

                                      // Ngày đăng ký
                                      FormDateTimePicker(
                                        nameForm: 'ot_date_register',
                                        nameTimePicker:
                                            'ot_date_register_inner',
                                        label: 'Ngày đăng ký',
                                        icon: Icons.date_range_outlined,
                                        inputType: InputType.date,
                                        format: DateFormat('dd/MM/yyyy'),
                                        initialValue: _todayStart,
                                        initialDate: _todayStart,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                      ),
                                      const SizedBox(height: 12),

                                      // Người duyệt
                                      FormBuilderField<String>(
                                        name: 'ot_approver_id',
                                        initialValue: '',
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        builder: (_) =>
                                            const SizedBox.shrink(),
                                      ),
                                      GestureDetector(
                                        onTap: state.status ==
                                                BaseStateStatus.loading
                                            ? null
                                            : _openApproverSheet,
                                        child: AbsorbPointer(
                                          child: FormInputField(
                                            readOnly: true,
                                            nameForm: 'ot_approver_text',
                                            nameTextField:
                                                'ot_approver_text_tf',
                                            label: 'Người duyệt',
                                            icon: Icons.person_outlined,
                                            initialValue: '',
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),

                                      // Checkbox bổ sung
                                      FormCheckbox(
                                        name: 'ot_is_problem',
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
                                              _formKey.currentState?.fields[
                                                      'ot_is_problem']
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
                                        name: 'ot_attachment',
                                        label: 'File đính kèm'
                                            '${_getIsProblem() ? ' (bắt buộc)' : ''}',
                                        icon: Icons.attach_file_outlined,
                                        allowMultiple: true,
                                        onChanged: (_) => setState(() {}),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // ── Card 2: Thông tin công việc ────────
                                FormCard(
                                  title: 'Thông tin đăng ký',
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),

                                      // Tổng số giờ OT
                                      _TotalHoursRow(
                                        totalHours: _computeTotalHours(),
                                      ),
                                      const SizedBox(height: 8),

                                      _OvertimeSlipTabsBar(
                                        labels: List.generate(
                                          _slipKeys.length,
                                          _slipTabLabel,
                                        ),
                                        selectedIndex: _safeSlipIndex,
                                        onSelect: _selectSlip,
                                        onRemoveAt: _removeSlipAt,
                                        onAdd: _addSlip,
                                      ),
                                      const SizedBox(height: 12),
                                      IndexedStack(
                                        index: _safeSlipIndex,
                                        sizing: StackFit.loose,
                                        children: [
                                          for (final key in _slipKeys)
                                            OvertimeSlipFormFields(
                                              slipKey: key,
                                              dateRegister: _getDateRegister(),
                                              onTypeTap: _openTypeSheet,
                                              onLocationTap: _openLocationSheet,
                                              onProjectTap: _openProjectSheet,
                                              computedHours:
                                                  _computeSlipHours(key),
                                              initialTimeStart:
                                                  _defaultSlipTimeStart(),
                                              onTimeStartChanged:
                                                  _onSlipTimeStartChanged,
                                              onEndTimeChanged:
                                                  _onSlipEndTimeChanged,
                                              onOvernightChanged:
                                                  _onSlipOvernightChanged,
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                        ),
                        FormActions(
                          mode: FormActionMode.add,
                          submitEnabled: submitOk,
                          onSubmit: () => _onSubmit(state),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // Loading overlay
        BlocBuilder<OvertimeBloc, OvertimeState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) return const SizedBox.shrink();
            return Positioned.fill(
              child: AbsorbPointer(
                child: Container(
                  color: Colors.black.withOpacity(0.45),
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

/// Hiển thị tổng số giờ OT.
class _TotalHoursRow extends StatelessWidget {
  const _TotalHoursRow({required this.totalHours});

  final double totalHours;

  @override
  Widget build(BuildContext context) {
    final _s = totalHours.toStringAsFixed(2).replaceAll(RegExp(r'0+$'), '');
    final text = _s.endsWith('.') ? _s.substring(0, _s.length - 1) : _s;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryERP.withOpacity(0.07),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryERP.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.access_time_rounded,
              size: 16, color: AppColors.primaryERP),
          const SizedBox(width: 6),
          Text(
            'Tổng số giờ OT: ',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.primaryERP,
            ),
          ),
          Text(
            '$text giờ',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryERP,
            ),
          ),
        ],
      ),
    );
  }
}

/// Tab bar nội bộ.
class _OvertimeSlipTabsBar extends StatelessWidget {
  const _OvertimeSlipTabsBar({
    required this.labels,
    required this.selectedIndex,
    required this.onSelect,
    required this.onRemoveAt,
    required this.onAdd,
  });

  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onSelect;
  final void Function(int) onRemoveAt;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => onSelect(i),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: i == selectedIndex
                        ? AppColors.primaryERP.withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: i == selectedIndex
                          ? AppColors.primaryERP
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        labels[i],
                        style: TextStyle(
                          fontSize: 13,
                          color: i == selectedIndex
                              ? AppColors.primaryERP
                              : Colors.black87,
                          fontWeight: i == selectedIndex
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                      if (labels.length > 1) ...[
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () => onRemoveAt(i),
                          child: const Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          IconButton(
            onPressed: onAdd,
            icon: const Icon(Icons.add_circle_outline),
            color: AppColors.primaryERP,
          ),
        ],
      ),
    );
  }
}
