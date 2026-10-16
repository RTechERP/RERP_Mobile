// Widget field dạng "tap để mở bottom-sheet chọn" dùng chung cho form thêm
// yêu cầu thuê xe: loại xe, người yêu cầu, dự án.

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';

/// Field dạng dropdown mở bottom-sheet khi tap.
/// Hiển thị `FormInputField` ở chế độ readOnly + `AbsorbPointer` chặn keyboard.
class RentalVehicleSelectField<T> extends StatelessWidget {
  const RentalVehicleSelectField({
    super.key,
    required this.nameForm,
    required this.label,
    required this.icon,
    required this.items,
    required this.onSelected,
    required this.displayText,
    required this.sheetTitle,
    this.initialSelectedItem,
    this.isRequired = true,
    this.errorText,
  });

  /// Tên field lưu trong FormBuilder (lưu id dạng string).
  final String nameForm;

  /// Label hiển thị.
  final String label;

  /// Icon bên trái.
  final IconData icon;

  /// Danh sách item hiển thị trong bottom-sheet.
  final List<T> items;

  /// Title của bottom-sheet.
  final String sheetTitle;

  /// Callback khi user chọn 1 item.
  final void Function(T selected) onSelected;

  /// Hàm convert item → string hiển thị trong sheet.
  final String Function(T) displayText;

  /// Item đang được chọn (highlight trong sheet).
  final T? initialSelectedItem;

  /// Bắt buộc chọn (validate).
  final bool isRequired;

  /// Thông báo lỗi nếu chưa chọn.
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openSelectBottomSheet<T>(
          context: context,
          title: sheetTitle,
          items: items,
          onSelected: onSelected,
          displayText: displayText,
          initialSelectedItem: initialSelectedItem,
        );
      },
      child: AbsorbPointer(
        child: FormInputField(
          nameForm: nameForm,
          nameTextField: '${nameForm}_text',
          label: label,
          icon: icon,
          isRequired: isRequired,
          readOnly: true,
          validator: isRequired
              ? FormBuilderValidators.required(errorText: errorText)
              : null,
        ),
      ),
    );
  }
}
