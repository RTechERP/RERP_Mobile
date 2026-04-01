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
import '../../../../../../../../../common/extensions/number_extension.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/work_trip_model.dart';
import '../bloc/work_trip_bloc.dart';
import '../widgets/work_trip_add_constants.dart';

class WorkTripDetailScreen extends StatefulWidget {
  const WorkTripDetailScreen({super.key, this.item});

  final WorkTripItem? item;

  @override
  State<WorkTripDetailScreen> createState() => _WorkTripDetailScreenState();
}

class _WorkTripDetailScreenState
    extends BaseState<WorkTripDetailScreen, WorkTripEvent, WorkTripState,
        WorkTripBloc> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _detailApplied = false;

  // ── Reactive state ─────────────────────────────────────────────────────────
  int? _selectedTypeId;
  String _selectedTypeName = '';
  double _selectedTypeCost = 0;

  bool _workEarly = false;
  int _overnightType = 0;
  String _overnightLabel = 'Không có';

  int? _selectedProjectId;
  String _selectedProjectText = '';

  // ── Computed ───────────────────────────────────────────────────────────────
  double get _earlyDepartFee => _workEarly ? 50000.0 : 0.0;
  double get _overnightFee => _overnightType > 0 ? 35000.0 : 0.0;
  double get _totalCost => _selectedTypeCost + _earlyDepartFee + _overnightFee;

  bool get _submitEnabled {
    final form = _formKey.currentState;
    if (form == null) return false;
    form.save();
    final v = form.value;
    final approverId = '${v['wtd_approver_id'] ?? ''}'.trim();
    final date = v['wtd_date_register'] as DateTime?;
    final location = '${v['wtd_location'] ?? ''}'.trim();
    final reason = '${v['wtd_reason'] ?? ''}'.trim();
    return approverId.isNotEmpty &&
        date != null &&
        _selectedTypeId != null &&
        location.isNotEmpty &&
        reason.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final id = widget.item?.id;
      if (id == null) return;
      bloc.add(const WorkTripEvent.clearSubmitState());
      if (bloc.state.approvers.isEmpty) {
        bloc.add(const WorkTripEvent.initAdd());
      }
      bloc.add(WorkTripEvent.fetchDetail(id: id));
    });
  }

  // ── Apply detail data khi load xong ───────────────────────────────────────

  void _applyDetail(WorkTripDetailItem detail, WorkTripState state) {
    if (_detailApplied) return;
    _detailApplied = true;
    setState(() {
      _selectedTypeId = detail.typeBusiness;
      _selectedTypeName = _typeName(state, detail.typeBusiness);
      _selectedTypeCost = detail.costBussiness ?? 0;
      _workEarly = detail.workEarly ?? false;
      _overnightType = detail.overnightType ?? 0;
      _overnightLabel = _dinnerLabel(detail.overnightType ?? 0);
      _selectedProjectId = detail.projectId;
      _selectedProjectText = _projectName(state, detail.projectId);
    });
  }

  // ── Lookup helpers ─────────────────────────────────────────────────────────

  String _approverName(WorkTripState state, int? approvedId) {
    if (approvedId == null) return widget.item?.approvedName ?? '';
    try {
      final found = state.approvers.firstWhere(
        (a) => (a.employeeId ?? a.id) == approvedId || a.id == approvedId,
      );
      return '${found.code ?? ''} - ${found.fullName ?? ''}'.trim();
    } catch (_) {
      return widget.item?.approvedName ?? '';
    }
  }

  String _typeName(WorkTripState state, int? typeBusiness) {
    if (typeBusiness == null) return widget.item?.typeName ?? '';
    try {
      final found =
          state.workTripTypes.firstWhere((t) => t.id == typeBusiness);
      return found.typeName ?? widget.item?.typeName ?? '';
    } catch (_) {
      return widget.item?.typeName ?? '';
    }
  }

  String _projectName(WorkTripState state, int? projectId) {
    if (projectId == null || projectId == 0) return '';
    try {
      final found =
          state.workTripProjects.firstWhere((p) => p.id == projectId);
      return '${found.projectCode ?? ''} - ${found.projectName ?? ''}'.trim();
    } catch (_) {
      return widget.item?.projectText ?? '';
    }
  }

  String _dinnerLabel(int overnightType) {
    try {
      return kDinnerAllowanceOptions
          .firstWhere((o) => o.value == overnightType)
          .label;
    } catch (_) {
      return 'Không có';
    }
  }

  // ── Bottom sheets ──────────────────────────────────────────────────────────

  Future<void> _openApproverSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;
    await openSelectBottomSheet<ApproverItem>(
      context: context,
      title: 'Chọn người duyệt',
      items: bloc.state.approvers,
      displayText: (a) => '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
      onSelected: (a) {
        final id = approvedWorkTripPayloadValue(a);
        final label = '${a.code ?? ''} - ${a.fullName ?? ''}'.trim();
        form.fields['wtd_approver_id']?.didChange(id.toString());
        form.fields['wtd_approver_text']?.didChange(label);
        setState(() {});
      },
    );
  }

  Future<void> _openTypeSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;
    await openSelectBottomSheet<WorkTripTypeItem>(
      context: context,
      title: 'Chọn loại công tác',
      items: bloc.state.workTripTypes,
      displayText: (t) => t.typeName ?? '',
      onSelected: (t) {
        setState(() {
          _selectedTypeId = t.id;
          _selectedTypeName = t.typeName ?? '';
          _selectedTypeCost = t.cost ?? 0;
        });
        form.fields['wtd_type_id']?.didChange(t.id.toString());
        form.fields['wtd_type_text']?.didChange(t.typeName ?? '');
      },
    );
  }

  Future<void> _openProjectSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;
    await openSelectBottomSheet<WorkTripProject>(
      context: context,
      title: 'Chọn dự án',
      items: bloc.state.workTripProjects,
      displayText: (p) =>
          '${p.projectCode ?? ''} - ${p.projectName ?? ''}'.trim(),
      onSelected: (p) {
        final text =
            '${p.projectCode ?? ''} - ${p.projectName ?? ''}'.trim();
        setState(() {
          _selectedProjectId = p.id;
          _selectedProjectText = text;
        });
        form.fields['wtd_project_id']?.didChange(p.id.toString());
        form.fields['wtd_project_text']?.didChange(text);
      },
    );
  }

  Future<void> _openDinnerAllowanceSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;
    await openSelectBottomSheet<DinnerAllowanceOption>(
      context: context,
      title: 'Phụ cấp ăn tối',
      items: kDinnerAllowanceOptions,
      displayText: (o) => o.label,
      onSelected: (o) {
        setState(() {
          _overnightType = o.value;
          _overnightLabel = o.label;
        });
        form.fields['wtd_overnight_type']?.didChange(o.value.toString());
        form.fields['wtd_overnight_text']?.didChange(o.label);
      },
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  bool _getIsProblem() {
    final v =
        _formKey.currentState?.fields['wtd_is_problem']?.value as bool?;
    return v ?? false;
  }

  List<PlatformFile> _getAttachedFiles() {
    final v = _formKey.currentState?.fields['wtd_attachment']?.value;
    if (v is List<PlatformFile>) return v;
    return [];
  }

  void _onSave(WorkTripDetailItem detail) {
    FocusScope.of(context).unfocus();
    final formState = _formKey.currentState;
    if (formState == null) return;
    if (!_submitEnabled) {
      context.showMessage(
        'Vui lòng điền đầy đủ: Người duyệt, Ngày đăng ký, Loại công tác, Địa điểm, Lý do công tác',
        type: SnackBarType.error,
      );
      return;
    }
    formState.save();
    final v = formState.value;

    final approverId =
        int.tryParse('${v['wtd_approver_id'] ?? ''}'.trim()) ?? 0;
    final dateRegister = v['wtd_date_register'] as DateTime;
    final location = '${v['wtd_location'] ?? ''}'.trim();
    final notCheckIn = (v['wtd_not_check_in'] as bool?) ?? true;
    final isProblem = (v['wtd_is_problem'] as bool?) ?? false;
    final reason = '${v['wtd_reason'] ?? ''}'.trim();
    final note = '${v['wtd_note'] ?? ''}'.trim();

    final attachedFiles = _getAttachedFiles();
    Map<String, String?>? fileInfo;
    if (attachedFiles.isNotEmpty) {
      final f = attachedFiles.first;
      fileInfo = {'fileName': f.name, 'originPath': f.path};
    }

    bloc.add(
      WorkTripEvent.editSubmit(
        id: detail.id,
        data: WorkTripSubmitData(
          approvedId: approverId,
          dayBussiness: dateRegister,
          isProblem: isProblem,
          typeBusiness: _selectedTypeId!,
          location: location,
          projectId: _selectedProjectId,
          costBussiness: _selectedTypeCost,
          // Giữ nguyên phí phương tiện gốc từ API
          costVehicleOverride: detail.costVehicle ?? 0,
          notCheckIn: notCheckIn,
          workEarly: _workEarly,
          overnightType: _overnightType,
          reason: reason,
          note: note,
          fileInfo: fileInfo,
        ),
      ),
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<WorkTripBloc, WorkTripState>(
      listenWhen: (p, c) =>
          p.editSuccess != c.editSuccess ||
          p.message != c.message ||
          p.status != c.status ||
          (p.detailItem == null && c.detailItem != null),
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed &&
            (state.message ?? '').isNotEmpty) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
        if (state.editSuccess && (state.message ?? '').isNotEmpty) {
          context.showMessage(state.message!, type: SnackBarType.success);
        }
        if (state.editSuccess) {
          bloc.add(const WorkTripEvent.clearSubmitState());
          GoRouter.of(context).pop(true);
        }
        if (state.detailItem != null) {
          _applyDetail(state.detailItem!, state);
        }
      },
      child: BlocBuilder<WorkTripBloc, WorkTripState>(
        builder: (context, state) {
          final detail = state.detailItem;
          final isLoading = state.isFetchingDetail || detail == null;

          return Stack(
            children: [
              BaseScaffold(
                appBar: AppBarCommon(
                  title: const Text('Chi tiết đơn công tác'),
                ),
                body: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(12),
                        child: FormBuilder(
                          key: _formKey,
                          onChanged: () => setState(() {}),
                          child: Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      _buildCard1(state, detail),
                                      const SizedBox(height: 8),
                                      _buildCard2(state, detail),
                                      const SizedBox(height: 12),
                                    ],
                                  ),
                                ),
                              ),
                              FormActions(
                                mode: FormActionMode.edit,
                                saveEnabled: _submitEnabled,
                                onCancel: () => GoRouter.of(context).pop(),
                                onSave: () => _onSave(detail),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),

              // Loading overlay khi đang cập nhật
              BlocBuilder<WorkTripBloc, WorkTripState>(
                buildWhen: (p, c) => p.isEditing != c.isEditing,
                builder: (context, state) {
                  if (!state.isEditing) return const SizedBox.shrink();
                  return Positioned.fill(
                    child: AbsorbPointer(
                      child: Container(
                        color: Colors.black.withOpacity(0.45),
                        alignment: Alignment.center,
                        child: Lottie.asset(
                          'assets/lotties/Loading.json',
                          width: 220,
                          height: 220,
                          repeat: true,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  // ── Card 1 ─────────────────────────────────────────────────────────────────

  Widget _buildCard1(WorkTripState state, WorkTripDetailItem detail) {
    final approverName = _approverName(state, detail.approvedId);
    final approverIdStr = detail.approvedId?.toString() ?? '';

    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),

          // Ngày đăng ký
          FormDateTimePicker(
            nameForm: 'wtd_date_register',
            nameTimePicker: 'wtd_date_register_inner',
            label: 'Ngày đăng ký',
            icon: Icons.date_range_outlined,
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            initialValue: detail.dayBussiness,
            initialDate: detail.dayBussiness,
            autovalidateMode: AutovalidateMode.disabled,
          ),
          const SizedBox(height: 12),

          // Người duyệt
          FormBuilderField<String>(
            name: 'wtd_approver_id',
            initialValue: approverIdStr,
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: state.status == BaseStateStatus.loading
                ? null
                : _openApproverSheet,
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: 'wtd_approver_text',
                nameTextField: 'wtd_approver_text_tf',
                label: 'Người duyệt',
                icon: Icons.person_outlined,
                initialValue: approverName,
                autovalidateMode: AutovalidateMode.disabled,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Đăng ký bổ sung
          FormCheckbox(
            name: 'wtd_is_problem',
            initialValue: detail.isProblem ?? false,
            title: const Text(
              'Đăng ký bổ sung',
              style: TextStyle(fontSize: 14),
            ),
            onChanged: (value) {
              if (value == true &&
                  !state.isSupplementaryRegistrationOpen) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!mounted) return;
                  _formKey.currentState
                      ?.fields['wtd_is_problem']
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
          const SizedBox(height: 8),
          FormFilePicker(
            name: 'wtd_attachment',
            label:
                'File đính kèm${_getIsProblem() ? ' (bắt buộc)' : ''}',
            icon: Icons.attach_file_outlined,
            allowMultiple: true,
            onChanged: (_) => setState(() {}),
          ),
        ],
      ),
    );
  }

  // ── Card 2 ─────────────────────────────────────────────────────────────────

  Widget _buildCard2(WorkTripState state, WorkTripDetailItem detail) {
    return FormCard(
      title: 'Thông tin công tác',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),

          // Dự án
          FormBuilderField<String>(
            name: 'wtd_project_id',
            initialValue: detail.projectId?.toString() ?? '',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: _openProjectSheet,
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: 'wtd_project_text',
                nameTextField: 'wtd_project_text_tf',
                label: 'Dự án',
                icon: Icons.work_outline,
                initialValue: _selectedProjectText,
                autovalidateMode: AutovalidateMode.disabled,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Địa điểm
          FormInputField(
            nameForm: 'wtd_location',
            nameTextField: 'wtd_location_tf',
            label: 'Địa điểm',
            icon: Icons.location_on_outlined,
            initialValue: detail.location ?? '',
            autovalidateMode: AutovalidateMode.disabled,
          ),
          const SizedBox(height: 12),

          // Loại công tác
          FormBuilderField<String>(
            name: 'wtd_type_id',
            initialValue: _selectedTypeId?.toString() ?? '',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: _openTypeSheet,
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: 'wtd_type_text',
                nameTextField: 'wtd_type_text_tf',
                label: 'Loại công tác',
                icon: Icons.category_outlined,
                initialValue: _selectedTypeName,
                autovalidateMode: AutovalidateMode.disabled,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Phí công tác (readonly, reactive)
          _ReadonlyMoneyField(
            icon: Icons.monetization_on_outlined,
            label: 'Phí công tác',
            value: _selectedTypeCost,
          ),
          const SizedBox(height: 12),

          // Phí phương tiện (readonly, từ detail)
          _ReadonlyMoneyField(
            icon: Icons.directions_car_outlined,
            label: 'Phí phương tiện',
            value: detail.costVehicle ?? 0,
          ),
          const SizedBox(height: 8),

          // Không chấm công tại VP
          FormCheckbox(
            name: 'wtd_not_check_in',
            initialValue: detail.notChekIn ?? true,
            title: const Text(
              'Không chấm công tại VP',
              style: TextStyle(fontSize: 14),
            ),
          ),

          // Xuất phát trước 7h15 + phí
          Row(
            children: [
              Expanded(
                child: FormCheckbox(
                  name: 'wtd_work_early',
                  initialValue: detail.workEarly ?? false,
                  title: const Text(
                    'Xuất phát trước 07h15',
                    style: TextStyle(fontSize: 13),
                  ),
                  onChanged: (v) => setState(() => _workEarly = v ?? false),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ReadonlyMoneyField(
                  icon: Icons.alarm_outlined,
                  label: 'Bổ sung',
                  value: _earlyDepartFee,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Phụ cấp ăn tối
          FormBuilderField<String>(
            name: 'wtd_overnight_type',
            initialValue: _overnightType.toString(),
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: _openDinnerAllowanceSheet,
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: 'wtd_overnight_text',
                nameTextField: 'wtd_overnight_text_tf',
                label: 'Phụ cấp ăn tối',
                icon: Icons.restaurant_outlined,
                initialValue: _overnightLabel,
                autovalidateMode: AutovalidateMode.disabled,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Tổng chi phí
          _TotalCostRow(total: _totalCost),
          const SizedBox(height: 12),

          // Lý do công tác
          FormInputField(
            nameForm: 'wtd_reason',
            nameTextField: 'wtd_reason_tf',
            label: 'Lý do công tác',
            icon: Icons.note_alt_outlined,
            initialValue: detail.reason ?? '',
            maxLines: 2,
            autovalidateMode: AutovalidateMode.disabled,
          ),
          const SizedBox(height: 12),

          // Ghi chú
          FormInputField(
            nameForm: 'wtd_note',
            nameTextField: 'wtd_note_tf',
            label: 'Ghi chú',
            icon: Icons.edit_note_outlined,
            initialValue: detail.note ?? '',
            maxLines: 2,
            autovalidateMode: AutovalidateMode.disabled,
          ),
        ],
      ),
    );
  }
}

// ── Helper widgets (identical to add screen) ───────────────────────────────────

class _ReadonlyMoneyField extends StatelessWidget {
  const _ReadonlyMoneyField({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
                Text(
                  '${value.toInt().formatVND} đ',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalCostRow extends StatelessWidget {
  const _TotalCostRow({required this.total});

  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryERP.withOpacity(0.07),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryERP.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.calculate_outlined, size: 16, color: AppColors.primaryERP),
          const SizedBox(width: 6),
          Text(
            'Tổng chi phí: ',
            style: TextStyle(fontSize: 13, color: AppColors.primaryERP),
          ),
          Text(
            '${total.toInt().formatVND} đ',
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
