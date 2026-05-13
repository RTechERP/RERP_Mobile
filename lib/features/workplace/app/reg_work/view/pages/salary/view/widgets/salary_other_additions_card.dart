import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';
import 'salary_section_header.dart';

class SalaryOtherAdditionsCard extends StatelessWidget {
  const SalaryOtherAdditionsCard({super.key, required this.state});

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat('#,##0', 'vi_VN');
    String f(num n) => '${nf.format(n.round())}đ';

    return SalaryCard(
      accentColor: AppColors.greenA500,
      title: 'Các khoản cộng khác & Tổng thu nhập tính thuế',
      icon: Icons.add_circle_outline,
      formula: '(20) → (26)',
      child: Column(
        children: [
          SalarySectionHeader(
            title: 'Các khoản cộng khác',
            formula: '(25)',
            color: AppColors.greenA500,
          ),
          const SizedBox(height: 8),
          SalaryRow(
            color: AppColors.greenA500,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            highlightLastColumn: true,
            items: [
              SalaryRowItem(
                label: 'Công tác phí',
                value: f(state.travelAllowance),
                formula: '(20)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Làm đêm',
                value: f(state.nightWorkPay),
                formula: '(21)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Phương tiện công tác',
                value: f(state.transportCost),
                formula: '(22)',
                highlightBg: false,
              ),
            ],
          ),
          const SizedBox(height: 6),
          SalaryRow(
            color: AppColors.greenA500,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            highlightLastColumn: false,
            items: [
              SalaryRowItem(
                label: 'KPIs / doanh số',
                value: f(state.kpiBonus),
                formula: '(23)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Khác',
                value: f(state.otherAddition),
                formula: '(24)',
                highlightBg: false,
              ),
              const SalaryRowItem(label: '', value: ''),
            ],
          ),
          const SizedBox(height: 6),
          SalaryRow(
            color: AppColors.greenA500,
            items: [
              SalaryRowItem(
                label: 'Tổng phụ cấp',
                value: f(state.totalAllowance),
                formula: '(19) = (16) + (17) + (18)',
              ),
            ],
          ),
          const SizedBox(height: 12),
          SalarySectionHeader(
            title: 'Tổng thu nhập tính thuế',
            formula: '(26)',
            color: AppColors.primaryERP,
          ),
          const SizedBox(height: 8),
          SalaryRow(
            color: AppColors.primaryERP,
            highlightFirstColumn: true,
            highlightMiddleColumn: true,
            items: [
              SalaryRowItem(
                label: 'Lương',
                value: f(state.standardSalary),
                formula: '(6)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Tổng làm thêm',
                value: f(state.totalOvertime),
                formula: '(14)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Tổng phụ cấp',
                value: f(state.totalAllowance),
                formula: '(19)',
                highlightBg: false,
              ),
            ],
          ),
          const SizedBox(height: 6),
          SalaryRow(
            color: AppColors.primaryERP,
            highlightFirstColumn: true,
            highlightLastColumn: false,
            items: [
              SalaryRowItem(
                label: 'Các khoản cộng khác',
                value: f(state.totalOtherAdditions),
                formula: '(25)',
                highlightBg: false,
              ),
              const SalaryRowItem(label: '', value: ''),
              const SalaryRowItem(label: '', value: ''),
            ],
          ),
          const SizedBox(height: 6),

          SalaryRow(
            color: AppColors.primaryERP,
            items: [
              SalaryRowItem(
                label: 'Tổng thu nhập',
                value: f(state.totalTaxableIncome),
                formula: '(26)=(6)+(14)+(19)+(25)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
