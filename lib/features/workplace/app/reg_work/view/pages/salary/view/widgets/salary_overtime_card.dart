import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryOvertimeCard extends StatelessWidget {
  const SalaryOvertimeCard({
    super.key,
    required this.state,
  });

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat('#,##0', 'vi_VN');
    String f(num n) => '${nf.format(n.round())}đ';

    return SalaryCard(
      accentColor: AppColors.warning,
      title: 'Làm thêm',
      icon: Icons.more_time_outlined,
      formula: '(8) → (14)',
      child: Column(
        children: [
          SalaryRow(
            color: AppColors.warning,
            highlightMiddleColumn: true,
            items: [
              const SalaryRowItem(label: 'Ngày thường', value: ''),
              SalaryRowItem(
                label: 'Số giờ',
                value: f(state.otHourWD),
                formula: '(8)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thành tiền',
                value: f(state.otMoneyWD),
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
                value: f(state.otHourWK),
                formula: '(10)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thành tiền',
                value: f(state.otMoneyWK),
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
                value: f(state.otHourHD),
                formula: '(12)',
                highlightBg: false,
              ),
              SalaryRowItem(
                label: 'Thành tiền',
                value: f(state.otMoneyHD),
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
                value: f(state.otTotalSalary),
                formula: '(14) = (9)+(11)+(13)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
