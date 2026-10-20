// Label nhỏ phía trên mỗi section filter (icon + text).

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

class FilterSectionLabel extends StatelessWidget {
  const FilterSectionLabel({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 13, color: AppColors.gray),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}
