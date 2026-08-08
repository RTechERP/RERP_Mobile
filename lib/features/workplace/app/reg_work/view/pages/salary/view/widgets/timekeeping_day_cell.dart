import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/salary_model.dart';

class TimekeepingDayCell extends StatelessWidget {
  const TimekeepingDayCell({
    super.key,
    required this.day,
    required this.date,
    this.dayItem,
  });

  final int day;
  final DateTime date;
  final TimekeepingDayItem? dayItem;

  @override
  Widget build(BuildContext context) {
    final checkIn = dayItem?.checkIn;
    final isX = checkIn == 'X';
    final isP = checkIn == 'P';
    final isHoliday = dayItem?.status == 6;

    final Color bgColor = isX
        ? AppColors.stateSuccessColor.withValues(alpha: 0.12)
        : isP
            ? AppColors.warning.withValues(alpha: 0.15)
            : AppColors.white;

    final Color textColor = isX
        ? AppColors.stateSuccessColor
        : isP
            ? AppColors.warning
            : isHoliday
                ? AppColors.alert
                : AppColors.text;

    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.borderColor.withValues(alpha: 0.5),
          width: 1.2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$day',
            style: AppStyles.body2.copyWith(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            checkIn ?? '',
            style: AppStyles.caption2.copyWith(
              color: textColor.withValues(alpha: 0.8),
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
