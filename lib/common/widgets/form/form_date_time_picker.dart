import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'index.dart';

class FormDateTimePicker extends StatelessWidget {
  final String name;
  final String label;
  final IconData icon;

  final InputType inputType;
  final DateFormat format;
  final bool enabled;

  final DateTime? initialValue;
  final ValueChanged<DateTime?>? onChanged;
  final ValueChanged<DateTime?>? onSaved; // ✅ thêm onSaved

  final FormFieldValidator<DateTime?>? validator;

  const FormDateTimePicker({
    super.key,
    required this.name,
    required this.label,
    required this.icon,
    required this.inputType,
    required this.format,
    this.enabled = true,
    this.initialValue,
    this.onChanged,
    this.onSaved, // ✅ thêm vào constructor
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      inputType: inputType,
      format: format,
      enabled: enabled,
      initialValue: initialValue,

      // ✅ Bắt cả 2 case: user đổi ngày + form save
      onChanged: (v) {
        debugPrint('🟡 FormDateTimePicker onChanged = $v');
        onChanged?.call(v);
      },
      onSaved: (v) {
        debugPrint('🟠 FormDateTimePicker onSaved = $v');
        onSaved?.call(v);
      },

      decoration: formInputDecoration(
        context,
        label: label,
        icon: icon,
      ),
      validator: validator,
    );
  }
}

