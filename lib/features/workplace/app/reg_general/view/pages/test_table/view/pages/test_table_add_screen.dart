// Date: 06/09/2026
// Nội dung/Chức năng: Màn thêm mới phiếu đăng ký bàn test ESL.
//
// Flow:
//   1. Mở màn → initAdd() → load lookup data (cache từ list) + currentUser.
//   2. User chọn Dự án / Bàn test / Người đăng ký / Người duyệt / Ngày bắt đầu
//      → bloc.updateForm() cập nhật state.formData.
//   3. Bấm "Kiểm tra" → checkConflict() gọi /ESLRegistration/check-conflict.
//   4. Nếu không trùng → nút "Lưu" enable → submitRegistration() gọi /ESLRegistration/save.
//   5. Submit thành công → submitSuccess = true → pop(true) để màn list refresh.
//
// Lookup data (project / testTable / employee / approver) được cache trong
// bloc.state và tái sử dụng giữa màn List và Add — không gọi lại API nếu
// đã có.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/test_table_model.dart';
import '../bloc/test_table_bloc.dart';
import '../widgets/test_table_picker.dart';
import '../widgets/test_machine_picker.dart';

class TestTableAddScreen extends StatefulWidget {
  /// Id bàn test cần pre-fill (vd từ QR scan). Null = user tự chọn trên form.
  const TestTableAddScreen({super.key, this.prefilledTestTableId});

  final int? prefilledTestTableId;

  @override
  State<TestTableAddScreen> createState() => _TestTableAddScreenState();
}

