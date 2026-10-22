import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/app_colors.dart';

/// Thanh hành động nổi ở dưới khi đang chọn nhiều phiếu Duyệt ĐX/NN.
class ApproveBookingGuestHouseSelectionBar extends StatelessWidget {
  const ApproveBookingGuestHouseSelectionBar({
    super.key,
    required this.selectedCount,
    required this.totalCount,
    required this.isAllSelected,
    required this.onSelectAll,
    required this.onClearSelection,
    required this.onApprove,
    required this.onReject,
    required this.isApproving,
  });

  final int selectedCount;
  final int totalCount;
  final bool isAllSelected;
  final VoidCallback onSelectAll;
  final VoidCallback onClearSelection;
  final Future<void> Function() onApprove;
  final Future<void> Function() onReject;
  final bool isApproving;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.heading.withValues(alpha: 0.1),
            blurRadius: 14,
            offset: const Offset(0, -3),
          ),
        ],
        border: const Border(
          top: BorderSide(color: AppColors.borderColor, width: 1),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 14),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: isAllSelected ? onClearSelection : onSelectAll,
                  child: Icon(
                    isAllSelected
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    size: 16,
                    color: AppColors.primaryERP,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: GestureDetector(
                    onTap: isAllSelected ? onClearSelection : onSelectAll,
                    child: Text(
                      isAllSelected
                          ? 'Bỏ chọn ($selectedCount)'
                          : 'Chọn tất cả ($selectedCount/$totalCount)',
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _BulkActionButton(
                    label: 'Duyệt',
                    icon: Icons.check_circle_outline,
                    color: AppColors.stateSuccessColor,
                    onTap: isApproving ? null : () => onApprove(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _BulkActionButton(
                    label: 'Huỷ duyệt',
                    icon: Icons.undo,
                    color: AppColors.stateWarningColor,
                    onTap: isApproving ? null : () => onReject(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BulkActionButton extends StatelessWidget {
  const _BulkActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    final tint = disabled ? color.withValues(alpha: 0.4) : color;
    return Material(
      color: tint.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: tint.withValues(alpha: 0.4)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: tint),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: tint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
