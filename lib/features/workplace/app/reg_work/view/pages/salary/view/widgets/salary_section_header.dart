import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

class SalarySectionHeader extends StatelessWidget {
  const SalarySectionHeader({
    super.key,
    required this.title,
    required this.formula,
    required this.color,
  });

  final String title;
  final String formula;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: AppStyles.body2.copyWith(
              color: AppColors.heading,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            formula,
            style: AppStyles.caption2.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
