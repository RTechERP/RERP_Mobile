import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryAllowanceCard extends StatelessWidget {
  const SalaryAllowanceCard({super.key, required this.state});

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat('#,##0', 'vi_VN');
    String f(num n) => '${nf.format(n.round())}đ';

    return SalaryCard(
      accentColor: AppColors.purpleA500,
      title: 'Phụ cấp',
      icon: Icons.add_card,
      formula: '(17) → (19)',
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
                value: f(state.mealAllowance),
                formula: '(17)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Đi làm trước 7h15',
                value: f(state.earlyShiftAllowance),
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
                value: f(state.totalAllowance),
                formula: '(19) = (16)+(17)+(18)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
