import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';

/// Nhãn + icon + mô tả cho từng chế độ quét.
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

  /// Mô tả ngắn tác dụng của chế độ quét.
  String get description {
    switch (this) {
      case InventoryScanMode.product:
        return 'Chỉ hiển thị đúng sản phẩm có mã vừa quét';
      case InventoryScanMode.location:
        return 'Hiển thị tất cả sản phẩm đang ở vị trí vừa quét';
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
/// Chạm vào ô chế độ là quét ngay với chế độ đó.
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ===== HANDLE =====
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.line,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// ===== TIÊU ĐỀ =====
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner,
                      size: 20,
                      color: AppColors.primaryERP,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Chọn chế độ quét',
                          style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w800,
                            color: AppColors.heading,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Quét bằng thiết bị PDA hoặc camera',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.gray,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              /// ===== DANH SÁCH CHẾ ĐỘ =====
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
      ),
    );
  }
}

/// Ô chọn một chế độ quét — chạm vào là quét ngay với chế độ đó.
class _ScanModeTile extends StatelessWidget {
  const _ScanModeTile({required this.mode, required this.onTap});

  final InventoryScanMode mode;

  /// Callback khi bấm vào ô.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Icon(mode.icon, color: AppColors.secondaryERP, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      mode.label,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.enableText,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      mode.description,
                      style: const TextStyle(
                        fontSize: 11.5,
                        color: AppColors.gray,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, size: 20, color: AppColors.gray),
            ],
          ),
        ),
      ),
    );
  }
}
