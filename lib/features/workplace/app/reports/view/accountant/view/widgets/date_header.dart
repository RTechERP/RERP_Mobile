import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../bloc/accountant_bloc.dart';

class AccountantDateHeader extends StatelessWidget {
  final AccountantState state;

  const AccountantDateHeader({super.key, required this.state});

  String _formatDate(DateTime d) =>
      DateFormat('dd/MM/yyyy').format(d);

  @override
  Widget build(BuildContext context) {
    final hasFilter = state.dateStart != null && state.dateEnd != null;
    final text = hasFilter
        ? 'Từ: ${_formatDate(state.dateStart!)} - Đến: ${_formatDate(state.dateEnd!)}'
        : 'Đang tải...';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.white),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
