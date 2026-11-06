import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/enums/index.dart';
import 'package:rtc_erp/common/helpers/index.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart' show SnackBarType;
import 'package:rtc_erp/common/widgets/form/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';

import '../bloc/inventory_check_bloc.dart';

/// Màn tạo mới đợt kiểm kê kho.
///
/// Mã đợt được sinh tự động từ API `generate-code` theo ngày kiểm kê đang
/// chọn; danh sách nhân viên kiểm kê lấy từ API `get-employees`.
class InventoryCheckAddScreen extends StatefulWidget {
  const InventoryCheckAddScreen({super.key});

  @override
  State<InventoryCheckAddScreen> createState() =>
      _InventoryCheckAddScreenState();
}

class _InventoryCheckAddScreenState
    extends
        BaseState<
          InventoryCheckAddScreen,
          InventoryCheckEvent,
          InventoryCheckState,
          InventoryCheckBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Controller của ô mã đợt — nhận giá trị sinh từ API `generate-code`.
  final _codeController = TextEditingController();

  /// Controller của ô người kiểm kê — nhận tên NV được chọn trong sheet.
  final _employeeController = TextEditingController();

  /// Ngày kiểm kê đang chọn — dùng để sinh mã đợt.
  late DateTime _dateCount;

  /// Tên đợt kiểm kê mặc định, cố định theo ngày mở form.
  late final String _defaultName;

  /// Nhân viên kiểm kê đang chọn (null = chưa chọn).
  InventoryCheckEmployee? _selectedEmployee;

  /// Danh sách kho có thể chọn — trùng với bộ lọc của màn danh sách.
  static const List<FormChoiceOption<int>> _warehouseOptions = [
    FormChoiceOption(value: 1, label: 'Kho Demo'),
    FormChoiceOption(value: 2, label: 'Kho Modula'),
    FormChoiceOption(value: 3, label: 'Kho AGV'),
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _dateCount = DateTime(now.year, now.month, now.day);
    _defaultName =
        'Đợt kiểm kê ngày ${DateFormat('dd/MM/yyyy').format(_dateCount)}';

    bloc.add(const InventoryCheckEvent.fetchEmployees());
    bloc.add(InventoryCheckEvent.generateCode(_dateCount));
  }

  @override
  void dispose() {
    _codeController.dispose();
    _employeeController.dispose();
    super.dispose();
  }

  @override
  bool listenWhen(
    InventoryCheckState previous,
    InventoryCheckState current,
  ) {
    return previous.generatedCode != current.generatedCode ||
        previous.saveSuccess != current.saveSuccess ||
        previous.message != current.message;
  }

  @override
  void listener(BuildContext context, InventoryCheckState state) {
    // Mã đợt sinh từ API → đồng bộ vào field để validate/lấy giá trị.
    _syncCodeField(state.generatedCode);

    if (state.saveSuccess) {
      context.showMessage(
        'Lưu đợt kiểm kê thành công',
        type: SnackBarType.success,
      );
      context.pop(true);
      return;
    }

    if (state.status == BaseStateStatus.failed &&
        (state.message ?? '').isNotEmpty) {
      context.showMessage(state.message!, type: SnackBarType.error);
    }
  }

  /// Đồng bộ mã đợt sinh từ API vào ô nhập (read-only) và field của form.
  ///
  /// Field có thể chưa mount khi API trả về → thử lại ở frame kế tiếp.
  void _syncCodeField(String? code) {
    if (code == null || code.isEmpty) return;

    if (_codeController.text != code) {
      _codeController.text = code;
    }

    final codeField = _formKey.currentState?.fields['inventory_check_code'];
    if (codeField == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final field = _formKey.currentState?.fields['inventory_check_code'];
        if (field?.value != code) {
          field?.didChange(code);
        }
      });
      return;
    }
    if (codeField.value != code) {
      codeField.didChange(code);
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tạo đợt kiểm kê'),
        onBackTap: () => context.pop(),
      ),
      body: Column(
        children: [
          Expanded(
            child: FormBuilder(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  FormCard(
                    title: 'Thông tin đợt kiểm kê',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// ===== MÃ ĐỢT KIỂM KÊ =====
                        BlocBuilder<InventoryCheckBloc, InventoryCheckState>(
                          bloc: bloc,
                          buildWhen: (prev, curr) =>
                              prev.isGeneratingCode != curr.isGeneratingCode,
                          builder: (context, state) {
                            return FormInputField(
                              nameForm: 'inventory_check_code',
                              nameTextField: 'inventory_check_code_field',
                              label: 'Mã đợt kiểm kê',
                              icon: Icons.qr_code_2_outlined,
                              controller: _codeController,
                              readOnly: true,
                              isRequired: true,
                              validator: FormBuilderValidators.required(
                                errorText: 'Vui lòng nhập mã đợt kiểm kê',
                              ),
                              suffixIcon: state.isGeneratingCode
                                  ? const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    )
                                  : null,
                            );
                          },
                        ),
                        const SizedBox(height: 12),

                        /// ===== TÊN ĐỢT KIỂM KÊ =====
                        FormInputField(
                          nameForm: 'inventory_check_name',
                          nameTextField: 'inventory_check_name_field',
                          label: 'Tên đợt kiểm kê',
                          icon: Icons.title_outlined,
                          initialValue: _defaultName,
                          isRequired: true,
                          validator: FormBuilderValidators.required(
                            errorText: 'Vui lòng nhập tên đợt kiểm kê',
                          ),
                        ),
                        const SizedBox(height: 12),

                        /// ===== NGÀY KIỂM KÊ =====
                        FormDateTimePicker(
                          nameForm: 'inventory_check_date',
                          nameTimePicker: 'inventory_check_date_time',
                          label: 'Ngày kiểm kê',
                          icon: Icons.event_outlined,
                          inputType: InputType.date,
                          format: DateFormat('dd/MM/yyyy'),
                          initialValue: _dateCount,
                          initialDate: _dateCount,
                          isRequired: true,
                          validator: FormBuilderValidators.required(
                            errorText: 'Vui lòng chọn ngày kiểm kê',
                          ),
                          onChanged: (value) {
                            if (value == null) return;
                            _dateCount = value;
                            // Đổi ngày → sinh lại mã đợt theo ngày mới.
                            bloc.add(InventoryCheckEvent.generateCode(value));
                          },
                        ),
                        const SizedBox(height: 16),

                        /// ===== KHO KIỂM KÊ =====
                        FormChoiceGroup<int>(
                          name: 'inventory_check_warehouse',
                          label: 'Kho kiểm kê',
                          icon: Icons.warehouse_outlined,
                          columns: 3,
                          initialValue: 1,
                          options: _warehouseOptions,
                          isRequired: true,
                        ),
                        const SizedBox(height: 16),

                        /// ===== NGƯỜI KIỂM KÊ =====
                        GestureDetector(
                          onTap: _openEmployeeSheet,
                          child: AbsorbPointer(
                            child: FormInputField(
                              nameForm: 'inventory_check_employee',
                              nameTextField: 'inventory_check_employee_field',
                              label: 'Người kiểm kê',
                              icon: Icons.person_outline,
                              controller: _employeeController,
                              readOnly: true,
                              isRequired: true,
                              validator: FormBuilderValidators.required(
                                errorText: 'Vui lòng chọn người kiểm kê',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        /// ===== TRẠNG THÁI =====
                        FormChoiceGroup<bool>(
                          name: 'inventory_check_status',
                          label: 'Trạng thái',
                          icon: Icons.flag_outlined,
                          columns: 2,
                          initialValue: false,
                          options: const [
                            FormChoiceOption(
                              value: false,
                              label: 'Chưa hoàn thành',
                            ),
                            FormChoiceOption(
                              value: true,
                              label: 'Đã hoàn thành',
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        /// ===== GHI CHÚ =====
                        FormInputField(
                          nameForm: 'inventory_check_note',
                          nameTextField: 'inventory_check_note_field',
                          label: 'Ghi chú',
                          icon: Icons.note_alt_outlined,
                          autoExpand: true,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: BlocBuilder<InventoryCheckBloc, InventoryCheckState>(
              bloc: bloc,
              buildWhen: (prev, curr) => prev.isSaving != curr.isSaving,
              builder: (context, state) {
                return FormActions(
                  mode: FormActionMode.add,
                  submitText: state.isSaving ? 'Đang lưu...' : 'Lưu',
                  submitEnabled: !state.isSaving,
                  onSubmit: state.isSaving ? null : _onSubmit,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Mở sheet chọn nhân viên kiểm kê rồi đồng bộ giá trị vào form.
  Future<void> _openEmployeeSheet() async {
    final employees = bloc.state.employees;
    if (employees.isEmpty) {
      context.showMessage(
        'Chưa có danh sách nhân viên kiểm kê',
        type: SnackBarType.error,
      );
      return;
    }

    await openSelectBottomSheet<InventoryCheckEmployee>(
      context: context,
      title: 'Chọn người kiểm kê',
      items: employees,
      hintText: 'Tìm theo tên hoặc mã NV...',
      displayText: (item) =>
          '${item.code ?? ''} - ${item.fullName ?? ''}'.trim(),
      onSelected: (item) {
        setState(() => _selectedEmployee = item);
        final name = (item.fullName ?? '').trim();
        if (_employeeController.text != name) {
          _employeeController.text = name;
        }
        _formKey.currentState?.fields['inventory_check_employee']?.didChange(
          name,
        );
      },
    );
  }

  /// Validate form rồi gửi payload tạo đợt kiểm kê.
  void _onSubmit() {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;
    if (!formState.saveAndValidate()) return;

    final values = formState.value;
    final employeeId = _selectedEmployee?.id;

    if (employeeId == null) {
      context.showMessage(
        'Vui lòng chọn người kiểm kê',
        type: SnackBarType.error,
      );
      return;
    }

    final code = '${values['inventory_check_code'] ?? ''}'.trim();
    if (code.isEmpty) {
      context.showMessage(
        'Chưa sinh được mã đợt kiểm kê, vui lòng thử lại',
        type: SnackBarType.error,
      );
      return;
    }

    final name = '${values['inventory_check_name'] ?? ''}'.trim();
    final note = '${values['inventory_check_note'] ?? ''}'.trim();
    final warehouseId = values['inventory_check_warehouse'] as int?;
    final isComplete = values['inventory_check_status'] as bool? ?? false;

    if (warehouseId == null) {
      context.showMessage(
        'Vui lòng chọn kho kiểm kê',
        type: SnackBarType.error,
      );
      return;
    }

    bloc.add(
      InventoryCheckEvent.save(
        InventoryCountSavePayload(
          code: code,
          name: name,
          warehouseId: warehouseId,
          employeeId: employeeId,
          dateCount: _buildDateCount(),
          note: note.isEmpty ? null : note,
          isComplete: isComplete,
        ),
      ),
    );
  }

  /// `DateCount` gửi API = ngày kiểm kê đang chọn, giữ giờ hiện tại,
  /// chuyển sang UTC (server nhận chuẩn ISO `...Z`).
  String _buildDateCount() {
    final now = DateTime.now();
    return DateTime(
      _dateCount.year,
      _dateCount.month,
      _dateCount.day,
      now.hour,
      now.minute,
      now.second,
      now.millisecond,
    ).toUtc().toIso8601String();
  }
}
