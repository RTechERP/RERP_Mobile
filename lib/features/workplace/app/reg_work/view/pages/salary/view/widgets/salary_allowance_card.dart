import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryAllowanceCard extends StatelessWidget {
  const SalaryAllowanceCard({super.key, required this.state, this.onDetailTap});

  final SalaryState state;
  final VoidCallback? onDetailTap;

  @override
  Widget build(BuildContext context) {
    return SalaryCard(
      accentColor: AppColors.purpleA500,
      title: 'Phụ cấp',
      icon: Icons.add_card,
      formula: '(17) → (19)',
      onDetailTap: onDetailTap,
      child: Column(
        children: [
          SalaryRow(
            color: AppColors.purpleA500,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            highlightLastColumn: false,
            items: [
              SalaryRowItem(
                label: 'Cơm ca sau 20H/theo loại công tác',
                value: fDecimal(state.allowanceMeal),
                formula: '(17)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Đi làm trước 7h15',
                value: fDecimal(state.allowanceOTEarly),
                formula: '(18)',
                highlightBg: false,
              ),
              const SalaryRowItem(label: '', value: ''),
            ],
          ),
          SizedBox(height: 8),
          SalaryRow(
            color: AppColors.purpleA500,
            items: [
              SalaryRowItem(
                label: 'Tổng phụ cấp',
                value: fDecimal(state.totalAllowance),
                formula: '(19) = (17)+(18)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
