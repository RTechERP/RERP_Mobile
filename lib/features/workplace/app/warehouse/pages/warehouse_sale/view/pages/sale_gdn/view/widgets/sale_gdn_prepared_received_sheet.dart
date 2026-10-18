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
/// - Nhóm "Chuẩn bị hàng" (Đã chuẩn bị / Huỷ chuẩn bị): hiển thị nếu user
///   là admin, là người giao/nhận của phiếu, hoặc nằm trong danh sách ID
///   được phép xác nhận đặt hàng (xem [_preparedConfirmAllowedIds]).
/// - Nhóm "Nhận hàng" (Đã nhận / Huỷ nhận): hiển thị nếu user là admin, là
///   người giao/nhận của phiếu, **trừ** các user thuộc
///   [_receivedBlockedIds] (1110, 24, 1763, 1785) — nhóm này bị chặn hoàn
///   toàn dù có trùng sender/receiver.
///
/// Lưu ý: cả 4 tile luôn được render. Action user không có quyền sẽ bị
/// làm mờ + disable để tránh bấm nhầm, kèm dòng cảnh báo "không có quyền".
class PreparedReceivedActionSheet extends StatelessWidget {
  const PreparedReceivedActionSheet({
    super.key,
    required this.bill,
    required this.isCurrentlySelected,
    required this.currentEmployeeId,
    required this.isCurrentUserAdmin,
    this.isSubmitting = false,
  });

  final BillExporResponse bill;
  final bool isCurrentlySelected;

  /// `employeeId` của user đang đăng nhập.
  final int currentEmployeeId;

  /// `true` nếu user hiện tại là admin — được thao tác mọi phiếu.
  final bool isCurrentUserAdmin;

  /// `true` khi đang gọi API update status — disable tất cả tile để tránh
  /// user bấm đúp.
  final bool isSubmitting;

  /// Nhóm UserID bị chặn thao tác nhóm "Nhận hàng" (kể cả khi trùng sender/
  /// receiver của phiếu). Nhóm này chỉ được quyền thao tác "Chuẩn bị hàng".
  ///
  /// Gồm: 1110, 24, 1763, 1785.
  static const Set<int> _receivedBlockedIds = {1110, 24, 1763, 1785};

  /// Danh sách UserID được phép xác nhận / huỷ "Chuẩn bị hàng" bất kể có
  /// phải người giao/nhận của phiếu hay không. Cùng với admin + người giao/
  /// nhận của phiếu → đủ điều kiện thao tác nhóm chuẩn bị.
  static const Set<int> _preparedConfirmAllowedIds =
      {1110, 24, 1763, 1785};

  bool get _canDoPreparedActions {
    if (isCurrentUserAdmin) return true;
    if (bill.senderId != null && bill.senderId == currentEmployeeId) {
      return true;
    }
    if (bill.receiverId != null && bill.receiverId == currentEmployeeId) {
      return true;
    }
    return _preparedConfirmAllowedIds.contains(currentEmployeeId);
  }

  bool get _canDoReceivedActions {
    // Bỏ validate quyền "nhận hàng" — ai cũng có thể thao tác,
    // TRỪ 4 UserID đặc biệt trong `_receivedBlockedIds`.
    if (_receivedBlockedIds.contains(currentEmployeeId)) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // Luôn hiển thị đủ 4 action. Action nào user không có quyền → làm mờ
    // + disable để tránh bấm nhầm. Nếu user không có quyền bất kỳ action
    // nào thì thêm dòng cảnh báo nhỏ phía trên cho rõ ràng.
    final canPrepared = _canDoPreparedActions;
    final canReceived = _canDoReceivedActions;

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
            if (!canPrepared && !canReceived)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 18,
                      color: AppColors.gray,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Bạn không có quyền thao tác đối với phiếu này',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // Nhóm chuẩn bị hàng — luôn hiển thị, làm mờ nếu không có quyền.
            _ActionTile(
              icon: Icons.inventory_2_outlined,
              color: AppColors.stateSuccessColor,
              title: 'Đã chuẩn bị hàng',
              enabled: canPrepared && !isSubmitting,
              onTap: () => Navigator.pop(
                context,
                const BillAction(BillActionType.markPrepared),
              ),
            ),
            _ActionTile(
              icon: Icons.inventory_outlined,
              color: AppColors.stateErrorColor,
              title: 'Huỷ chuẩn bị hàng',
              enabled: canPrepared && !isSubmitting,
              onTap: () => Navigator.pop(
                context,
                const BillAction(BillActionType.cancelPrepared),
              ),
            ),
            if (canPrepared || canReceived)
              const Divider(height: 1, indent: 16, endIndent: 16),
            // Nhóm nhận hàng — luôn hiển thị, làm mờ nếu không có quyền.
            _ActionTile(
              icon: Icons.check_circle_outline,
              color: AppColors.stateSuccessColor,
              title: 'Đã nhận hàng',
              enabled: canReceived && !isSubmitting,
              onTap: () => Navigator.pop(
                context,
                const BillAction(BillActionType.markReceived),
              ),
            ),
            _ActionTile(
              icon: Icons.cancel_outlined,
              color: AppColors.stateErrorColor,
              title: 'Huỷ nhận hàng',
              enabled: canReceived && !isSubmitting,
              onTap: () => Navigator.pop(
                context,
                const BillAction(BillActionType.cancelReceived),
              ),
            ),
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
                  style: const TextStyle(
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

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: titleColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
