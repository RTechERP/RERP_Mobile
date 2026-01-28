import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'form_input_decoration.dart';

class TypeDropDown<T> extends StatelessWidget {
  final String name;
  final String label;
  final IconData? icon;
  final List<DropdownMenuItem<T>> items;

  final bool enabled;
  final T? initialValue;
  final FormFieldValidator<T>? validator;
  final ValueChanged<T?>? onChanged;

  const TypeDropDown({
    super.key,
    required this.name,
    required this.label,
    required this.items,
    this.icon,
    this.enabled = true,
    this.initialValue,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      name: name,
      enabled: enabled,
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      decoration: formInputDecoration(
        context,
        label: label,
        icon: icon,
      ),
      items: items,
    );
  }
}
