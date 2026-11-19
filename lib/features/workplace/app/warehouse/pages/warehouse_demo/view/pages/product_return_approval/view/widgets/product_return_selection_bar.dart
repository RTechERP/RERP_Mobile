import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Thanh hành động nổi ở đáy màn duyệt trả sản phẩm.
///
/// Hiển thị khi đang có ít nhất 1 phiếu được chọn: cho phép chọn / bỏ chọn
/// tất cả và bấm "Duyệt" để duyệt các phiếu đã chọn.
class ProductReturnSelectionBar extends StatelessWidget {
  const ProductReturnSelectionBar({
    super.key,
    required this.selectedCount,
    required this.totalCount,
    required this.isAllSelected,
    required this.onSelectAll,
    required this.onClearSelection,
    required this.onApprove,
    required this.isApproving,
    this.approveTotal = 0,
    this.approvedCount = 0,
  });

  /// Số phiếu đang chọn.
  final int selectedCount;

  /// Tổng số phiếu đang hiển thị.
  final int totalCount;

  /// Đã chọn đủ tất cả phiếu hay chưa.
  final bool isAllSelected;

  /// Chọn tất cả phiếu đang hiển thị.
  final VoidCallback onSelectAll;

  /// Bỏ chọn tất cả.
  final VoidCallback onClearSelection;

  /// Duyệt các phiếu đang chọn.
  final VoidCallback onApprove;

  /// Đang trong quá trình duyệt → disable nút.
  final bool isApproving;

  /// Tổng số phiếu đang duyệt trong lượt hiện tại.
  final int approveTotal;

  /// Số phiếu đã duyệt thành công trong lượt hiện tại.
  final int approvedCount;

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
                  onTap: isApproving
                      ? null
                      : (isAllSelected ? onClearSelection : onSelectAll),
                  child: Icon(
                    isAllSelected
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    size: 22,
                    color: AppColors.primaryERP,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: isApproving
                        ? null
                        : (isAllSelected ? onClearSelection : onSelectAll),
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

            /// ===== TIẾN TRÌNH DUYỆT =====
            if (isApproving && approveTotal > 0) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: approvedCount / approveTotal,
                        minHeight: 6,
                        backgroundColor: AppColors.borderColor,
                        valueColor: const AlwaysStoppedAnimation(
                          AppColors.stateSuccessColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '$approvedCount/$approveTotal',
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.stateSuccessColor,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Material(
                color: AppColors.stateSuccessColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: isApproving ? null : onApprove,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.stateSuccessColor.withValues(
                          alpha: isApproving ? 0.2 : 0.4,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isApproving)
                          const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.stateSuccessColor,
                            ),
                          )
                        else
                          const Icon(
                            Icons.check_circle_outline,
                            size: 18,
                            color: AppColors.stateSuccessColor,
                          ),
                        const SizedBox(width: 6),
                        Text(
                          isApproving
                              ? 'Đang duyệt...'
                              : 'Duyệt ($selectedCount)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.stateSuccessColor.withValues(
                              alpha: isApproving ? 0.5 : 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
