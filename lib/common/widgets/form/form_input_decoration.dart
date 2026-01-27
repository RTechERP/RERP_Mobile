import 'package:flutter/material.dart';

InputDecoration formInputDecoration(
    BuildContext context, {
      required String label,
      IconData? icon,
    }) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon),
    filled: true,
    fillColor: Colors.grey.shade100,

    contentPadding:
    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 1.5,
      ),
    ),
  );
}
