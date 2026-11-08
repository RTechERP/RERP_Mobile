import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/common/widgets/form/index.dart';

/// Form dùng chung cho màn tạo mới và màn chỉnh sửa đợt kiểm kê.
///
/// Màn tạo mới ([InventoryCheckForm] với `isGeneratingCode = true`) sinh mã
/// đợt từ API `generate-code`; màn chỉnh sửa dùng lại mã đợt đã có.
class InventoryCheckForm extends StatelessWidget {
  const InventoryCheckForm({
    super.key,
    required this.formKey,
    required this.codeController,
    required this.employeeController,
    required this.name,
    required this.dateCount,
    required this.warehouseId,
    required this.employeeId,
    required this.isComplete,
    required this.note,
    required this.onDateChanged,
    required this.onTapEmployee,
    this.isGeneratingCode = false,
  });

  /// Key của `FormBuilder` để screen đọc giá trị khi submit.
  final GlobalKey<FormBuilderState> formKey;

  /// Controller của ô mã đợt — nhận giá trị sinh từ API `generate-code`
  /// hoặc mã đợt đã có khi sửa.
  final TextEditingController codeController;

  /// Controller của ô người kiểm kê — nhận tên NV được chọn trong sheet.
  final TextEditingController employeeController;

  /// Tên đợt kiểm kê.
  final String name;

  /// Ngày kiểm kê đang chọn.
  final DateTime dateCount;

  /// Id kho kiểm kê (1 = Kho Demo, 2 = Kho Modula, 3 = Kho AGV).
  final int warehouseId;

  /// Id nhân viên kiểm kê đang chọn (null = chưa chọn).
  final int? employeeId;

  /// Đợt kiểm kê đã hoàn thành hay chưa.
  final bool isComplete;

  /// Ghi chú của đợt kiểm kê.
  final String note;

  /// Callback khi người dùng đổi ngày kiểm kê.
  final ValueChanged<DateTime> onDateChanged;

  /// Callback mở sheet chọn người kiểm kê.
  final VoidCallback onTapEmployee;

  /// Đang sinh mã đợt từ API (chỉ có ở màn tạo mới).
  final bool isGeneratingCode;

  /// Danh sách kho có thể chọn.
  static const List<FormChoiceOption<int>> warehouseOptions = [
    FormChoiceOption(value: 1, label: 'Kho Demo'),
    FormChoiceOption(value: 2, label: 'Kho Modula'),
    FormChoiceOption(value: 3, label: 'Kho AGV'),
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: FormCard(
        title: 'Thông tin đợt kiểm kê',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== MÃ ĐỢT KIỂM KÊ =====
            FormInputField(
              nameForm: 'inventory_check_code',
              nameTextField: 'inventory_check_code_field',
              label: 'Mã đợt kiểm kê',
              icon: Icons.qr_code_2_outlined,
              controller: codeController,
              readOnly: true,
              isRequired: true,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng nhập mã đợt kiểm kê',
              ),
              suffixIcon: isGeneratingCode
                  ? const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 12),

            /// ===== TÊN ĐỢT KIỂM KÊ =====
            FormInputField(
              nameForm: 'inventory_check_name',
              nameTextField: 'inventory_check_name_field',
              label: 'Tên đợt kiểm kê',
              icon: Icons.title_outlined,
              initialValue: name,
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
              initialValue: dateCount,
              initialDate: dateCount,
              isRequired: true,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng chọn ngày kiểm kê',
              ),
              onChanged: (value) {
                if (value == null) return;
                onDateChanged(value);
              },
            ),
            const SizedBox(height: 16),

            /// ===== KHO KIỂM KÊ =====
            FormChoiceGroup<int>(
              name: 'inventory_check_warehouse',
              label: 'Kho kiểm kê',
              icon: Icons.warehouse_outlined,
              columns: 3,
              initialValue: warehouseId,
              options: warehouseOptions,
              isRequired: true,
            ),
            const SizedBox(height: 16),

            /// ===== NGƯỜI KIỂM KÊ =====
            GestureDetector(
              onTap: onTapEmployee,
              child: AbsorbPointer(
                child: FormInputField(
                  nameForm: 'inventory_check_employee',
                  nameTextField: 'inventory_check_employee_field',
                  label: 'Người kiểm kê',
                  icon: Icons.person_outline,
                  controller: employeeController,
                  readOnly: true,
                  isRequired: true,
                  // Validate theo nhân viên đã chọn (id) thay vì theo text,
                  // vì khi sửa phiếu cũ tên NV có thể chưa kịp tải về.
                  validator: (_) =>
                      employeeId == null ? 'Vui lòng chọn người kiểm kê' : null,
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
              initialValue: isComplete,
              options: const [
                FormChoiceOption(value: false, label: 'Chưa hoàn thành'),
                FormChoiceOption(value: true, label: 'Đã hoàn thành'),
              ],
            ),
            const SizedBox(height: 12),

            /// ===== GHI CHÚ =====
            FormInputField(
              nameForm: 'inventory_check_note',
              nameTextField: 'inventory_check_note_field',
              label: 'Ghi chú',
              icon: Icons.note_alt_outlined,
              initialValue: note.isEmpty ? null : note,
              autoExpand: true,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
            ),
          ],
        ),
      ),
    );
  }
}
