import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/tech_model.dart';

/// Chip trạng thái hiển thị số giờ hành chính đã dùng so với giới hạn trong ngày.
///
/// Hiển thị theo định dạng `0/8h`. Chip chuyển sang màu cảnh báo khi tổng giờ
/// vượt quá giới hạn cho phép.
class TechAdminHoursChip extends StatelessWidget {
  const TechAdminHoursChip({
    super.key,
    required this.totalHours,
    this.maxHours = 8,
  });

  /// Số giờ hành chính đã dùng.
  final double totalHours;

  /// Giới hạn giờ hành chính trong ngày.
  final double maxHours;

  /// Tổng giờ hành chính của toàn bộ hạng mục trong các dự án của báo cáo.
  static double totalOf(List<TechProject> projects) {
    return projects
        .expand((p) => p.works)
        .fold<double>(0, (sum, w) => sum + w.totalHours);
  }

  @override
  Widget build(BuildContext context) {
    final isOverLimit = totalHours > maxHours;
    final color = isOverLimit ? AppColors.alert : AppColors.secondaryERP;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            '${_formatHours(totalHours)}/${_formatHours(maxHours)}h',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  /// Format giờ: bỏ phần thập phân 0, dùng ',' trên iOS theo quy ước dự án.
  static String _formatHours(double value) {
    final sep = Platform.isIOS ? ',' : '.';
    if (value == value.toInt()) return value.toInt().toString();
    return value.toString().replaceFirst('.', sep);
  }
}
