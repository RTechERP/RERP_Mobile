import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Chip trạng thái của một đợt kiểm kê.
///
/// [isComplete] = true → "Đã hoàn thành" (xanh), ngược lại "Đang kiểm kê" (cam).
class InventoryCheckStatusChip extends StatelessWidget {
  const InventoryCheckStatusChip({super.key, required this.isComplete});

  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    final color = isComplete
        ? AppColors.stateSuccessColor
        : AppColors.stateWarningColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isComplete ? Icons.check_circle : Icons.pending_outlined,
            size: 13,
            color: color,
          ),
          const SizedBox(width: 5),
          Text(
            isComplete ? 'Đã hoàn thành' : 'Đang kiểm kê',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
