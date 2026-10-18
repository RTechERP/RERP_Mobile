// Date: 16/10/2026
// Nội dung/Chức năng: Màn hình cập nhật yêu cầu thuê xe tải (UI giống add, prefill từ item).

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/form_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/rental_vehicle_model.dart';
import '../bloc/rental_vehicle_bloc.dart';
import '../widgets/rental_vehicle_cargo_info_section.dart';
import '../widgets/rental_vehicle_general_info_section.dart';
import '../widgets/rental_vehicle_label_helpers.dart';
import '../widgets/rental_vehicle_route_section.dart';
import '../widgets/rental_vehicle_section_title.dart';

class RentalVehicleUpdateScreen extends StatefulWidget {
  const RentalVehicleUpdateScreen({
    super.key,
    required this.item,
    this.employees = const [],
    this.projects = const [],
  });

  /// Phiếu gốc để prefill form.
  final RentalVehicleItem item;

  /// Danh sách nhân viên truyền từ list screen.
  final List<RentalVehicleEmployee> employees;

  /// Danh sách dự án truyền từ list screen.
  final List<RentalVehicleProject> projects;

  @override
  State<RentalVehicleUpdateScreen> createState() =>
      _RentalVehicleUpdateScreenState();
}

class _RentalVehicleUpdateScreenState
    extends
        BaseShareState<
          RentalVehicleUpdateScreen,
          RentalVehicleEvent,
          RentalVehicleState,
          RentalVehicleBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Danh sách loại xe tĩnh (hard-code theo API backend).
  static final List<RentalVehicleVehicleType> _vehicleTypes = [
    RentalVehicleVehicleType(id: 1, name: 'Xe tải'),
    RentalVehicleVehicleType(id: 2, name: 'Xe tải có cẩu'),
    RentalVehicleVehicleType(id: 3, name: 'Xe nâng'),
  ];

  RentalVehicleEmployee? _selectedEmployee;
  RentalVehicleProject? _selectedProject;
  RentalVehicleVehicleType? _selectedVehicleType;
  late int _currentStt;
  late final TextEditingController _sttController;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    _currentStt = item.stt ?? 1;
    _sttController = TextEditingController(text: _currentStt.toString());

    // Prefill loại xe.
    _selectedVehicleType = _vehicleTypes.firstWhere(
      (t) => t.id == item.vehicleType,
      orElse: () => _vehicleTypes.first,
    );

    // Prefill người yêu cầu (tìm trong danh sách employees truyền vào).
    final empId = item.employeeRequestId;
    if (empId != null) {
      _selectedEmployee = widget.employees.firstWhere(
        (e) => e.id == empId,
        orElse: () => RentalVehicleEmployee(id: empId, fullName: item.employeeRequestName),
      );
    }

    // Prefill dự án.
    final projId = item.projectId;
    if (projId != null) {
      _selectedProject = widget.projects.firstWhere(
        (p) => p.id == projId,
        orElse: () => RentalVehicleProject(id: projId, projectName: item.projectName),
      );
    }

    // Patch form values ngay sau frame đầu tiên (FormBuilder cần build xong).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formKey.currentState?.patchValue(_buildInitialFormValues(item));
    });
  }

  /// Format số: nếu là số nguyên thì bỏ `.0`, giữ nguyên thập phân nếu có.
  String _formatNum(num? value) {
    if (value == null) return '';
    if (value == value.toInt()) return value.toInt().toString();
    return value.toString();
  }

  /// Build map patch form từ phiếu gốc.
  Map<String, dynamic> _buildInitialFormValues(RentalVehicleItem item) {
    return {
      'stt': item.stt?.toString() ?? '',
      'stt_text': item.stt?.toString() ?? '',
      'dateRequest': item.dateRequest,
      'vehicleType': item.vehicleType?.toString() ?? '',
      'vehicleType_text': _selectedVehicleType?.name ?? '',
      'employeeRequestId': item.employeeRequestId?.toString() ?? '',
      'employeeRequestId_text': _selectedEmployee != null
          ? formatRentalVehicleEmployeeLabel(_selectedEmployee!)
          : '',
      'departmentId': item.departmentId?.toString() ?? '',
      'departmentName': item.departmentName ?? '',
      'departmentName_text': item.departmentName ?? '',
      'projectId': item.projectId?.toString() ?? '',
      'projectId_text': _selectedProject != null
          ? formatRentalVehicleProjectLabel(_selectedProject!)
          : '',
      'packageName': item.packageName ?? '',
      'packageQuantity': item.packageQuantity?.toString() ?? '',
      'packageLengthCm': _formatNum(item.packageLengthCm),
      'packageWidthCm': _formatNum(item.packageWidthCm),
      'packageHeightCm': _formatNum(item.packageHeightCm),
      'packageWeightKg': _formatNum(item.packageWeightKg),
      'departureLocation': item.departureLocation ?? '',
      'addressLocation': item.addressLocation ?? '',
      'distanceKm': _formatNum(item.distanceKm),
      'note': item.note ?? '',
    };
  }

  @override
  void dispose() {
    _sttController.dispose();
    super.dispose();
  }

  // ===== Select handlers =====

  void _onVehicleTypeChanged(RentalVehicleVehicleType type) {
    setState(() => _selectedVehicleType = type);
    _formKey.currentState?.patchValue({
      'vehicleType': type.id?.toString() ?? '',
      'vehicleType_text': type.name ?? '',
    });
  }

  void _onEmployeeChanged(RentalVehicleEmployee emp) {
    setState(() => _selectedEmployee = emp);
    bloc.add(RentalVehicleEvent.selectRequesterOnAdd(emp.id ?? 0));
    _formKey.currentState?.patchValue({
      'employeeRequestId': emp.id?.toString() ?? '',
      'employeeRequestId_text': formatRentalVehicleEmployeeLabel(emp),
      'departmentName': emp.departmentName ?? '',
      'departmentName_text': emp.departmentName ?? '',
      'departmentId': emp.departmentId?.toString() ?? '',
    });
  }

  void _onProjectChanged(RentalVehicleProject proj) {
    setState(() => _selectedProject = proj);
    _formKey.currentState?.patchValue({
      'projectId': proj.id?.toString() ?? '',
      'projectId_text': formatRentalVehicleProjectLabel(proj),
    });
  }

  // ===== Submit =====

  void _onSubmitForm() {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;

    if (!formState.saveAndValidate()) {
      FormHelper.focusFirstError(formState: formState);
      return;
    }

    final values = formState.value;

    if (_selectedEmployee == null) {
      showMessage(context, 'Vui lòng chọn người yêu cầu',
          type: SnackBarType.error);
      return;
    }
    if (_selectedVehicleType == null) {
      showMessage(context, 'Vui lòng chọn loại xe', type: SnackBarType.error);
      return;
    }

    final dateRaw = values['dateRequest'];
    DateTime? dateRequest;
    if (dateRaw is DateTime) {
      dateRequest = dateRaw;
    }

    int? packageQty;
    final qtyRaw = values['packageQuantity'];
    if (qtyRaw != null && qtyRaw.toString().trim().isNotEmpty) {
      packageQty = int.tryParse(qtyRaw.toString());
    }

    num? parseNum(dynamic v) {
      if (v == null) return null;
      final s = v.toString().trim();
      if (s.isEmpty) return null;
      return num.tryParse(s);
    }

    bloc.add(RentalVehicleEvent.submitUpdate(
      id: widget.item.id ?? 0,
      formValues: {
        'dateRequest': dateRequest,
        'stt': _currentStt,
        'employeeRequestId': _selectedEmployee!.id,
        'departmentId': _selectedEmployee!.departmentId,
        'vehicleType': _selectedVehicleType!.id,
        'packageName': values['packageName'] ?? '',
        'projectId': _selectedProject?.id,
        'packageQuantity': packageQty,
        'packageLengthCm': parseNum(values['packageLengthCm']),
        'packageWidthCm': parseNum(values['packageWidthCm']),
        'packageHeightCm': parseNum(values['packageHeightCm']),
        'packageWeightKg': parseNum(values['packageWeightKg']),
        'departureLocation': values['departureLocation'] ?? '',
        'addressLocation': values['addressLocation'] ?? '',
        'distanceKm': parseNum(values['distanceKm']),
        'note': values['note'] ?? '',
      },
    ));
  }

  // ===== Build =====

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<RentalVehicleBloc, RentalVehicleState>(
          listenWhen: (previous, current) =>
              previous.message != current.message &&
              current.message != null &&
              current.message!.isNotEmpty &&
              !current.isUpdating &&
              !current.updateSuccess,
          listener: (context, state) {
            showMessage(context, state.message!, type: SnackBarType.error);
          },
          child: BlocListener<RentalVehicleBloc, RentalVehicleState>(
            listenWhen: (previous, current) =>
                previous.updateSuccess != current.updateSuccess,
            listener: (context, state) {
              if (state.updateSuccess) {
                showMessage(
                  context,
                  'Cập nhật yêu cầu thuê xe tải thành công',
                  type: SnackBarType.success,
                );
                if (mounted) context.pop(true);
              }
            },
            child: BaseScaffold(
              appBar: AppBarCommon(
                title: const Text('Cập nhật yêu cầu thuê xe tải'),
                onBackTap: () => context.pop(),
              ),
              body: BlocBuilder<RentalVehicleBloc, RentalVehicleState>(
                buildWhen: (prev, curr) =>
                    prev.isUpdating != curr.isUpdating,
                builder: (context, state) {
                  return FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(16),
                            children: [
                              // ===== 1. THÔNG TIN CHUNG =====
                              const RentalVehicleSectionTitle(
                                  title: 'Thông tin chung'),
                              const SizedBox(height: 8),
                              RentalVehicleGeneralInfoSection(
                                sttController: _sttController,
                                vehicleTypes: _vehicleTypes,
                                selectedVehicleType: _selectedVehicleType,
                                onVehicleTypeChanged: _onVehicleTypeChanged,
                                employees: widget.employees,
                                selectedEmployee: _selectedEmployee,
                                onEmployeeChanged: _onEmployeeChanged,
                              ),
                              const SizedBox(height: 16),

                              // ===== 2. THÔNG TIN HÀNG HOÁ =====
                              const RentalVehicleSectionTitle(
                                  title: 'Thông tin hàng hoá'),
                              const SizedBox(height: 8),
                              RentalVehicleCargoInfoSection(
                                projects: widget.projects,
                                selectedProject: _selectedProject,
                                onProjectChanged: _onProjectChanged,
                              ),
                              const SizedBox(height: 16),

                              // ===== 3. LỘ TRÌNH & CHI PHÍ =====
                              const RentalVehicleSectionTitle(
                                  title: 'Lộ trình & chi phí'),
                              const SizedBox(height: 8),
                              const RentalVehicleRouteSection(),
                            ],
                          ),
                        ),

                        // ===== ACTION BUTTON =====
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: FormActions(
                            mode: FormActionMode.add,
                            onSubmit: _onSubmitForm,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // ===== LOADING OVERLAY =====
        BlocBuilder<RentalVehicleBloc, RentalVehicleState>(
          buildWhen: (p, c) => p.isUpdating != c.isUpdating,
          builder: (context, state) {
            if (!state.isUpdating) return const SizedBox.shrink();
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
    );
  }
}
