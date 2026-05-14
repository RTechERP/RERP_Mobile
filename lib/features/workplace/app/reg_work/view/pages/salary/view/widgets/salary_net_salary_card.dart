import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryNetSalaryCard extends StatelessWidget {
  const SalaryNetSalaryCard({
    super.key,
    required this.state,
  });

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat('#,##0', 'vi_VN');
    String f(num n) => '${nf.format(n.round())}đ';

    return SalaryCard(
      accentColor: AppColors.stateSuccessColor,
      title: 'Thực lĩnh',
      icon: Icons.account_balance_wallet,
      formula: '(48)',
      child: Column(
        children: [
          SalaryRow(
            color: AppColors.stateSuccessColor,
            items: [
              SalaryRowItem(
                label: 'Thực lĩnh',
                value: f(state.netSalary),
                formula: '(48) = (28) - (30) - (38) - (45)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
