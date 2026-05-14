import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';
import 'salary_tax_deduction_section.dart';

class SalaryTotalTaxableCard extends StatelessWidget {
  const SalaryTotalTaxableCard({
    super.key,
    required this.state,
  });

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat('#,##0', 'vi_VN');
    String f(num n) => '${nf.format(n.round())}đ';

    return SalaryCard(
      accentColor: AppColors.secondaryERP,
      title: 'Tổng thu nhập tính thuế',
      icon: Icons.receipt_long_outlined,
      formula: '(39) → (47)',
      child: Column(
        children: [
          SalaryTaxDeductionSection(
            state: state,
            nf: nf,
          ),
          const SizedBox(height: 12),
          SalaryRow(
            color: AppColors.stateInfoColor,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            items: [
              SalaryRowItem(
                label: 'Tổng khoản giảm trừ thuế TNCN',
                value: f(state.totalTaxDeduction),
                formula: '(45)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thu nhập tính thuế',
                value: f(state.taxAbleIncome),
                formula: '(46)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Khấu trừ Thuế TNCN',
                value: f(state.taxDeduction),
                formula: '(47)',
                highlightBg: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
