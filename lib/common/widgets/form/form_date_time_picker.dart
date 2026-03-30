import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'index.dart';

class FormDateTimePicker extends StatelessWidget {
  final String nameForm;

  final String nameTimePicker;
  final String label;
  final IconData icon;

  final InputType inputType;
  final DateFormat format;
  final bool enabled;

  final DateTime? initialValue;
  final DateTime? firstDate;
  final DateTime? lastDate;
  /// Ngày lịch mở ra khi bấm chọn (Material date picker).
  final DateTime? initialDate;
  final SelectableDayPredicate? selectableDayPredicate;
  final ValueChanged<DateTime?>? onChanged;
  final ValueChanged<DateTime?>? onSaved;
  final FormFieldValidator<DateTime?>? validator;
  final AutovalidateMode autovalidateMode;

  const FormDateTimePicker({
    super.key,
    required this.nameForm,
    required this.nameTimePicker,
    required this.label,
    required this.icon,
    required this.inputType,
    required this.format,
    this.enabled = true,
    this.initialValue,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.selectableDayPredicate,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime?>(
      name: nameForm,
      initialValue: initialValue,
      validator: validator,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      builder: (field) {
        return FormBuilderDateTimePicker(
          name: nameTimePicker,
          inputType: inputType,
          format: format,
          enabled: enabled,
          initialValue: initialValue,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          selectableDayPredicate: selectableDayPredicate,
          autovalidateMode: autovalidateMode,

          onChanged: (v) {
            field.didChange(v);       // 🔑 sync state cho validator
            onChanged?.call(v);
          },
          onSaved: (v) {
            onSaved?.call(v);
          },

          decoration: formInputDecoration(
            context,
            label: label,
            icon: icon,
            hasError: field.hasError,     // ✅ đổi màu icon khi lỗi
            errorText: field.errorText,   // ✅ show text lỗi
          ),
          validator: validator,
        );
      },
    );
  }
}


