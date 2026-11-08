import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Chế độ quét mã trong phiếu kiểm kê bằng PDA.
enum InventoryScanMode {
  /// Quét mã của sản phẩm (mã sản phẩm / mã nội bộ).
  product,

  /// Quét mã của vị trí lưu kho.
  location,
}

/// Nhãn + icon hiển thị cho từng chế độ quét.
extension InventoryScanModeUI on InventoryScanMode {
  /// Nhãn hiển thị.
  String get label {
    switch (this) {
      case InventoryScanMode.product:
        return 'Quét sản phẩm';
      case InventoryScanMode.location:
        return 'Quét vị trí';
    }
  }

  /// Icon đại diện.
  IconData get icon {
    switch (this) {
      case InventoryScanMode.product:
        return Icons.inventory_2_outlined;
      case InventoryScanMode.location:
        return Icons.place_outlined;
    }
  }
}

/// Bottom sheet chọn chế độ quét bằng PDA.
///
/// Trả về mode được chọn, `null` nếu đóng sheet mà không chọn.
class InventoryCheckScanSheet extends StatelessWidget {
  const InventoryCheckScanSheet({super.key});

  /// Mở sheet chọn mode quét.
  static Future<InventoryScanMode?> show(BuildContext context) {
    return showModalBottomSheet<InventoryScanMode>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const InventoryCheckScanSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.line,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Quét bằng thiết bị PDA',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  for (final mode in InventoryScanMode.values)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _ScanModeTile(
                        mode: mode,
                        onTap: () => Navigator.pop(context, mode),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ô chọn một chế độ quét.
class _ScanModeTile extends StatelessWidget {
  const _ScanModeTile({required this.mode, required this.onTap});

  final InventoryScanMode mode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.primaryERP.withValues(alpha: 0.25),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(mode.icon, color: AppColors.primaryERP, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  mode.label,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                size: 20,
                color: AppColors.gray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
