import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../app_theme/index.dart';
import '../../extensions/number_extension.dart';

class FormReadonlyField extends StatelessWidget {
  final String name;
  final String? label;
  final IconData? icon;
  final String? hintText;

  final dynamic initialValue;

  const FormReadonlyField({
    super.key,
    required this.name,
    this.label,
    this.icon,
    this.hintText,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<dynamic>(
      name: name,
      initialValue: initialValue,
      builder: (field) {
        final value = field.value;

        String display;
        if (value is int) {
          display = value.formatVND; // 🔥 FORMAT Ở ĐÂY
        } else if (value is num) {
          display = value.toInt().formatVND;
        } else {
          display = value?.toString() ?? hintText ?? '--';
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label ?? '', style: AppStyles.hintText),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  if (icon != null)
                    Icon(icon, size: 20, color: Colors.grey),
                  if (icon != null) const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      display,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}