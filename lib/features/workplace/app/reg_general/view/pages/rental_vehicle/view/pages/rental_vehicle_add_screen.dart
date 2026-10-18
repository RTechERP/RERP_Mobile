// Date: 16/10/2026
// Nội dung/Chức năng: Màn hình thêm yêu cầu thuê xe tải.

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

class RentalVehicleAddScreen extends StatefulWidget {
  const RentalVehicleAddScreen({
    super.key,
    this.employees = const [],
    this.projects = const [],
    this.initialNextStt = 1,
  });

  /// Danh sách nhân viên truyền từ list screen (đã load ở `loadAll`).
  final List<RentalVehicleEmployee> employees;

  /// Danh sách dự án truyền từ list screen (đã load ở `loadAll`).
  final List<RentalVehicleProject> projects;

  /// STT kế tiếp tính từ list screen (max(stt) + 1).
  final int initialNextStt;

  @override
  State<RentalVehicleAddScreen> createState() => _RentalVehicleAddScreenState();
}

class _RentalVehicleAddScreenState
    extends
        BaseShareState<
          RentalVehicleAddScreen,
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

  /// Employee đã chọn trên form (lưu local để hiện text + lấy department).
  RentalVehicleEmployee? _selectedEmployee;

  /// Project đã chọn trên form.
  RentalVehicleProject? _selectedProject;

  /// Loại xe đã chọn.
  RentalVehicleVehicleType? _selectedVehicleType;

  /// STT hiện tại (tính từ list screen, truyền qua `widget.initialNextStt`).
  int _currentStt = 1;

  /// Controller cho field STT (để update khi nextStt load xong).
  final TextEditingController _sttController = TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    // Khởi tạo STT từ list screen truyền vào.
    _currentStt = widget.initialNextStt;
    _sttController.text = _currentStt.toString();
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

    // Validate required fields mà FormBuilder không handle được.
    if (_selectedEmployee == null) {
      showMessage(context, 'Vui lòng chọn người yêu cầu',
          type: SnackBarType.error);
      return;
    }
    if (_selectedVehicleType == null) {
      showMessage(context, 'Vui lòng chọn loại xe',
          type: SnackBarType.error);
      return;
    }

    // Ngày yêu cầu.
    final dateRaw = values['dateRequest'];
    DateTime? dateRequest;
    if (dateRaw is DateTime) {
      dateRequest = dateRaw;
    }

    // Số lượng.
    int? packageQty;
    final qtyRaw = values['packageQuantity'];
    if (qtyRaw != null && qtyRaw.toString().trim().isNotEmpty) {
      packageQty = int.tryParse(qtyRaw.toString());
    }

    // Các field số.
    num? parseNum(dynamic v) {
      if (v == null) return null;
      final s = v.toString().trim();
      if (s.isEmpty) return null;
      return num.tryParse(s);
    }

    bloc.add(RentalVehicleEvent.submitAdd(
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
              !current.isSubmitting &&
              !current.submitSuccess,
          listener: (context, state) {
            showMessage(context, state.message!, type: SnackBarType.error);
          },
          child: BlocListener<RentalVehicleBloc, RentalVehicleState>(
            listenWhen: (previous, current) =>
                previous.submitSuccess != current.submitSuccess,
            listener: (context, state) {
              if (state.submitSuccess) {
                showMessage(context, 'Tạo yêu cầu thuê xe tải thành công',
                    type: SnackBarType.success);
                if (mounted) context.pop(true);
              }
            },
            child: BaseScaffold(
              appBar: AppBarCommon(
                title: const Text('Thêm yêu cầu thuê xe tải'),
                onBackTap: () => context.pop(),
              ),
              body: BlocBuilder<RentalVehicleBloc, RentalVehicleState>(
                buildWhen: (prev, curr) =>
                    prev.isSubmitting != curr.isSubmitting,
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
    );
  }
}
