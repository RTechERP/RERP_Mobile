import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../app_theme/index.dart';
import '../../extensions/number_extension.dart';

class FormReadonlyField extends StatelessWidget {
  final String name;
  final String? label;
  final IconData? icon;
  final String? hintText;
  final dynamic initialValue;

  /// 🔥 format giá trị hiển thị (ví dụ: DateTime -> dd/MM/yyyy)
  final String Function(dynamic value)? valueTransformer;

  const FormReadonlyField({
    super.key,
    required this.name,
    this.label,
    this.icon,
    this.hintText,
    this.initialValue,
    this.valueTransformer,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<dynamic>(
      name: name,
      initialValue: initialValue,
      builder: (field) {
        final value = field.value;

        String display;

        if (valueTransformer != null) {
          display = valueTransformer!(value);
        } else if (value is DateTime) {
          display = DateFormat('dd/MM/yyyy').format(value);
        } else if (value is int) {
          display = value.formatVND;
        } else if (value is num) {
          display = value.toInt().formatVND;
        } else {
          display = value?.toString() ?? '';
        }

        return IgnorePointer(
          ignoring: true, // 🔒 chặn toàn bộ interaction
          child: TextFormField(
            initialValue: display.isNotEmpty ? display : (hintText ?? ''),
            readOnly: true, // 🔒 không cho sửa
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              prefixIcon: icon != null ? Icon(icon, size: 20) : null,
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.grayColor[30]!),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.grayColor[30]!),
              ),
            ),
          ),
        );
      },
    );
  }
}