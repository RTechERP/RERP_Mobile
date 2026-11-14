import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';

/// Card "Tiến độ theo vị trí" — chia thành 3 ô: Chưa có / Kho / Modula.
///
/// Mỗi ô tổng hợp số liệu của 1 nhóm vị trí và là nút chọn nhóm đang xem.
/// Bấm vào 1 ô sẽ lọc danh sách sản phẩm theo nhóm đó; bấm 1 vị trí cụ thể
/// trong danh sách chi tiết bên dưới sẽ lọc theo vị trí đó.
///
/// Dữ liệu lấy từ API `GET /WarehouseInventoryCount/get-location-progress-mobile`.
class InventoryCheckLocationProgressCard extends StatelessWidget {
  const InventoryCheckLocationProgressCard({
    super.key,
    required this.progress,
    required this.counts,
    required this.isLoadingCounts,
    required this.activeGroup,
    required this.onSelectGroup,
  });

  /// Tiến độ kiểm kê theo vị trí.
  final InventoryLocationProgress? progress;

  /// Số sản phẩm thuộc từng nhóm vị trí (tính từ danh sách sản phẩm).
  final InventoryLocationCounts counts;

  /// Đang tải số liệu 3 nhóm vị trí (hiển thị `--` thay cho `0/0`).
  final bool isLoadingCounts;

  /// Nhóm vị trí đang được chọn.
  final InventoryLocationGroup activeGroup;

  /// Callback khi bấm 1 trong 3 ô.
  final void Function(InventoryLocationGroup group) onSelectGroup;

  @override
  Widget build(BuildContext context) {
    if (progress == null) return const SizedBox.shrink();

    final noLocation = counts.noLocation;
    final warehouse = counts.warehouse;
    final modula = counts.modula;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== TIÊU ĐỀ =====
          const Row(
            children: [
              Icon(
                Icons.map_outlined,
                size: 16,
                color: AppColors.secondaryERP,
              ),
              SizedBox(width: 6),
              Text(
                'Tiến độ theo vị trí',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.enableText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          /// ===== 3 Ô CHỌN NHÓM VỊ TRÍ =====
          ///
          /// Bọc trong [IntrinsicHeight] để 3 ô cao bằng nhau: `stretch` yêu cầu
          /// chiều cao hữu hạn, mà `Column` cha lại không giới hạn chiều cao.
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _ScopeTile(
                    icon: Icons.help_outline,
                    label: 'Chưa có',
                    total: noLocation,
                    counted: counts.noLocationCounted,
                    isLoading: isLoadingCounts,
                    isActive:
                        activeGroup == InventoryLocationGroup.noLocation,
                    onTap: () => onSelectGroup(InventoryLocationGroup.noLocation),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _ScopeTile(
                    icon: Icons.warehouse_outlined,
                    label: 'Kho',
                    total: warehouse,
                    counted: counts.warehouseCounted,
                    isLoading: isLoadingCounts,
                    isActive:
                        activeGroup == InventoryLocationGroup.productLocation,
                    onTap: () =>
                        onSelectGroup(InventoryLocationGroup.productLocation),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _ScopeTile(
                    icon: Icons.grid_view_outlined,
                    label: 'Modula',
                    total: modula,
                    counted: counts.modulaCounted,
                    isLoading: isLoadingCounts,
                    isActive: activeGroup == InventoryLocationGroup.modula,
                    onTap: () => onSelectGroup(InventoryLocationGroup.modula),
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

/// Một ô chọn nhóm vị trí trong card "Tiến độ theo vị trí".
class _ScopeTile extends StatelessWidget {
  const _ScopeTile({
    required this.icon,
    required this.label,
    required this.total,
    required this.counted,
    required this.isActive,
    required this.onTap,
    this.isLoading = false,
  });

  /// Icon nhóm vị trí.
  final IconData icon;

  /// Tên nhóm vị trí.
  final String label;

  /// Tổng số mã sản phẩm thuộc nhóm.
  final int total;

  /// Số mã đã kiểm.
  final int counted;

  /// Nhóm đang được chọn hay chưa.
  final bool isActive;

  /// Đang tải số liệu — hiển thị `--` thay cho `0/0`.
  final bool isLoading;

  /// Callback khi bấm vào ô.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDone = total > 0 && counted >= total;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.secondaryERP.withValues(alpha: 0.1)
                : AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isActive
                  ? AppColors.secondaryERP.withValues(alpha: 0.45)
                  : Colors.transparent,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: isActive ? AppColors.secondaryERP : AppColors.gray,
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: isActive ? AppColors.secondaryERP : AppColors.enableText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                isLoading ? '--' : '$counted/$total',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: isDone ? AppColors.stateSuccessColor : AppColors.gray,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
