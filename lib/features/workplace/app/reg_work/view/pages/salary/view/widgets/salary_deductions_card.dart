import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryDeductionsCard extends StatelessWidget {
  const SalaryDeductionsCard({
    super.key,
    required this.state,
    this.onDetailTap,
  });

  final SalaryState state;
  final VoidCallback? onDetailTap;

  @override
  Widget build(BuildContext context) {
    return SalaryCard(
      accentColor: AppColors.alert,
      title: 'Các khoản phải trừ',
      icon: Icons.remove_circle_outline,
      formula: '(29) → (39)',
      onDetailTap: onDetailTap,
      child: Column(
        children: [
          SalaryRow(
            color: AppColors.alert,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            items: [
              SalaryRowItem(
                label: 'Mức đóng BHXH',
                value: fDecimal(state.socialInsurance),
                formula: '(29)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Phải thu BHXH',
                value: fDecimal(state.insurances),
                formula: '(30) = 10,5%*(27)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Quỹ BĐS',
                value: fDecimal(state.unionFees),
                formula: '(31) = 1%*(27)',
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
                label: 'Ứng lương',
                value: fDecimal(state.advancePayment),
                formula: '(32)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thu hộ phòng ban',
                value: fDecimal(state.departmentalFees),
                formula: '(33)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Gửi xe ô tô',
                value: fDecimal(state.parkingMoney),
                formula: '(34)',
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
                label: '5s',
                value: fDecimal(state.punish5S),
                formula: '(35)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Cơm ca tại VP',
                value: fDecimal(state.mealUse),
                formula: '(36)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Vi phạm quy định',
                value: fDecimal(state.regulationViolation),
                formula: '(37)',
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
                label: 'Khác',
                value: fDecimal(state.otherDeduction),
                formula: '(38)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: '',
                value: '',
                formula: '',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: '',
                value: '',
                formula: '',
                highlightBg: false,
              ),
            ],
          ),
          const SizedBox(height: 10),
          SalaryRow(
            color: AppColors.alert,
            items: [
              SalaryRowItem(
                label: 'Tổng các khoản trừ',
                value: fDecimal(state.totalDeduction),
                formula: '(39) = (31)+(32)+(33)+(34)+(35)+(36)+(37)+(38)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
