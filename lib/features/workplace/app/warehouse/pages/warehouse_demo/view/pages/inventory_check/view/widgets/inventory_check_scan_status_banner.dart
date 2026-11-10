import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_scan_sheet.dart';

/// Panel trạng thái chế độ quét đang bật trong phiếu kiểm kê.
///
/// Hiển thị: chế độ quét hiện tại, mã vừa quét gần nhất, số sản phẩm đang
/// được lọc và kết quả quét (khớp / không khớp).
class InventoryCheckScanStatusBanner extends StatelessWidget {
  const InventoryCheckScanStatusBanner({
    super.key,
    required this.mode,
    required this.lastCode,
    required this.scanCount,
    required this.matchedCount,
    required this.message,
    required this.onClose,
  });

  /// Chế độ quét đang bật.
  final InventoryScanMode mode;

  /// Mã vừa quét gần nhất (null = chưa quét được mã nào).
  final String? lastCode;

  /// Số lần quét trong phiên hiện tại.
  final int scanCount;

  /// Số sản phẩm đang được hiển thị sau khi lọc theo mã quét.
  final int matchedCount;

  /// Thông báo kết quả quét từ bloc.
  final String? message;

  /// Callback khi user tắt chế độ quét.
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final hasCode = (lastCode ?? '').isNotEmpty;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryERP, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.14),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ===== HEADER: CHẾ ĐỘ QUÉT + SỐ LẦN QUÉT + NÚT TẮT =====
          Container(
            padding: const EdgeInsets.fromLTRB(12, 10, 6, 10),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.08),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(mode.icon, size: 15, color: Colors.white),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    mode.label,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                      color: AppColors.enableText,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.primaryERP.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    'Đã quét $scanCount',
                    style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryERP,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 18,
                    color: AppColors.gray,
                  ),
                  tooltip: 'Tắt chế độ quét',
                  visualDensity: VisualDensity.compact,
                  onPressed: onClose,
                ),
              ],
            ),
          ),

          /// ===== MÃ VỪA QUÉT =====
          if (hasCode)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Mã vừa quét',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          lastCode!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryERP,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  _MatchedCountChip(count: matchedCount),
                ],
              ),
            ),

          /// ===== KẾT QUẢ QUÉT =====
          if ((message ?? '').isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      matchedCount > 0
                          ? Icons.check_circle_outline
                          : Icons.error_outline,
                      size: 15,
                      color: matchedCount > 0
                          ? AppColors.stateSuccessColor
                          : AppColors.stateErrorColor,
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        message!,
                        style: TextStyle(
                          fontSize: 12,
                          color: matchedCount > 0
                              ? AppColors.enableText
                              : AppColors.stateErrorColor,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
              child: Row(
                children: [
                  const Icon(
                    Icons.keyboard_double_arrow_down,
                    size: 15,
                    color: AppColors.gray,
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      'Nhấn nút quét trên PDA để bắt đầu',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.gray,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Chip hiển thị số sản phẩm đang được lọc theo mã quét.
class _MatchedCountChip extends StatelessWidget {
  const _MatchedCountChip({required this.count});

  /// Số sản phẩm khớp mã vừa quét.
  final int count;

  @override
  Widget build(BuildContext context) {
    final color = count > 0
        ? AppColors.stateSuccessColor
        : AppColors.stateErrorColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: color,
              height: 1.1,
            ),
          ),
          Text(
            'sản phẩm',
            style: TextStyle(
              fontSize: 9.5,
              fontWeight: FontWeight.w600,
              color: color,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
