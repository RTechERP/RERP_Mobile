import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryPenaltyCard extends StatelessWidget {
  const SalaryPenaltyCard({
    super.key,
    required this.state,
  });

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    return SalaryCard(
      accentColor: AppColors.alert,
      title: 'Tổng hợp phạt',
      icon: Icons.warning_amber_outlined,
      formula: '(50) → (56)',
      child: Column(
        children: [
          SalaryRow(
            color: AppColors.alert,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            items: [
              SalaryRowItem(
                label: 'Đi muộn về sớm',
                value: state.penaltyLateEarlyQty.toString(),
                formula: '(50)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Đi muộn về sớm',
                value: fDecimal(state.penaltyLateEarlyAmount),
                formula: '(51)',
                highlightBg: false,
              ),
            ],
          ),
          const SizedBox(height: 8),
          SalaryRow(
            color: AppColors.alert,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            items: [
              SalaryRowItem(
                label: 'Quên chấm công',
                value: state.penaltyMissingAttendanceQty.toString(),
                formula: '(52)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Quên chấm công',
                value: fDecimal(state.penaltyMissingAttendanceAmount),
                formula: '(53)',
                highlightBg: false,
              ),
            ],
          ),
          const SizedBox(height: 8),
          SalaryRow(
            color: AppColors.alert,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            items: [
              SalaryRowItem(
                label: 'Nghỉ > 2 ngày/tháng',
                value: state.penaltyLeaveOver2DaysQty.toString(),
                formula: '(54)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Nghỉ > 2 ngày/tháng',
                value: fDecimal(state.penaltyLeaveOver2DaysAmount),
                formula: '(55)',
                highlightBg: false,
              ),
            ],
          ),
          const SizedBox(height: 10),
          SalaryRow(
            color: AppColors.alert,
            items: [
              SalaryRowItem(
                label: 'Tổng',
                value: fDecimal(state.penaltyTotalAmount),
                formula: '(56)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
