import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryDeductionsCard extends StatelessWidget {
  const SalaryDeductionsCard({super.key, required this.state});

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat('#,##0', 'vi_VN');
    String f(num n) => '${nf.format(n.round())}đ';

    return SalaryCard(
      accentColor: AppColors.alert,
      title: 'Các khoản phải trừ',
      icon: Icons.remove_circle_outline,
      formula: '(29) → (38)',
      child: Column(
        children: [
          SalaryRow(
            color: AppColors.alert,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            items: [
              SalaryRowItem(
                label: 'Mức đóng BHXH',
                value: '${state.socialInsuranceRate}%',
                formula: '(29)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Phải thu BHXH',
                value: f(state.socialInsuranceAmount),
                formula: '(30) = 10,5%*(27)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Quỹ BĐS',
                value: f(state.unionFundAmount),
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
                value: f(state.salaryAdvance),
                formula: '(32)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thu hộ phòng ban',
                value: f(state.deptCollection),
                formula: '(33)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Gửi xe ô tô',
                value: f(state.carParking),
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
                value: f(state.fiveSParking),
                formula: '(35)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Cơm ca tại VP',
                value: f(state.mealDeduction),
                formula: '(36)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Khác',
                value: f(state.otherDeduction),
                formula: '(37)',
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
                value: f(state.totalDeductions),
                formula: '(38) = (31)+(32)+(33)+(34)+(35)+(36)+(37)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
