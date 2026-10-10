import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';

/// Badge hiển thị trạng thái project với màu tương ứng.
class ProjectStatusBadge extends StatelessWidget {
  const ProjectStatusBadge({super.key, required this.status});

  final String status;

  ApprovalStatus _mapStatus() {
    final v = status.toLowerCase();
    if (v.contains('đang thực hiện')) return ApprovalStatus.approved;
    if (v.contains('tiếp cận') || v.contains('báo giá')) {
      return ApprovalStatus.pending;
    }
    if (v.contains('hủy') || v.contains('huỷ')) {
      return ApprovalStatus.cancelled;
    }
    return ApprovalStatus.prepare;
  }

  Color get _bgColor {
    switch (_mapStatus()) {
      case ApprovalStatus.approved:
        return AppColors.greenA500;
      case ApprovalStatus.pending:
        return AppColors.orangeA500;
      case ApprovalStatus.cancelled:
        return AppColors.redA500;
      case ApprovalStatus.prepare:
        return AppColors.gray.withValues(alpha: 0.15);
    }
  }

  Color get _textColor {
    switch (_mapStatus()) {
      case ApprovalStatus.prepare:
        return AppColors.enableText;
      default:
        return Colors.white;
    }
  }

  Color get _borderColor {
    switch (_mapStatus()) {
      case ApprovalStatus.approved:
        return AppColors.greenA400;
      case ApprovalStatus.pending:
        return AppColors.orangeA400;
      case ApprovalStatus.cancelled:
        return AppColors.redA400;
      case ApprovalStatus.prepare:
        return AppColors.gray.withValues(alpha: 0.3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderColor, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: _bgColor.withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 10,
          color: _textColor,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
