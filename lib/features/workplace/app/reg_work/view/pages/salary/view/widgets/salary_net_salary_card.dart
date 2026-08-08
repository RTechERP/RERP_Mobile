import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
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
    return SalaryCard(
      accentColor: AppColors.stateSuccessColor,
      title: 'Thực lĩnh',
      icon: Icons.account_balance_wallet,
      formula: '(49)',
      child: Column(
        children: [
          SalaryRow(
            color: AppColors.stateSuccessColor,
            items: [
              SalaryRowItem(
                label: 'Thực lĩnh',
                value: fDecimal(state.netSalary),
                formula: '(49) = (28) - (30) - (38) - (46)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