class _TestTableAddScreenState extends BaseShareState<TestTableAddScreen,
    TestTableEvent, TestTableState, TestTableBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  // Controllers cho các field picker — bind 1 lần, không tạo mới mỗi build.
  late final TextEditingController _projectController;
  late final TextEditingController _testTableController;
  late final TextEditingController _ownerController;
  late final TextEditingController _approverController;
  late final TextEditingController _endDateController;
  late final TextEditingController _machineController;

  /// Ngày bắt đầu mặc định là hôm nay.
  DateTime _defaultStartDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  @override
  void initState() {
    super.initState();

    _projectController = TextEditingController();
    _testTableController = TextEditingController();
    _ownerController = TextEditingController();
    _approverController = TextEditingController();
    _endDateController = TextEditingController();
    _machineController = TextEditingController();

    // Khởi tạo form: ngày bắt đầu = hôm nay, các id = null.
    bloc.add(TestTableEvent.updateForm(
      startDate: _defaultStartDate(),
      clearProject: true,
      clearTestTableId: true,
      clearOwnerId: true,
      clearApproverId: true,
      clearStartDate: false,
    ));

    // Tải lookup data (cache từ list) + currentUser.
    // Nếu có prefillTestTableId (từ QR scan) thì truyền luôn vào initAdd.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(TestTableEvent.initAdd(
        prefillTestTableId: widget.prefilledTestTableId,
      ));
    });
  }

  @override
  void dispose() {
    _projectController.dispose();
    _testTableController.dispose();
    _ownerController.dispose();
    _approverController.dispose();
    _endDateController.dispose();
    _machineController.dispose();
    super.dispose();
  }

  /// Tắt listener mặc định của [BaseState] — screen này xử lý state qua
  /// các BlocListener/BlocBuilder riêng, tránh bị fire 2 lần mỗi emit.
  @override
  bool listenWhen(TestTableState previous, TestTableState current) {
    return false;
  }

  @override
  void listener(BuildContext context, TestTableState state) {}

  /// Đồng bộ text cho các field picker từ `state.formData`.
  /// Tách khỏi builder để KHÔNG rebuild UI khi chỉ sync text controller.
  void _syncControllers(TestTableFormData form) {
    final project = form.project;
    _projectController.text = project == null
        ? ''
        : '${project.projectCode ?? ''} - ${project.projectName ?? ''}'
            .trim()
            .replaceAll(RegExp(r'^-\s*|\s*-$'), '')
            .trim();

    final testTableId = form.testTableId;
    if (testTableId == null) {
      _testTableController.text = '';
    } else {
      final item = bloc.state.testTable.firstWhere(
        (e) => e.id == testTableId,
        orElse: () => const TestTableItem(),
      );
      _testTableController.text = item.testTableName ?? '';
    }

    final ownerId = form.ownerId;
    if (ownerId == null) {
      _ownerController.text = '';
    } else {
      final picked = bloc.state.employee.firstWhere(
        (e) => (e.id ?? -1) == ownerId,
        orElse: () => EmployeeInfoItem(
          id: bloc.state.currentUser?.employeeId,
          code: bloc.state.currentUser?.code,
          fullName: bloc.state.currentUser?.fullName,
        ),
      );
      _ownerController.text =
          '${picked.code ?? ''} - ${picked.fullName ?? ''}'
              .trim()
              .replaceAll(RegExp(r'^-\s*|\s*-$'), '')
              .trim();
    }

    final approverId = form.approverId;
    if (approverId == null) {
      _approverController.text = '';
    } else {
      final item = bloc.state.approver.firstWhere(
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

    // End date = start + 7 ngày.
    final endDate = form.endDate ??
        (form.startDate ?? _defaultStartDate()).add(const Duration(days: 7));
    _endDateController.text = DateFormat('dd/MM/yyyy').format(endDate);

    // Máy test: sync từ state.testMachines (cập nhật sau khi chọn bàn test).
    _syncMachineController(bloc.state);
  }

  /// Sync text cho field "Máy test" từ state.testMachines.
  /// Gọi mỗi khi testMachines hoặc selectedMachineIds đổi.
  void _syncMachineController(TestTableState state) {
    final form = state.formData;
    if (form.testTableId == null) {
      _machineController.text = '';
      return;
    }
    if (state.isLoadingTestMachines) {
      _machineController.text = 'Đang tải máy test...';
      return;
    }
    final machines = state.testMachines;
    if (machines.isEmpty) {
      _machineController.text = 'Bàn test chưa khai báo máy test';
    } else {
      final selected = form.selectedMachineIds;
      if (selected.isEmpty) {
        _machineController.text = '';
      } else {
        final names = selected.map((id) {
          final m = machines.firstWhere(
            (m) => m.id == id,
            orElse: () => const TestMachineItem(),
          );
          final code = m.machineCode ?? '';
          final name = m.machineName ?? '';
          return '$code - $name'.replaceAll(RegExp(r'^-\s*|\s*-$'), '').trim();
        }).where((s) => s.isNotEmpty).toList();
        _machineController.text = names.join(', ');
      }
    }
  }

  Future<void> _pickMachines() async {
    final allMachines = bloc.state.testMachines;
    if (allMachines.isEmpty) return;

    // Lấy các machine đã chọn từ state.
    final selectedIds = bloc.state.formData.selectedMachineIds;
    final selectedMachines = allMachines
        .where((m) => selectedIds.contains(m.id))
        .toList();

    await openMultiSelectMachineSheet(
      context: context,
      title: 'Chọn máy test',
      allMachines: allMachines,
      selectedMachines: selectedMachines,
      onConfirm: (picked) {
        bloc.add(TestTableEvent.updateForm(
          selectedMachineIds: picked.map((m) => m.id).whereType<int>().toList(),
        ));
      },
    );
  }

  // ===================================================================
  // ==================== Event dispatchers ============================
  // ===================================================================

  void _onChangeStartDate(DateTime? value) {
    if (value == null) return;
    bloc.add(TestTableEvent.updateForm(
      startDate: DateTime(value.year, value.month, value.day),
      clearStartDate: false,
    ));
  }

  Future<void> _pickProject() async {
    final items = bloc.state.project;
    if (items.isEmpty) return;
    await openSelectBottomSheet<ProjectItem>(
      context: context,
      title: 'Chọn dự án',
      items: items,
      displayText: (e) =>
          '${e.projectCode ?? ''} - ${e.projectName ?? ''}'.trim(),
      hintText: 'Tìm dự án...',
      onSelected: (item) {
        bloc.add(TestTableEvent.updateForm(project: item));
      },
    );
  }

  Future<void> _pickTestTable() async {
    final items = bloc.state.testTable;
    if (items.isEmpty) return;

    final picked = await openTestTablePicker(
      context: context,
      items: items,
    );
    if (picked != null) {
      bloc.add(TestTableEvent.updateForm(testTableId: picked.id));
    }
  }

  Future<void> _pickOwner() async {
    final items = bloc.state.employee;
    if (items.isEmpty) return;
    await openSelectBottomSheet<EmployeeInfoItem>(
      context: context,
      title: 'Chọn người đăng ký',
      items: items,
      displayText: (e) => '${e.code ?? ''} - ${e.fullName ?? ''}'.trim(),
      hintText: 'Tìm nhân viên...',
      initialSelectedItem: items.firstWhere(
        (e) => (e.id ?? -1) == (bloc.state.formData.ownerId ?? -1),
        orElse: () => items.first,
      ),
      onSelected: (item) {
        bloc.add(TestTableEvent.updateForm(ownerId: item.id));
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
        bloc.add(TestTableEvent.updateForm(approverId: item.id ?? item.userId));
      },
    );
  }

  void _onSave() {
    FocusScope.of(context).unfocus();
    bloc.add(const TestTableEvent.submitRegistration());
  }

  // ===================================================================
  // ============================ UI ===================================
  // ===================================================================

  @override
  Widget renderUI(BuildContext context) {
    return PopScope(
      canPop: !bloc.state.isSubmitting,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        showMessage(
          context,
          'Đang gửi phiếu, vui lòng đợi...',
          type: SnackBarType.info,
        );
      },
      child: Stack(
        children: [
          _buildForm(context),

          // Đồng bộ controllers khi formData đổi (KHÔNG rebuild UI).
          BlocListener<TestTableBloc, TestTableState>(
            listenWhen: (prev, curr) => prev.formData != curr.formData,
            listener: (context, state) => _syncControllers(state.formData),
            child: const SizedBox.shrink(),
          ),

          // Đồng bộ field máy test khi danh sách máy test HOẶC machine đã chọn thay đổi.
          BlocListener<TestTableBloc, TestTableState>(
            listenWhen: (prev, curr) =>
                prev.testMachines != curr.testMachines ||
                prev.isLoadingTestMachines != curr.isLoadingTestMachines ||
                prev.formData.selectedMachineIds !=
                    curr.formData.selectedMachineIds,
            listener: (context, state) => _syncMachineController(state),
            child: const SizedBox.shrink(),
          ),

          // Lắng nghe submit + feedback (success → pop, fail → snackbar).
          BlocListener<TestTableBloc, TestTableState>(
            listenWhen: (p, c) =>
                p.submitSuccess != c.submitSuccess ||
                p.status != c.status,
            listener: _handleFeedback,
            child: const SizedBox.shrink(),
          ),

          // Loading overlay khi submit.
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

  /// Xử lý feedback sau submit (checkConflict đã chạy ngầm trong submit).
  void _handleFeedback(BuildContext context, TestTableState state) {
    // Submit thành công.
    if (state.submitSuccess) {
      showMessage(context, 'Đăng ký bàn test thành công',
          type: SnackBarType.success);
      bloc.add(const TestTableEvent.resetSubmitFlags());
      // Pop trả về `true` để màn list biết cần refresh.
      Future.microtask(() {
        if (mounted) context.pop(true);
      });
      return;
    }

    // Submit thất bại.
    if (state.status == BaseStateStatus.failed &&
        !state.isSubmitting &&
        (state.message ?? '').isNotEmpty) {
      showMessage(context, state.message!, type: SnackBarType.error);
    }
  }

  Widget _buildForm(BuildContext context) {
    return BlocBuilder<TestTableBloc, TestTableState>(
      bloc: bloc,
      // CHỈ rebuild khi lookup data đổi hoặc submit state đổi.
      // formData đổi → sync qua BlocListener riêng, KHÔNG rebuild.
      buildWhen: (prev, curr) =>
          prev.project != curr.project ||
          prev.testTable != curr.testTable ||
          prev.employee != curr.employee ||
          prev.approver != curr.approver ||
          prev.isSubmitting != curr.isSubmitting,
      builder: (context, state) {
        final initialStartDate = state.formData.startDate ?? _defaultStartDate();

        return BaseScaffold(
          backgroundColor: const Color(0xFFF4F7FB),
          appBar: AppBarCommon(
            title: const Text('Thêm đăng ký bàn test'),
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
                          title: 'Thời gian',
                          child: Column(
                            children: [
                              FormDateTimePicker(
                                nameForm: 'tt_start_date',
                                nameTimePicker: 'tt_start_date_picker',
                                label: 'Ngày bắt đầu',
                                icon: Icons.calendar_today_outlined,
                                inputType: InputType.date,
                                format: DateFormat('dd/MM/yyyy'),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                                initialValue: initialStartDate,
                                isRequired: true,
                                onChanged: _onChangeStartDate,
                                validator: (v) {
                                  if (v == null) {
                                    return 'Vui lòng chọn ngày bắt đầu';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                nameForm: 'tt_end_date',
                                nameTextField: 'tt_end_date_tf',
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
                                nameForm: 'tt_project',
                                nameTextField: 'tt_project_tf',
                                label: 'Dự án',
                                icon: Icons.folder_outlined,
                                readOnly: true,
                                controller: _projectController,
                                isRequired: true,
                                onTap: _pickProject,
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                nameForm: 'tt_test_table',
                                nameTextField: 'tt_test_table_tf',
                                label: 'Bàn test',
                                icon: Icons.desktop_windows_outlined,
                                readOnly: true,
                                controller: _testTableController,
                                isRequired: true,
                                onTap: _pickTestTable,
                              ),
                              const SizedBox(height: 12),
                              BlocBuilder<TestTableBloc, TestTableState>(
                                buildWhen: (p, c) =>
                                    p.testMachines != c.testMachines ||
                                    p.isLoadingTestMachines !=
                                        c.isLoadingTestMachines ||
                                    p.formData.selectedMachineIds !=
                                        c.formData.selectedMachineIds,
                                builder: (context, state) {
                                  final hasMachines =
                                      state.testMachines.isNotEmpty;
                                  final isLoading = state.isLoadingTestMachines;
                                  final canPick = hasMachines && !isLoading;
                                  return FormInputField(
                                    nameForm: 'tt_machine',
                                    nameTextField: 'tt_machine_tf',
                                    label: 'Máy test',
                                    icon: Icons.devices_outlined,
                                    readOnly: true,
                                    enabled: canPick,
                                    controller: _machineController,
                                    onTap: canPick ? _pickMachines : null,
                                  );
                                },
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                nameForm: 'tt_owner',
                                nameTextField: 'tt_owner_tf',
                                label: 'Người đăng ký',
                                icon: Icons.person_outline,
                                readOnly: true,
                                controller: _ownerController,
                                isRequired: true,
                                onTap: _pickOwner,
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                nameForm: 'tt_approver',
                                nameTextField: 'tt_approver_tf',
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

              // Action bar.
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: BlocBuilder<TestTableBloc, TestTableState>(
                  bloc: bloc,
                  buildWhen: (p, c) =>
                      p.isSubmitting != c.isSubmitting ||
                      p.formData.isReady != c.formData.isReady,
                  builder: (context, subState) {
                    return FormActions(
                      mode: FormActionMode.add,
                      onSubmit: _onSave,
                      submitText: 'Lưu',
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
}
