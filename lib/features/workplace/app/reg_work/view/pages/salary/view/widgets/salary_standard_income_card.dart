import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryStandardIncomeCard extends StatelessWidget {
  const SalaryStandardIncomeCard({super.key, required this.state});

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    return SalaryCard(
      accentColor: AppColors.stateInfoColor,
      title: 'Thu nhập tiêu chuẩn',
      icon: Icons.account_balance_wallet_outlined,
      formula: '(4) → (7)',
      child: Column(
        children: [
          SalaryRow(
            color: AppColors.stateInfoColor,
            highlightLastColumn: true,
            items: [
              SalaryRowItem(
                label: 'Thu nhập tiêu chuẩn tham chiếu',
                value: fDecimal(state.basicSalary),
                formula: '(4)',
                highlightBg: false,
              ),
            ],
          ),
          SalaryRow(
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            color: AppColors.stateInfoColor,
            items: [
              SalaryRowItem(
                label: 'Công',
                value: state.totalWorkday.toInt().toString(),
                formula: '(5) = CTT+Phép',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Lương',
                value: fDecimal(state.totalSalaryByDay),
                formula: '(6) = (4)/F4*(5)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Đơn giá/giờ',
                value: fDecimal(state.salaryOneHour),
                formula: '(7) = (4)/F4/8',
                highlightBg: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
