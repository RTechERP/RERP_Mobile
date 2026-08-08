import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryNoteCard extends StatelessWidget {
  const SalaryNoteCard({
    super.key,
    required this.state,
  });

  final SalaryState state;

  @override
  Widget build(BuildContext context) {
    return SalaryCard(
      accentColor: AppColors.gray,
      title: 'Ghi chú',
      formula: '(57)',
      icon: Icons.note_outlined,
      child: Text(
        state.note ?? 'Không có ghi chú',
        style: AppStyles.body2.copyWith(
          color: state.note != null ? AppColors.heading : AppColors.hintText,
        ),
      ),
    );
  }
}
