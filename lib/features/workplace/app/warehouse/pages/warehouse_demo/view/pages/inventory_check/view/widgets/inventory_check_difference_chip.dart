import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Chip hiển thị chênh lệch số lượng kiểm kê của một dòng sản phẩm.
///
/// - Chênh lệch âm → thiếu, hiển thị `Lệch -<số>` (màu đỏ).
/// - Chênh lệch dương → thừa, hiển thị `Lệch +<số>` (màu cam).
/// - Chênh lệch bằng 0 → khớp, hiển thị `Khớp` (màu xanh).
///
/// Không hiển thị chip khi [difference] null (dòng chưa được kiểm kê).
class InventoryCheckDifferenceChip extends StatelessWidget {
  const InventoryCheckDifferenceChip({super.key, required this.difference});

  /// Chênh lệch giữa số lượng thực tế và số lượng hệ thống (null = chưa kiểm).
  final double? difference;

  @override
  Widget build(BuildContext context) {
    final diff = difference;
    if (diff == null) return const SizedBox.shrink();

    final color = _chipColor(diff);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            diff == 0 ? Icons.check_circle : Icons.compare_arrows,
            size: 12,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            _label(diff),
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  /// Text chip: `Lệch -2` (thiếu), `Lệch +3` (thừa), `Khớp` (khớp).
  static String _label(double diff) {
    if (diff == 0) return 'Khớp';
    final sign = diff > 0 ? '+' : '-';
    return 'Lệch $sign${_formatQty(diff.abs())}';
  }

  /// Màu chip: xanh khi khớp, đỏ khi thiếu, cam khi thừa.
  static Color _chipColor(double diff) {
    if (diff == 0) return AppColors.stateSuccessColor;
    if (diff < 0) return AppColors.stateErrorColor;
    return AppColors.stateWarningColor;
  }

  /// Format số lượng — bỏ phần thập phân `,00` nếu là số nguyên.
  static String _formatQty(num value) {
    if (value == value.roundToDouble()) return value.toStringAsFixed(0);
    return value.toStringAsFixed(2);
  }
}
