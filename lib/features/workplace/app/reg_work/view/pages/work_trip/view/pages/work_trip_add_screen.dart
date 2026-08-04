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
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/work_trip_model.dart';
import '../bloc/work_trip_bloc.dart';
import '../widgets/work_trip_add_constants.dart';

/// Department IDs thuộc nhóm Sale — dùng để hiển thị các field liên quan
/// đến Phiếu đặt xe / Tên khách hàng / Tên công ty / Chủ động phương tiện.
const _kSaleDepartmentIds = <int>{3, 28, 29, 30, 12, 13};

bool _isSaleDepartment(WorkTripState state) {
  final deptId = state.currentEmployee?.departmentId;
  if (deptId == null) return false;
  return _kSaleDepartmentIds.contains(deptId);
}

class WorkTripAddScreenPage extends StatefulWidget {
  const WorkTripAddScreenPage({super.key, this.copyFrom});

  /// Dữ liệu sao chép từ đơn cũ (nếu có).
  final WorkTripDetailItem? copyFrom;

  @override
  State<WorkTripAddScreenPage> createState() => _WorkTripAddScreenPageState();
}

class _WorkTripAddScreenPageState
    extends BaseState<WorkTripAddScreenPage, WorkTripEvent, WorkTripState,
        WorkTripBloc> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _autoValidate = false;

  /// Timer ID để huỷ warning khi API hoàn tất trước ngưỡng timeout.
  bool _timeoutWarningShown = false;

  late final DateTime _todayStart;

  // ── Reactive state ─────────────────────────────────────────────────────────
  int? _selectedTypeId;
  String _selectedTypeName = '';
  double _selectedTypeCost = 0;

  List<WorkTripVehicleEntry> _selectedVehicles = [];
  double _computedVehicleCost = 0;
  bool _defaultVehicleSet = false;

  bool _workEarly = false;
  int _overnightType = 0;
  String _overnightLabel = 'Không có';

  int? _selectedProjectId;
  String _selectedProjectText = '';

  bool _copyApplied = false;

  // ── Booking vehicle state ──────────────────────────────────────────────────
  WorkTripSelfVehicle? _selectedBookingVehicle;
  String _customerName = '';
  String _companyName = '';
  bool _selfVehicle = false;
  /// Trạng thái checkbox — độc lập để reactive khi có phiếu đặt xe.
  bool _checkboxSelfVehicle = false;
  bool _hasBookingVehicle() => _selectedBookingVehicle != null;

  // ── Computed ───────────────────────────────────────────────────────────────
  double get _earlyDepartFee => _workEarly ? 50000.0 : 0.0;
  double get _overnightFee => _overnightType > 0 ? 35000.0 : 0.0;
  double get _totalCost =>
      _selectedTypeCost + _effectiveVehicleCost + _earlyDepartFee + _overnightFee;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const WorkTripEvent.clearSubmitState());
      bloc.add(const WorkTripEvent.initAdd());
      bloc.add(const WorkTripEvent.loadBookingVehicleList());
    });
  }

  /// Tính phí phương tiện: 0 nếu checkbox "Chủ động phương tiện" được tick
  /// hoặc có phiếu đặt xe (lúc này checkbox đã auto-check).
  double get _effectiveVehicleCost {
    if (_selfVehicle || _hasBookingVehicle()) {
      return 0;
    }
    return _computedVehicleCost;
  }

  /// Hiển thị text phương tiện:
  /// - Thuộc Sale và tick "Chủ động phương tiện" / có phiếu đặt xe → "Chủ động phương tiện".
  /// - Ngược lại → danh sách phương tiện đã chọn.
  String get _vehicleDisplayText {
    if (_hasBookingVehicle() ||
        (_isSaleDepartment(bloc.state) && _selfVehicle)) {
      return 'Chủ động phương tiện';
    }
    if (_selectedVehicles.isEmpty) {
      return '';
    }
    return _selectedVehicles.map((v) => v.displayName).join(', ');
  }

  void _startTimeoutWarning() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      if (!_timeoutWarningShown && bloc.state.isSubmitting) {
        _timeoutWarningShown = true;
        if (mounted) {
          context.showMessage(
            'Yêu cầu đang được xử lý, vui lòng đợi...',
            type: SnackBarType.info,
          );
        }
      }
    });
  }

  // ── Bottom sheets ──────────────────────────────────────────────────────────

  Future<void> _openApproverSheet() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.approvers
        .where((e) => e.isDeleted != true)
        .toList();
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
        final idValue = approvedWorkTripPayloadValue(item);
        final line = '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        form.fields['wt_approver_id']?.didChange(idValue.toString());
        form.fields['wt_approver_text']?.didChange(line);
        setState(() {});
      },
    );
  }

  Future<void> _openProjectSheet() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.workTripProjects
        .where((e) => e.isDeleted != true)
        .toList();
    if (items.isEmpty) {
      context.showMessage('Chưa có danh sách dự án', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<WorkTripProject>(
      context: context,
      title: 'Chọn dự án',
      items: items,
      displayText: (p) =>
          '${p.projectCode ?? ''} - ${p.projectName ?? ''}'.trim(),
      onSelected: (p) {
        setState(() {
          _selectedProjectId = p.id;
          _selectedProjectText =
              '${p.projectCode ?? ''} - ${p.projectName ?? ''}'.trim();
        });
        form.fields['wt_project_id']?.didChange(p.id.toString());
        form.fields['wt_project_text']?.didChange(_selectedProjectText);
      },
    );
  }

  Future<void> _openTypeSheet() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.workTripTypes
        .where((e) => e.isDeleted != true)
        .toList();
    if (items.isEmpty) {
      context.showMessage('Chưa có loại công tác', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<WorkTripTypeItem>(
      context: context,
      title: 'Chọn loại công tác',
      items: items,
      displayText: (t) => t.typeName ?? '',
      onSelected: (t) {
        setState(() {
          _selectedTypeId = t.id;
          _selectedTypeName = t.typeName ?? '';
          _selectedTypeCost = t.cost ?? 0;
        });
        form.fields['wt_type_id']?.didChange(t.id.toString());
        form.fields['wt_type_text']?.didChange(t.typeName ?? '');
      },
    );
  }

  Future<void> _openBookingVehicleSheet() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final items = bloc.state.selfVehicleList;
    if (items.isEmpty) {
      context.showMessage('Chưa có phiếu đặt xe', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<WorkTripSelfVehicle>(
      context: context,
      title: 'Chọn phiếu đặt xe',
      items: items,
      displayText: (item) => item.displayLabel ?? '',
      onSelected: (item) {
        setState(() {
          _selectedBookingVehicle = item;
          _customerName = item.companyNameArrives ?? '';
          _companyName = item.companyNameArrives ?? '';
          _selfVehicle = true;
          _checkboxSelfVehicle = true;
          _selectedVehicles = [];
          _computedVehicleCost = 0;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final form = _formKey.currentState;
          form?.fields['wt_self_vehicle']?.didChange(true);
          form?.fields['wt_customer_name']?.didChange(item.companyNameArrives ?? '');
          form?.fields['wt_company_name']?.didChange(item.companyNameArrives ?? '');
          form?.fields['wt_location']?.didChange(
            item.specificDestinationAddress ?? item.province ?? '',
          );
        });
      },
    );
  }

  void _clearBookingVehicle() {
    // Lưu lại danh sách vehicle để restore "Ô tô công ty"
    final vehicles = bloc.state.workTripVehicles;
    setState(() {
      _selectedBookingVehicle = null;
      _customerName = '';
      _companyName = '';
      _selfVehicle = false;
      _checkboxSelfVehicle = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final form = _formKey.currentState;
      form?.fields['wt_self_vehicle']?.didChange(false);
      form?.fields['wt_customer_name']?.didChange('');
      form?.fields['wt_company_name']?.didChange('');
      form?.fields['wt_location']?.didChange('');
      // Restore "Ô tô công ty" khi xoá phiếu đặt xe
      _applyDefaultVehicle(vehicles);
    });
  }

  /// Áp dụng vehicle mặc định (Ô tô công ty) vào form.
  /// Dùng chung cho cả clear phiếu đặt xe và tick/untick checkbox.
  void _applyDefaultVehicle(List<WorkTripTypeVehicle> vehicles) {
    if (vehicles.isEmpty) return;

    const companyCarKeywords = [
      'ô tô công ty',
      'xe công ty',
      'oto cong ty',
      'o to cong ty',
      'xe cong ty',
    ];

    WorkTripTypeVehicle? found;
    for (final keyword in companyCarKeywords) {
      try {
        found = vehicles.firstWhere(
          (v) => (v.vehicleName ?? '').toLowerCase().contains(keyword),
        );
        break;
      } catch (_) {}
    }
    found ??= vehicles.firstWhere(
      (v) => (v.id) > 0,
      orElse: () => vehicles.first,
    );

    final vehicle = found;
    final entry = WorkTripVehicleEntry(
      vehicleTypeId: vehicle.id,
      vehicleName: vehicle.vehicleName ?? '',
      cost: vehicle.cost ?? 0,
      editCost: vehicle.editCost ?? false,
    );
    setState(() {
      _selectedVehicles = [entry];
      _computedVehicleCost = vehicle.cost ?? 0;
    });
    _formKey.currentState?.fields['wt_vehicle_text']?.didChange(vehicle.vehicleName ?? '');
  }

  /// Tự động chọn "Ô tô công ty" khi danh sách vehicles được tải lần đầu.
  void _setDefaultVehicle(List<WorkTripTypeVehicle> vehicles) {
    if (vehicles.isEmpty) return;
    // Cho phép re-set khi user đã bỏ tick trước đó (selectedVehicles trống).
    if (_defaultVehicleSet && _selectedVehicles.isNotEmpty) return;

    const companyCarKeywords = [
      'ô tô công ty',
      'xe công ty',
      'oto cong ty',
      'o to cong ty',
      'xe cong ty',
    ];

    WorkTripTypeVehicle? found;
    for (final keyword in companyCarKeywords) {
      try {
        found = vehicles.firstWhere(
          (v) => (v.vehicleName ?? '').toLowerCase().contains(keyword),
        );
        break;
      } catch (_) {}
    }
    // Fallback: chọn vehicle thực đầu tiên (id > 0)
    found ??= vehicles.firstWhere(
      (v) => (v.id) > 0,
      orElse: () => vehicles.first,
    );

    final vehicle = found;
    setState(() {
      _defaultVehicleSet = true;
      _selectedVehicles = [
        WorkTripVehicleEntry(
          vehicleTypeId: vehicle.id,
          vehicleName: vehicle.vehicleName ?? '',
          cost: vehicle.cost ?? 0,
          editCost: vehicle.editCost ?? false,
        ),
      ];
      _computedVehicleCost = vehicle.cost ?? 0;
    });
  }

  /// Áp dụng dữ liệu sao chép vào form sau khi lookup lists đã được tải.
  void _applyCopyFrom(WorkTripState state) {
    final copy = widget.copyFrom;
    if (copy == null) return;
    final form = _formKey.currentState;
    if (form == null) return;

    // Người duyệt
    try {
      final approver = state.approvers.firstWhere(
        (a) => (a.employeeId ?? a.id) == copy.approvedId || a.id == copy.approvedId,
      );
      final id = approvedWorkTripPayloadValue(approver);
      final label = '${approver.code ?? ''} - ${approver.fullName ?? ''}'.trim();
      form.fields['wt_approver_id']?.didChange(id.toString());
      form.fields['wt_approver_text']?.didChange(label);
    } catch (_) {}

    // Địa điểm
    form.fields['wt_location']?.didChange(copy.location ?? '');

    // Loại công tác
    try {
      final type = state.workTripTypes.firstWhere((t) => t.id == copy.typeBusiness);
      setState(() {
        _selectedTypeId = type.id;
        _selectedTypeName = type.typeName ?? '';
        _selectedTypeCost = type.cost ?? 0;
      });
      form.fields['wt_type_id']?.didChange(type.id.toString());
      form.fields['wt_type_text']?.didChange(type.typeName ?? '');
    } catch (_) {}

    // Xuất phát trước 7h15
    final workEarly = copy.workEarly ?? false;
    setState(() => _workEarly = workEarly);
    form.fields['wt_work_early']?.didChange(workEarly);

    // Phụ cấp ăn tối
    final overnightType = copy.overnightType ?? 0;
    final overnightOpt = kDinnerAllowanceOptions.firstWhere(
      (o) => o.value == overnightType,
      orElse: () => kDinnerAllowanceOptions.first,
    );
    setState(() {
      _overnightType = overnightType;
      _overnightLabel = overnightOpt.label;
    });
    form.fields['wt_overnight_type']?.didChange(overnightType);
    form.fields['wt_overnight_text']?.didChange(overnightOpt.label);

    // Dự án
    if (copy.projectId != null && copy.projectId != 0) {
      try {
        final project = state.workTripProjects.firstWhere(
          (p) => p.id == copy.projectId,
        );
        final projectText =
            '${project.projectCode ?? ''} - ${project.projectName ?? ''}'.trim();
        setState(() {
          _selectedProjectId = project.id;
          _selectedProjectText = projectText;
        });
        form.fields['wt_project_id']?.didChange(project.id.toString());
        form.fields['wt_project_text']?.didChange(projectText);
      } catch (_) {}
    }

    // Lý do công tác
    form.fields['wt_reason']?.didChange(copy.reason ?? '');
    form.fields['wt_note']?.didChange(copy.note ?? '');
  }

  Future<void> _openVehicleDialog() async {
    final vehicles = _vehicleListWithOther();
    final result = await DialogService.showVehicle(
      context: context,
      vehicleTypes: vehicles,
      initialEntries: _selectedVehicles,
    );
    if (result == null) return;
    setState(() {
      _selectedVehicles = result;
      _computedVehicleCost =
          result.fold(0.0, (sum, v) => sum + v.cost);
    });
  }

  /// Luôn đảm bảo danh sách phương tiện có "Phương tiện khác" ở cuối.
  List<WorkTripTypeVehicle> _vehicleListWithOther() {
    final base = List<WorkTripTypeVehicle>.from(bloc.state.workTripVehicles);
    final hasOther = base.any(
      (v) =>
          (v.vehicleName ?? '').toLowerCase().contains('khác') ||
          (v.vehicleName ?? '').toLowerCase().contains('khac') ||
          (v.vehicleName ?? '').toLowerCase().contains('other'),
    );
    if (!hasOther) {
      base.add(const WorkTripTypeVehicle(
        id: -1,
        vehicleName: 'Phương tiện khác',
        cost: 0,
        editCost: false,
        isDeleted: false,
      ));
    }
    return base;
  }

  // ── Validation / submit ────────────────────────────────────────────────────
  bool _getIsProblem() {
    final v =
        _formKey.currentState?.fields['wt_is_problem']?.value as bool?;
    return v ?? false;
  }

  List<PlatformFile> _getAttachedFiles() {
    final v = _formKey.currentState?.fields['wt_attachment']?.value;
    if (v is List<PlatformFile>) return v;
    return [];
  }

  void _onSubmit(WorkTripState state) {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;

    if (!formState.validate()) {
      if (!_autoValidate) setState(() => _autoValidate = true);
      FormHelper.focusFirstError(formState: formState);
      return;
    }
    formState.save();

    final values = formState.value;
    final approverId =
        int.tryParse('${values['wt_approver_id'] ?? ''}'.trim()) ?? 0;
    final dateRegister = values['wt_date_register'] as DateTime;
    final location = '${values['wt_location'] ?? ''}'.trim();
    final notCheckIn = (values['wt_not_check_in'] as bool?) ?? false;
    final isProblem = _getIsProblem();
    final reason = '${values['wt_reason'] ?? ''}'.trim();
    final note = '${values['wt_note'] ?? ''}'.trim();

    final attachedFiles = _getAttachedFiles();
    Map<String, String?>? fileInfo;
    if (attachedFiles.isNotEmpty) {
      final f = attachedFiles.first;
      fileInfo = {'fileName': f.name, 'originPath': f.path};
    }

    _startTimeoutWarning();
    bloc.add(
      WorkTripEvent.submit(
        WorkTripSubmitData(
          approvedId: approverId,
          dayBussiness: dateRegister,
          isProblem: isProblem,
          typeBusiness: _selectedTypeId!,
          location: location,
          projectId: _selectedProjectId,
          costBussiness: _selectedTypeCost,
          vehicles: _selectedVehicles,
          notCheckIn: notCheckIn,
          workEarly: _workEarly,
          overnightType: _overnightType,
          reason: reason,
          note: note,
          fileInfo: fileInfo,
          bookingVehicleId: _selectedBookingVehicle?.id,
          customerName: _customerName,
          companyName: _companyName,
          selfVehicle: _selfVehicle,
        ),
      ),
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        MultiBlocListener(
          listeners: [
            BlocListener<WorkTripBloc, WorkTripState>(
              listenWhen: (p, c) =>
                  p.submitSuccess != c.submitSuccess ||
                  p.message != c.message ||
                  p.status != c.status ||
                  (p.workTripVehicles.isEmpty && c.workTripVehicles.isNotEmpty) ||
                  (p.approvers.isEmpty && c.approvers.isNotEmpty) ||
                  (p.workTripTypes.isEmpty && c.workTripTypes.isNotEmpty),
              listener: (context, state) {
                // Reset timeout warning flag khi trạng thái submit thay đổi
                if (!state.isSubmitting) {
                  _timeoutWarningShown = false;
                }
                if (state.status == BaseStateStatus.failed &&
                    (state.message ?? '').isNotEmpty &&
                    !state.isSubmitting) {
                  context.showMessage(state.message!, type: SnackBarType.error);
                }
                if ((state.message ?? '').isNotEmpty && state.submitSuccess) {
                  context.showMessage(state.message!, type: SnackBarType.success);
                }
                // Chỉ thoát khi submitSuccess và message chính xác
                if (state.submitSuccess &&
                    state.message == 'Tạo đơn công tác thành công') {
                  bloc.add(const WorkTripEvent.clearSubmitState());
                  context.pop(true);
                }
                // Tự động chọn "Ô tô công ty" khi vehicles được tải lần đầu
                if (!_defaultVehicleSet && state.workTripVehicles.isNotEmpty) {
                  _setDefaultVehicle(state.workTripVehicles);
                }
                // Áp dụng dữ liệu sao chép sau khi lookup lists đã sẵn sàng
                if (!_copyApplied &&
                    widget.copyFrom != null &&
                    state.approvers.isNotEmpty &&
                    state.workTripTypes.isNotEmpty) {
                  _copyApplied = true;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted) return;
                    _applyCopyFrom(state);
                  });
                }
              },
            ),
            BlocListener<WorkTripBloc, WorkTripState>(
              listenWhen: (previous, current) =>
                  previous.approveId != current.approveId ||
                  previous.approvers != current.approvers,
              listener: (context, state) {
                if (state.approveId != null && state.approvers.isNotEmpty) {
                  final form = _formKey.currentState;
                  if (form == null) return;

                  final targetId = state.approveId!.approveId;
                  final match = state.approvers.cast<ApproverItem?>().firstWhere(
                    (a) {
                      if (a == null || a.isDeleted == true) return false;
                      final idValue = a.employeeId ?? a.id;
                      return idValue == targetId;
                    },
                    orElse: () => null,
                  );

                  if (match != null) {
                    final idValue = match.employeeId ?? match.id;
                    final line =
                        '${match.code ?? ''} - ${match.fullName ?? ''}'.trim();
                    form.fields['wt_approver_id']?.didChange(idValue.toString());
                    form.fields['wt_approver_text']?.didChange(line);
                    setState(() {});
                  }
                }
              },
            ),
          ],
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Tạo đơn công tác'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: BlocBuilder<WorkTripBloc, WorkTripState>(
                builder: (context, state) {
                  return FormBuilder(
                    key: _formKey,
                    autovalidateMode: _autoValidate
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    onChanged: () => setState(() {}),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // ── Card 1: Thông tin đăng ký ──────────
                                _buildCard1(state),
                                const SizedBox(height: 8),

                                // ── Card 2: Thông tin công tác ─────────
                                _buildCard2(state),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                        ),
                        FormActions(
                          mode: FormActionMode.add,
                          submitEnabled: true,
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

        // ── Loading overlay ──────────────────────────────────────────────
        BlocBuilder<WorkTripBloc, WorkTripState>(
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

  // ── Card 1: Người duyệt, ngày, bổ sung, file ──────────────────────────────

  Widget _buildCard1(WorkTripState state) {
    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),

          // Ngày đăng ký
          FormDateTimePicker(
            nameForm: 'wt_date_register',
            nameTimePicker: 'wt_date_register_inner',
            label: 'Ngày đăng ký',
            icon: Icons.date_range_outlined,
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            initialValue: _todayStart,
            initialDate: _todayStart,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            validator: (v) {
              if (v == null) return 'Vui lòng chọn ngày đăng ký';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Người duyệt (hidden id + display text)
          FormBuilderField<String>(
            name: 'wt_approver_id',
            initialValue: '',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          FormInputField(
            readOnly: true,
            nameForm: 'wt_approver_text',
            nameTextField: 'wt_approver_text_tf',
            label: 'Người duyệt',
            icon: Icons.person_outlined,
            initialValue: '',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            onTap: state.status == BaseStateStatus.loading ? null : _openApproverSheet,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Vui lòng chọn người duyệt';
              return null;
            },
          ),
          const SizedBox(height: 8),

          // Checkbox đăng ký bổ sung
          FormCheckbox(
            name: 'wt_is_problem',
            title: const Text(
              'Đăng ký bổ sung',
              style: TextStyle(fontSize: 14),
            ),
            onChanged: (value) {
              if (value == true &&
                  !state.isSupplementaryRegistrationOpen) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!mounted) return;
                  _formKey.currentState?.fields['wt_is_problem']
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
            name: 'wt_attachment',
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

  // ── Card 2: Thông tin công tác ─────────────────────────────────────────────

  Widget _buildCard2(WorkTripState state) {
    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),

          // Phiếu đặt xe / Tên khách hàng / Tên công ty — chỉ hiển thị với phòng ban Sale
          if (_isSaleDepartment(state)) ...[
            // Phiếu đặt xe (bottomSheet nếu có data, disable nếu không có)
            // Khi đã chọn → thêm nút X để xoá.
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: state.selfVehicleList.isEmpty
                        ? null
                        : _openBookingVehicleSheet,
                    child: AbsorbPointer(
                      absorbing: state.selfVehicleList.isEmpty,
                      child: _ReadonlyTextField(
                        icon: Icons.confirmation_number_outlined,
                        label: 'Phiếu đặt xe',
                        value: _selectedBookingVehicle != null
                            ? (_selectedBookingVehicle!.displayLabel ?? '')
                            : '',
                        hint: state.selfVehicleList.isEmpty
                            ? 'Không có danh sách đặt xe'
                            : 'Chọn phiếu đặt xe',
                        showArrow: state.selfVehicleList.isNotEmpty,
                      ),
                    ),
                  ),
                ),
                if (_hasBookingVehicle()) ...[
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: _clearBookingVehicle,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, size: 18, color: Colors.red.shade400),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),

            // Tên khách hàng (readonly — chỉ fill từ phiếu đặt xe hoặc để trống)
            FormInputField(
              nameForm: 'wt_customer_name',
              nameTextField: 'wt_customer_name_tf',
              label: 'Tên khách hàng',
              icon: Icons.person_outline,
              initialValue: _customerName,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Vui lòng nhập tên khách hàng';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            // Tên công ty (readonly — chỉ fill từ phiếu đặt xe hoặc để trống)
            FormInputField(
              nameForm: 'wt_company_name',
              nameTextField: 'wt_company_name_tf',
              label: 'Tên công ty',
              icon: Icons.business_outlined,
              initialValue: _companyName,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Vui lòng nhập tên công ty';
                }
                return null;
              },
            ),
          ],

          const SizedBox(height: 12),

          // Dự án
          FormBuilderField<String>(
            name: 'wt_project_id',
            initialValue: '',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          FormInputField(
            readOnly: true,
            nameForm: 'wt_project_text',
            nameTextField: 'wt_project_text_tf',
            label: 'Dự án',
            icon: Icons.work_outline,
            initialValue: _selectedProjectText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            onTap: _openProjectSheet,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Vui lòng chọn dự án';
              return null;
            },
          ),
          const SizedBox(height: 12),
          // Lý do công tác
          FormInputField(
            nameForm: 'wt_reason',
            nameTextField: 'wt_reason_tf',
            label: 'Lý do công tác',
            icon: Icons.note_alt_outlined,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            autoExpand: true,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Vui lòng nhập lý do công tác';
              return null;
            },
          ),
          const SizedBox(height: 12),
          // Địa điểm
          FormInputField(
            nameForm: 'wt_location',
            nameTextField: 'wt_location_tf',
            label: 'Địa điểm',
            icon: Icons.location_on_outlined,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Vui lòng nhập địa điểm';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Loại công tác
          FormBuilderField<String>(
            name: 'wt_type_id',
            initialValue: _selectedTypeId?.toString() ?? '',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          FormInputField(
            readOnly: true,
            nameForm: 'wt_type_text',
            nameTextField: 'wt_type_text_tf',
            label: 'Loại công tác',
            icon: Icons.category_outlined,
            initialValue: _selectedTypeName,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            onTap: _openTypeSheet,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Vui lòng chọn loại công tác';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Phí công tác (readonly, reactive)
          _ReadonlyMoneyField(
            icon: Icons.monetization_on_outlined,
            label: 'Phí công tác',
            value: _selectedTypeCost,
          ),
          const SizedBox(height: 12),

          // Checkbox "Chủ động phương tiện" — chỉ hiển thị với phòng ban Sale
          if (_isSaleDepartment(state)) ...[
            FormCheckbox(
              name: 'wt_self_vehicle',
              initialValue: _checkboxSelfVehicle,
              enabled: !_hasBookingVehicle(),
              title: const Text(
                'Chủ động phương tiện',
                style: TextStyle(fontSize: 14),
              ),
              onChanged: _hasBookingVehicle()
                  ? null
                  : (value) {
                      final wantSelfVehicle = value ?? false;
                      setState(() {
                        _selfVehicle = wantSelfVehicle;
                        _checkboxSelfVehicle = wantSelfVehicle;
                      });
                      if (wantSelfVehicle) {
                        _applyDefaultVehicle(state.workTripVehicles);
                      }
                    },
            ),
            const SizedBox(height: 12),
          ],

          // Phương tiện — readonly khi thuộc Sale (auto theo checkbox/phiếu đặt xe),
          // ngược lại cho mở dialog chọn như bình thường.
          GestureDetector(
            onTap: _isSaleDepartment(state)
                ? null
                : _openVehicleDialog,
            child: AbsorbPointer(
              absorbing: _isSaleDepartment(state),
              child: _ReadonlyTextField(
                icon: Icons.directions_car_outlined,
                label: 'Phương tiện',
                value: _vehicleDisplayText,
                hint: 'Chọn phương tiện',
                showArrow: !_isSaleDepartment(state),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Phí phương tiện (readonly, reactive)
          _ReadonlyMoneyField(
            icon: Icons.attach_money_outlined,
            label: 'Phí phương tiện',
            value: _effectiveVehicleCost,
          ),
          const SizedBox(height: 8),

          // Checkbox: Không chấm công tại VP — mặc định bật
          FormCheckbox(
            name: 'wt_not_check_in',
            initialValue: true,
            title: const Text(
              'Không chấm công tại VP',
              style: TextStyle(fontSize: 14),
            ),
          ),

          // Checkbox: Xuất phát trước 7h15 + fee display
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FormCheckbox(
                  name: 'wt_work_early',
                  title: const Text(
                    'Xuất phát trước 07h15',
                    style: TextStyle(fontSize: 14),
                  ),
                  onChanged: (v) {
                    setState(() => _workEarly = v ?? false);
                  },
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
          _buildChoiceGroup<int>(
            context: context,
            name: 'wt_overnight_type',
            label: 'Phụ cấp ăn tối',
            icon: Icons.restaurant_outlined,
            options: kDinnerAllowanceOptions
                .map((o) => _ChoiceOption<int>(value: o.value, label: o.label))
                .toList(),
            initialValue: _overnightType,
            onChanged: (val) {
              if (val == null) return;
              final opt = kDinnerAllowanceOptions.firstWhere((o) => o.value == val);
              setState(() {
                _overnightType = val;
                _overnightLabel = opt.label;
              });
              _formKey.currentState?.fields['wt_overnight_text']?.didChange(opt.label);
            },
          ),
          // Hidden field for text (if still needed by some logic, though usually ID is enough)
          FormBuilderField<String>(
            name: 'wt_overnight_text',
            initialValue: _overnightLabel,
            builder: (_) => const SizedBox.shrink(),
          ),
          const SizedBox(height: 12),

          // Tổng chi phí (reactive)
          _TotalCostRow(total: _totalCost),
          const SizedBox(height: 12),

          // Ghi chú
          FormInputField(
            nameForm: 'wt_note',
            nameTextField: 'wt_note_tf',
            label: 'Ghi chú',
            icon: Icons.edit_note_outlined,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
            autovalidateMode: AutovalidateMode.disabled,
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceGroup<T>({
    required BuildContext context,
    required String name,
    required String label,
    required IconData icon,
    required List<_ChoiceOption<T>> options,
    T? initialValue,
    bool enabled = true,
    void Function(T? value)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: AppColors.primaryERP),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.neutralText,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        FormBuilderField<T>(
          name: name,
          initialValue: initialValue,
          enabled: enabled,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<T?> field) {
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: options.map((option) {
                final isSelected = field.value == option.value;
                final primaryColor = option.selectedColor ?? AppColors.primaryERP;

                return GestureDetector(
                  onTap: enabled
                      ? () {
                          field.didChange(option.value);
                          onChanged?.call(option.value);
                        }
                      : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? primaryColor.withValues(alpha: 0.1)
                          : AppColors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected
                            ? primaryColor
                            : AppColors.black.withValues(alpha: 0.1),
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      option.label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected
                            ? primaryColor
                            : AppColors.textSecondaryColor,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _ChoiceOption<T> {
  final T value;
  final String label;
  final Color? selectedColor;

  _ChoiceOption({
    required this.value,
    required this.label,
    this.selectedColor,
  });
}


// ── Helper widgets ─────────────────────────────────────────────────────────────

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

class _ReadonlyTextField extends StatelessWidget {
  const _ReadonlyTextField({
    required this.icon,
    required this.label,
    required this.value,
    this.hint,
    this.showArrow = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final String? hint;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    final hasValue = value.isNotEmpty;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  hasValue ? value : (hint ?? ''),
                  style: TextStyle(
                    fontSize: 14,
                    color: hasValue ? Colors.black87 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (showArrow)
            Icon(Icons.keyboard_arrow_down,
                color: Colors.grey.shade500, size: 20),
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
        color: AppColors.primaryERP.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryERP.withValues(alpha: 0.25)),
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
