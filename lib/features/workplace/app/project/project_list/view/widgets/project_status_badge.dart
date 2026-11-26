import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

/// Màu hiển thị theo trạng thái dự án.
///
/// Dùng chung cho badge trên card và cho chip trạng thái trong bộ lọc để
/// màu luôn nhất quán.
class ProjectStatusColors {
  const ProjectStatusColors._();

  /// Màu nền của badge trạng thái.
  static Color background(String status) {
    final v = status.toLowerCase();
    if (v.contains('đang thực hiện')) return AppColors.greenA500;
    if (v.contains('tiếp cận') || v.contains('báo giá')) {
      return AppColors.orangeA500;
    }
    if (v.contains('hủy') || v.contains('huỷ')) return AppColors.redA500;
    return AppColors.gray.withValues(alpha: 0.15);
  }

  /// Màu chữ của badge trạng thái.
  static Color text(String status) {
    final v = status.toLowerCase();
    if (v.contains('đang thực hiện')) return Colors.white;
    if (v.contains('tiếp cận') || v.contains('báo giá')) return Colors.white;
    if (v.contains('hủy') || v.contains('huỷ')) return Colors.white;
    return AppColors.enableText;
  }

  /// Màu viền của badge trạng thái.
  static Color border(String status) {
    final v = status.toLowerCase();
    if (v.contains('đang thực hiện')) return AppColors.greenA400;
    if (v.contains('tiếp cận') || v.contains('báo giá')) {
      return AppColors.orangeA400;
    }
    if (v.contains('hủy') || v.contains('huỷ')) return AppColors.redA400;
    return AppColors.gray.withValues(alpha: 0.3);
  }
}

/// Badge hiển thị trạng thái project với màu tương ứng.
class ProjectStatusBadge extends StatelessWidget {
  const ProjectStatusBadge({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final label = status.trim();
    if (label.isEmpty) return const SizedBox.shrink();

    final bgColor = ProjectStatusColors.background(label);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ProjectStatusColors.border(label), width: 0.8),
        boxShadow: [
          BoxShadow(
            color: bgColor.withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: ProjectStatusColors.text(label),
          fontWeight: FontWeight.w600,
          height: 1,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
