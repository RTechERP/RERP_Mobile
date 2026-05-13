import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryInfoCard extends StatelessWidget {
  const SalaryInfoCard({
    super.key,
    required this.state,
  });

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    return SalaryCard(
      accentColor: AppColors.secondaryERP,
      title: 'Thông tin chung',
      icon: Icons.person_outline,
      child: Column(
        children: [
          SalaryInfoRow(label: 'Họ và tên', value: state.employeeName ?? '-'),
          SalaryInfoRow(label: 'Mã NV', value: state.employeeCode ?? '-'),
          SalaryInfoRow(label: 'Chức vụ', value: state.position ?? '-'),
          SalaryInfoRow(label: 'Hợp đồng', value: state.contractType ?? '-'),
          SalaryInfoRow(
            label: 'Ngày vào',
            value: state.joinDate != null
                ? '${state.joinDate!.day.toString().padLeft(2, '0')}/${state.joinDate!.month.toString().padLeft(2, '0')}/${state.joinDate!.year}'
                : '-',
          ),
        ],
      ),
    );
  }
}
