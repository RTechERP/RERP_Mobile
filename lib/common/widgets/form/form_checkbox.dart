import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../app_theme/index.dart';

class FormCheckbox extends StatelessWidget {
  final String name;
  final String? label;
  final IconData? icon;

  final Widget title;

  final bool enabled;
  final bool initialValue;
  final ValueChanged<bool?>? onChanged;

  const FormCheckbox({
    super.key,
    required this.name,

    required this.title,
    this.enabled = true,
    this.initialValue = false,
    this.onChanged,
    this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      title: title,
      name: name,
      enabled: enabled,
      initialValue: initialValue,
      onChanged: onChanged,
      activeColor: AppColors.primaryERP,
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Colors.white,
      valueTransformer: (value) => value ?? false,
    );
  }
}
