import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryStandardIncomeCard extends StatelessWidget {
  const SalaryStandardIncomeCard({super.key, required this.state});

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat('#,##0', 'vi_VN');
    String f(num n) => '${nf.format(n.round())}đ';

    String fDecimal(num n) {
      final fixed = n.toStringAsFixed(2);
      final parts = fixed.split('.');
      final intPart = parts[0];
      final decPart = parts[1];
      final formatted = intPart.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]},',
      );
      return '${formatted}.$decPart đ';
    }

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
                value: f(state.basicSalary),
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
                value: f(state.totalSalaryByDay),
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
