import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputField extends StatelessWidget {
  final String name;
  final String hint;
  final IconData icon;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onSubmitted;
  final bool showError;

  const InputField({
    super.key,
    required this.name,
    required this.hint,
    required this.icon,
    this.focusNode,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSubmitted,
    this.showError = true,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      validator: validator,
      builder: (field) {
        final hasError = field.hasError && showError;
        final hasValue =
            field.value != null && field.value!.trim().isNotEmpty;

        /// Nếu đã có giá trị → không hiện error
        final showErrorUI = hasError && !hasValue;

        final errorColor = Colors.redAccent;
        final normalColor = Colors.grey;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ERROR TEXT (ở trên)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: showErrorUI
                  ? Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 6),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
                  : const SizedBox.shrink(),
            ),

            /// INPUT
            TextField(
              focusNode: focusNode,
              obscureText: obscureText,
              textInputAction: textInputAction,
              onChanged: field.didChange,
              onSubmitted: onSubmitted,
              style: TextStyle(
                color: showErrorUI ? errorColor : Colors.black,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: showErrorUI
                      ? errorColor.withOpacity(0.8)
                      : normalColor,
                ),
                prefixIcon: Icon(
                  icon,
                  color: showErrorUI ? errorColor : normalColor,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

