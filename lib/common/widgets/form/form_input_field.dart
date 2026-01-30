import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'form_input_decoration.dart';

class FormInputField extends StatelessWidget {
  final String nameForm;
  final String nameTextField;

  final String label;
  final IconData icon;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onSubmitted;

  final int? maxLines;

  final bool enabled;

  const FormInputField({
    super.key,
    required this.nameForm,
    required this.nameTextField,
    required this.label,
    required this.icon,
    this.keyboardType,
    this.focusNode,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSubmitted,
    this.maxLines,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: nameForm,
      validator: validator,
      enabled: enabled,
      builder: (field) {
        final value = field.value?.trim() ?? '';
        final hasValue = value.isNotEmpty;

        /// 🔑 mấu chốt UX
        final showError =
            field.hasError && !hasValue;

        final effectiveMaxLines =
        obscureText ? 1 : (maxLines ?? 1);


        return FormBuilderTextField(
          enabled: enabled,
          name: nameTextField,
          focusNode: focusNode,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          onChanged: field.didChange,
          maxLines: effectiveMaxLines,
          decoration: formInputDecoration(
            context,
            label: label,
            icon: icon,
            hasError: showError,
            errorText: field.errorText,
          ),

        );
      },
    );
  }
}
