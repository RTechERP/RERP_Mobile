import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';

/// 4 hành động có thể chọn từ bottom sheet khi user bấm vào ô checkbox
/// của một phiếu xuất kho. Giá trị `shouldTick` cho biết sau khi chọn,
/// checkbox có nên ở trạng thái tick hay bỏ tick.
enum BillActionType {
  markPrepared,
  cancelPrepared,
  markReceived,
  cancelReceived,
}

extension BillActionTypeX on BillActionType {
  String get label {
    switch (this) {
      case BillActionType.markPrepared:
        return 'Đã chuẩn bị hàng';
      case BillActionType.cancelPrepared:
        return 'Huỷ chuẩn bị hàng';
      case BillActionType.markReceived:
        return 'Đã nhận hàng';
      case BillActionType.cancelReceived:
        return 'Huỷ nhận hàng';
    }
  }

  /// True nếu hành động tương ứng với trạng thái tick (đã làm).
  bool get shouldTick {
    switch (this) {
      case BillActionType.markPrepared:
      case BillActionType.markReceived:
        return true;
      case BillActionType.cancelPrepared:
      case BillActionType.cancelReceived:
        return false;
    }
  }

  IconData get icon {
    switch (this) {
      case BillActionType.markPrepared:
        return Icons.inventory_2_outlined;
      case BillActionType.cancelPrepared:
        return Icons.inventory_outlined;
      case BillActionType.markReceived:
        return Icons.check_circle_outline;
      case BillActionType.cancelReceived:
        return Icons.cancel_outlined;
    }
  }

  Color get color {
    switch (this) {
      case BillActionType.markPrepared:
      case BillActionType.markReceived:
        return AppColors.stateSuccessColor;
      case BillActionType.cancelPrepared:
      case BillActionType.cancelReceived:
        return AppColors.stateErrorColor;
    }
  }
}

/// Kết quả trả về từ bottom sheet.
class BillAction {
  const BillAction(this.type);
  final BillActionType type;

  String get label => type.label;

  /// Checkbox sẽ được tick (true) hay bỏ tick (false) sau khi chọn hành động.
  bool get shouldTick => type.shouldTick;
}

/// Bottom sheet hành động cho 1 phiếu xuất kho.
///
/// Quy tắc hiển thị actions (theo user hiện tại):
/// - Nếu `currentEmployeeId` trùng `bill.senderId` (người giao) → hiển thị
///   nhóm "Chuẩn bị hàng": Đã chuẩn bị hàng / Huỷ chuẩn bị hàng.
/// - Nếu `currentFullName` trùng `bill.receiverFullName` (người nhận) → hiển
///   thị nhóm "Nhận hàng": Đã nhận hàng / Huỷ nhận hàng.
/// - Nếu `currentEmployeeId == 30` (user đặc biệt) → hiển thị cả 4.
class PreparedReceivedActionSheet extends StatelessWidget {
  const PreparedReceivedActionSheet({
    super.key,
    required this.bill,
    required this.isCurrentlySelected,
    required this.currentEmployeeId,
    required this.currentFullName,
    this.isSubmitting = false,
  });

  final BillExporResponse bill;
  final bool isCurrentlySelected;

  /// `employeeId` của user đang đăng nhập.
  final int currentEmployeeId;

  /// `fullName` của user đang đăng nhập (so sánh với `receiverFullName`).
  final String currentFullName;

  /// `true` khi đang gọi API update status — disable tất cả tile để tránh
  /// user bấm đúp.
  final bool isSubmitting;

  /// User đặc biệt — luôn thấy cả 4 action bất kể là người giao hay
  /// người nhận. Đặt `id` (UserID) = 1110.
  static const int _specialEmployeeId = 1110;

  @override
  Widget build(BuildContext context) {
    // Quyết định hiển thị nhóm "Chuẩn bị hàng".
    final canPrepared = _specialEmployeeId == currentEmployeeId ||
        (bill.senderId != null && bill.senderId == currentEmployeeId);
    // Quyết định hiển thị nhóm "Nhận hàng".
    final canReceived = _specialEmployeeId == currentEmployeeId ||
        ((bill.receiverFullName ?? '').trim().isNotEmpty &&
            (bill.receiverFullName ?? '').trim() ==
                currentFullName.trim());

    // Nếu không có quyền gì cả (hiếm) → hiển thị thông báo nhỏ.
    if (!canPrepared && !canReceived) {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHandle(),
              _buildHeader(),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Bạn không có quyền thao tác với phiếu này.',
                  style: TextStyle(fontSize: 14, color: AppColors.gray),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(),
            _buildHeader(),
            const SizedBox(height: 8),
            // Nhóm chuẩn bị hàng (chỉ hiện khi senderId == currentEmployeeId)
            if (canPrepared) ...[
              _ActionTile(
                icon: Icons.inventory_2_outlined,
                color: AppColors.stateSuccessColor,
                title: 'Đã chuẩn bị hàng',
                enabled: !isSubmitting,
                onTap: () => Navigator.pop(
                  context,
                  const BillAction(BillActionType.markPrepared),
                ),
              ),
              _ActionTile(
                icon: Icons.inventory_outlined,
                color: AppColors.stateErrorColor,
                title: 'Huỷ chuẩn bị hàng',
                enabled: !isSubmitting,
                onTap: () => Navigator.pop(
                  context,
                  const BillAction(BillActionType.cancelPrepared),
                ),
              ),
              // Divider giữa 2 nhóm nếu cả 2 đều hiển thị.
              if (canReceived)
                const Divider(height: 1, indent: 16, endIndent: 16),
            ],
            // Nhóm nhận hàng (chỉ hiện khi receiverFullName == currentFullName)
            if (canReceived) ...[
              _ActionTile(
                icon: Icons.check_circle_outline,
                color: AppColors.stateSuccessColor,
                title: 'Đã nhận hàng',
                enabled: !isSubmitting,
                onTap: () => Navigator.pop(
                  context,
                  const BillAction(BillActionType.markReceived),
                ),
              ),
              _ActionTile(
                icon: Icons.cancel_outlined,
                color: AppColors.stateErrorColor,
                title: 'Huỷ nhận hàng',
                enabled: !isSubmitting,
                onTap: () => Navigator.pop(
                  context,
                  const BillAction(BillActionType.cancelReceived),
                ),
              ),
            ],
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: AppColors.gray.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trạng thái nhận hàng',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Số phiếu: ${bill.code ?? '--'}',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.grey_bg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  bill.nameStatus ?? '--',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.heading,
                  ),
                ),
                if (isSubmitting) ...[
                  const SizedBox(width: 6),
                  const SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 1 dòng hành động trong bottom sheet.
class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String title;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconBg = enabled
        ? color.withValues(alpha: 0.12)
        : AppColors.grey_bg;
    final iconColor = enabled ? color : AppColors.gray;
    final titleColor = enabled ? AppColors.heading : AppColors.gray;
    final subtitleColor = enabled
        ? AppColors.gray
        : AppColors.gray.withValues(alpha: 0.6);

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
