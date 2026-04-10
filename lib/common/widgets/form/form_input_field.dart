import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'form_input_decoration.dart';

class FormInputField extends StatefulWidget {
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
  final bool readOnly;
  final bool isRequired;

  final VoidCallback? onTap;

  final TextEditingController? controller;

  final String? initialValue;

  final ValueChanged<String?>? onChanged;

  final ValueChanged<FormFieldState<String>>? onFieldCreated;

  final AutovalidateMode autovalidateMode;

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
    this.readOnly = false,
    this.isRequired = false,
    this.onTap,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onFieldCreated,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  State<FormInputField> createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  TextEditingController? _internalController;
  FocusNode? _internalFocusNode;

  TextEditingController get _effectiveController {
    return widget.controller ??
        (_internalController ??= TextEditingController());
  }

  FocusNode get _effectiveFocusNode {
    return widget.focusNode ?? (_internalFocusNode ??= FocusNode());
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController?.dispose();
    }
    _internalFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: widget.nameForm,
      initialValue: widget.initialValue ?? (widget.controller?.text.isNotEmpty == true ? widget.controller!.text : null),
      validator: widget.validator,
      enabled: widget.enabled,
      autovalidateMode: widget.autovalidateMode,
      focusNode: _effectiveFocusNode,
      builder: (field) {
        widget.onFieldCreated?.call(field);

        // Không trim khi đồng bộ controller — trim làm mất space đang gõ (kéo ngược con trỏ).
        final rawValue = field.value ?? '';
        final hasValue = rawValue.trim().isNotEmpty;

        final showError = field.hasError;
        final effectiveMaxLines = widget.obscureText ? 1 : (widget.maxLines ?? 1);

        final controller = _effectiveController;
        final fNode = _effectiveFocusNode;

        /// Sync giữa field value và controller:
        /// - External controller (widget.controller != null): controller là source-of-truth
        ///   → sync controller -> field (tránh ghi đè giá trị sẵn có trong controller).
        /// - Internal controller: field value là source-of-truth (bottomsheet / initialValue)
        ///   → sync field -> controller.
        if (widget.controller != null) {
          // External controller → sync controller -> field
          if (controller.text != rawValue && controller.text.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              field.didChange(controller.text);
            });
          }
        } else {
          // Internal controller → sync field -> controller
          if (controller.text != rawValue) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              controller.text = rawValue;
            });
          }
        }

        return FormBuilderTextField(
          name: widget.nameTextField,
          controller: controller,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          enabled: widget.enabled,
          focusNode: fNode,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          onSubmitted: widget.onSubmitted,
          maxLines: effectiveMaxLines,
          decoration: formInputDecoration(
            context,
            label: widget.label,
            icon: widget.icon,
            hasError: showError,
            errorText: field.errorText,
            isRequired: widget.isRequired,
          ),
          onChanged: (v) {
            field.didChange(v);
            widget.onChanged?.call(v);
          },
        );
      },
    );
  }
}