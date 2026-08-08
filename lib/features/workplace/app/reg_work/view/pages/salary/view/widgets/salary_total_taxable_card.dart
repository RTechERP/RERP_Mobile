import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
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

    return SalaryCard(
      accentColor: AppColors.secondaryERP,
      title: 'Tổng thu nhập tính thuế',
      icon: Icons.receipt_long_outlined,
      formula: '(40) → (48)',
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
                value: fDecimal(state.totalTaxDeduction),
                formula: '(46)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thu nhập tính thuế',
                value: fDecimal(state.taxAbleIncome),
                formula: '(47)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Khấu trừ Thuế TNCN',
                value: fDecimal(state.taxDeduction),
                formula: '(48)',
                highlightBg: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
