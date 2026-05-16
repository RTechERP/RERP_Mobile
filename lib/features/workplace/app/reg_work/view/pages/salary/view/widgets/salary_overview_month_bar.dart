import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../widgets/salary_month_picker.dart';

class SalaryOverviewMonthBar extends StatelessWidget {
  const SalaryOverviewMonthBar({super.key, required this.selectedMonth, required this.onMonthChanged});

  final DateTime? selectedMonth;
  final ValueChanged<DateTime> onMonthChanged;

  @override
  Widget build(BuildContext context) {
    final monthLabel = selectedMonth != null
        ? DateFormat('MM/yyyy', 'vi_VN').format(selectedMonth!)
        : 'Chọn tháng';

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => SalaryMonthPicker.show(
        context,
        selectedMonth: selectedMonth,
        onApply: onMonthChanged,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month, color: AppColors.primaryERP, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tổng hợp', style: AppStyles.caption2.copyWith(color: AppColors.gray)),
                  const SizedBox(height: 2),
                  Text(
                    monthLabel,
                    style: AppStyles.subtitle2.copyWith(color: AppColors.heading, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.gray),
          ],
        ),
      ),
    );
  }
}
