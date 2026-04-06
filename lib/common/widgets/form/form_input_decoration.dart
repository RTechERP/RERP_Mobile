import 'package:flutter/material.dart';

import '../../app_theme/index.dart';

InputDecoration formInputDecoration(
    BuildContext context, {
      required String label,
      IconData? icon,
      bool hasError = false,
      String? errorText,
      bool isRequired = false,
    }) {
  final error = Colors.redAccent;
  final normal = AppColors.hintText;

  OutlineInputBorder border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(color: color, width: 1.4),
  );


  return InputDecoration(
    label: isRequired
        ? Text.rich(
            TextSpan(
              text: label,
              children: const [
                TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
              ],
            ),
          )
        : Text(label),
    floatingLabelBehavior: FloatingLabelBehavior.auto,

    /// ICON đổi màu theo error
    prefixIcon: Icon(
      icon,
      color: hasError ? error : normal,
    ),

    filled: true,
    fillColor: AppColors.white,
    border: border(normal),
    enabledBorder: border(normal),
    focusedBorder: border(normal),

    /// BORDER khi error
    errorBorder: border(error),
    focusedErrorBorder: border(error),

    /// ERROR TEXT (nếu bạn muốn hiển thị)
    errorText: hasError ? errorText : null,
    errorStyle: const TextStyle(
      color: Colors.redAccent,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),

    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 18,
    ),
  );
}
