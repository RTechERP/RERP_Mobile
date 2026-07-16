import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryOvertimeCard extends StatelessWidget {
  const SalaryOvertimeCard({super.key, required this.state, this.onDetailTap});

  final SalaryState state;
  final VoidCallback? onDetailTap;

  @override
  Widget build(BuildContext context) {
    return SalaryCard(
      accentColor: AppColors.warning,
      title: 'Làm thêm',
      icon: Icons.more_time_outlined,
      formula: '(8) → (14)',
      onDetailTap: onDetailTap,
      child: Column(
        children: [
          SalaryRow(
            color: AppColors.warning,
            highlightMiddleColumn: true,
            items: [
              const SalaryRowItem(label: 'Ngày thường', value: ''),
              SalaryRowItem(
                label: 'Số giờ',
                value: state.otHourWD.toString(),
                formula: '(8)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thành tiền',
                value: fDecimal(state.otMoneyWD),
                formula: '(9) = (8)*(7)*1,5',
                highlightBg: false,
              ),
            ],
          ),
          SalaryRow(
            color: AppColors.warning,
            highlightMiddleColumn: true,
            items: [
              const SalaryRowItem(label: 'Cuối tuần', value: ''),
              SalaryRowItem(
                label: 'Số giờ',
                value: state.otHourWK.toString(),
                formula: '(10)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thành tiền',
                value: fDecimal(state.otMoneyWK),
                formula: '(11) = (10)*(7)*2',
                highlightBg: false,
              ),
            ],
          ),
          SalaryRow(
            color: AppColors.warning,
            highlightMiddleColumn: true,
            items: [
              const SalaryRowItem(label: 'Lễ, Tết', value: ''),
              SalaryRowItem(
                label: 'Số giờ',
                value: state.otHourHD.toString(),
                formula: '(12)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thành tiền',
                value: fDecimal(state.otMoneyHD),
                formula: '(13) = (12)*(7)*3',
                highlightBg: false,
              ),
            ],
          ),
          SalaryRow(
            color: AppColors.warning,
            items: [
              SalaryRowItem(
                label: 'Tổng làm thêm',
                value: fDecimal(state.otTotalSalary),
                formula: '(14) = (9)+(11)+(13)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
