import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_scan_sheet.dart';

/// Banner hiển thị trạng thái chế độ quét PDA đang bật.
///
/// Hiển thị: chế độ quét hiện tại, mã vừa quét gần nhất, số lần quét và
/// thông báo kết quả (khớp / không khớp).
class InventoryCheckScanStatusBanner extends StatelessWidget {
  const InventoryCheckScanStatusBanner({
    super.key,
    required this.mode,
    required this.lastCode,
    required this.scanCount,
    required this.message,
    required this.onClose,
  });

  /// Chế độ quét đang bật.
  final InventoryScanMode mode;

  /// Mã vừa quét gần nhất (null = chưa quét được mã nào).
  final String? lastCode;

  /// Số lần quét trong phiên hiện tại.
  final int scanCount;

  /// Thông báo kết quả quét từ bloc.
  final String? message;

  /// Callback khi user tắt chế độ quét.
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
      decoration: BoxDecoration(
        color: AppColors.primaryERP.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primaryERP.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(
                Icons.qr_code_scanner,
                size: 20,
                color: AppColors.primaryERP,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Đang quét ${mode.label.toLowerCase()} — nhấn nút quét trên PDA',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                  ),
                ),
              ),
              Text(
                'Đã quét: $scanCount',
                style: const TextStyle(
                  fontSize: 11.5,
                  color: AppColors.gray,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 18, color: AppColors.gray),
                tooltip: 'Tắt chế độ quét',
                visualDensity: VisualDensity.compact,
                onPressed: onClose,
              ),
            ],
          ),
          if (lastCode != null) ...[
            const SizedBox(height: 6),
            Text(
              'Mã vừa quét: $lastCode',
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryERP,
              ),
            ),
          ],
          if ((message ?? '').isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              message!,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.gray,
                height: 1.35,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
