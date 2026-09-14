import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';

/// Loại action xác nhận / huỷ hàng loạt.
enum BulkAction { markPrepared, cancelPrepared, markReceived, cancelReceived }

/// Bottom sheet xác nhận trạng thái cho nhiều phiếu đã chọn.
///
/// Hiển thị:
/// - Danh sách các phiếu đã chọn (mã phiếu + sender/receiver). User có thể
///   bỏ chọn từng phiếu ngay trong sheet.
/// - 4 action: xác nhận / huỷ chuẩn bị hàng, xác nhận / huỷ nhận hàng.
///   Mỗi action chỉ áp dụng được trên subset phiếu thỏa quyền + state
///   (hiển thị số lượng tương ứng trên nhãn).
class BulkBillActionSheet extends StatefulWidget {
  const BulkBillActionSheet({
    super.key,
    required this.bills,
    required this.isSubmitting,
    required this.currentEmployeeId,
    required this.isCurrentUserAdmin,
  });

  /// Danh sách phiếu đã chọn (đã lọc theo `selectedBillIds` ở caller).
  final List<BillExporResponse> bills;

  /// `true` khi đang gọi API bulk — disable cả 4 nút để chặn bấm đúp.
  final bool isSubmitting;

  /// `EmployeeID` user hiện tại (để kiểm tra quyền "người giao").
  final int currentEmployeeId;

  /// User hiện tại có phải admin không.
  final bool isCurrentUserAdmin;

  /// Helper: user có phải "actor" cho phiếu (admin hoặc sender của phiếu).
  bool _isPreparedActor(BillExporResponse b) {
    if (isCurrentUserAdmin) return true;
    final senderId = b.senderId;
    return senderId != null && senderId > 0 && senderId == currentEmployeeId;
  }

  /// Helper: user có phải "actor" cho nhận hàng — cùng quy tắc sender-side
  /// như chuẩn bị: người giao phiếu (hoặc admin/special) mới được xác nhận
  /// / huỷ nhận. Không check theo `receiverId`.

  @override
  State<BulkBillActionSheet> createState() => _BulkBillActionSheetState();
}

class _BulkBillActionSheetState extends State<BulkBillActionSheet> {
  /// Tập ID còn lại sau khi user bỏ chọn trong sheet. Khởi tạo từ
  /// `widget.bills` lần đầu.
  late final Set<int> _remainingIds;

  /// Cache quyền actor cho từng bill (sender-side). Tính 1 lần / build.
  bool _isPreparedActor(BillExporResponse b) => widget._isPreparedActor(b);

  @override
  void initState() {
    super.initState();
    _remainingIds = widget.bills
        .map((b) => b.id)
        .whereType<int>()
        .where((id) => id > 0)
        .toSet();
  }

  /// Subset phiếu còn lại (đã lọc theo `_remainingIds`) và thuộc
  /// `widget.bills` gốc.
  List<BillExporResponse> get _remainingBills {
    return widget.bills
        .where((b) => b.id != null && _remainingIds.contains(b.id))
        .toList();
  }

  /// Lọc danh sách theo action — chỉ giữ các phiếu thoả quyền + state.
  List<BillExporResponse> _applies(BulkAction action) {
    return _remainingBills.where((b) {
      switch (action) {
        case BulkAction.markPrepared:
          // Cần là actor chuẩn bị (sender/admin/special) VÀ chưa chuẩn bị.
          return _isPreparedActor(b) && b.isOrderPrepared != true;
        case BulkAction.cancelPrepared:
          // Cần là actor chuẩn bị VÀ đang ở trạng thái đã chuẩn bị.
          return _isPreparedActor(b) && b.isOrderPrepared == true;
        case BulkAction.markReceived:
          // Nhận: cần là actor (sender/admin/special) VÀ đã chuẩn bị VÀ
          // chưa nhận. Người không phải sender của phiếu không có quyền.
          return _isPreparedActor(b) &&
              b.isOrderPrepared == true &&
              b.isOrderReceived != true;
        case BulkAction.cancelReceived:
          // Huỷ nhận: cần là actor (sender/admin/special) VÀ đang ở
          // trạng thái đã nhận.
          return _isPreparedActor(b) && b.isOrderReceived == true;
      }
    }).toList();
  }

  /// Subset ID áp dụng được cho `action` — chỉ những ID hiện đang nằm
  /// trong `_remainingIds` và thỏa điều kiện quyền/state.
  Set<int> _applicableIds(BulkAction action) {
    return _applies(action)
        .map((b) => b.id)
        .whereType<int>()
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
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
            const SizedBox(height: 4),
            _buildSummary(),
            const Divider(height: 1),
            Flexible(child: _buildList()),
            const SizedBox(height: 8),
            _buildActions(context),
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
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Xác nhận nhiều phiếu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.gray),
            tooltip: 'Đóng',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${_remainingIds.length} phiếu',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryERP,
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (_remainingIds.length != widget.bills.length)
            TextButton.icon(
              onPressed: () => setState(() => _remainingIds
                ..clear()
                ..addAll(widget.bills
                    .map((b) => b.id)
                    .whereType<int>()
                    .where((id) => id > 0))),
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('Chọn lại tất cả'),
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildList() {
    final bills = _remainingBills;
    if (bills.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            'Chưa chọn phiếu nào',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.gray.withValues(alpha: 0.7),
            ),
          ),
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: bills.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final bill = bills[index];
        return _BillRow(
          bill: bill,
          onRemove: () => setState(() => _remainingIds.remove(bill.id)),
        );
      },
    );
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        children: [
          _BulkActionButton(
            label: 'Xác nhận chuẩn bị',
            icon: Icons.inventory_2_outlined,
            applicableCount: _applicableIds(BulkAction.markPrepared).length,
            totalCount: _remainingIds.length,
            color: AppColors.primaryERP,
            isFilled: true,
            isSubmitting: widget.isSubmitting,
            onPressed: _applicableIds(BulkAction.markPrepared).isEmpty
                ? null
                : () => Navigator.pop(
                      context,
                      (
                        BulkAction.markPrepared,
                        _applicableIds(BulkAction.markPrepared),
                      ),
                    ),
          ),
          const SizedBox(height: 8),
          _BulkActionButton(
            label: 'Huỷ chuẩn bị',
            icon: Icons.cancel_outlined,
            applicableCount: _applicableIds(BulkAction.cancelPrepared).length,
            totalCount: _remainingIds.length,
            color: AppColors.primaryERP,
            isFilled: false,
            isSubmitting: widget.isSubmitting,
            onPressed: _applicableIds(BulkAction.cancelPrepared).isEmpty
                ? null
                : () => Navigator.pop(
                      context,
                      (
                        BulkAction.cancelPrepared,
                        _applicableIds(BulkAction.cancelPrepared),
                      ),
                    ),
          ),
          const SizedBox(height: 8),
          _BulkActionButton(
            label: 'Xác nhận nhận hàng',
            icon: Icons.check_circle_outline,
            applicableCount: _applicableIds(BulkAction.markReceived).length,
            totalCount: _remainingIds.length,
            color: AppColors.stateSuccessColor,
            isFilled: true,
            isSubmitting: widget.isSubmitting,
            onPressed: _applicableIds(BulkAction.markReceived).isEmpty
                ? null
                : () => Navigator.pop(
                      context,
                      (
                        BulkAction.markReceived,
                        _applicableIds(BulkAction.markReceived),
                      ),
                    ),
          ),
          const SizedBox(height: 8),
          _BulkActionButton(
            label: 'Huỷ nhận hàng',
            icon: Icons.undo,
            applicableCount: _applicableIds(BulkAction.cancelReceived).length,
            totalCount: _remainingIds.length,
            color: AppColors.stateSuccessColor,
            isFilled: false,
            isSubmitting: widget.isSubmitting,
            onPressed: _applicableIds(BulkAction.cancelReceived).isEmpty
                ? null
                : () => Navigator.pop(
                      context,
                      (
                        BulkAction.cancelReceived,
                        _applicableIds(BulkAction.cancelReceived),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}

/// Nút action hàng loạt — hiển thị label + badge số phiếu áp dụng được.
/// Disabled khi `applicableCount == 0` hoặc đang submit.
class _BulkActionButton extends StatelessWidget {
  const _BulkActionButton({
    required this.label,
    required this.icon,
    required this.applicableCount,
    required this.totalCount,
    required this.color,
    required this.isFilled,
    required this.isSubmitting,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final int applicableCount;
  final int totalCount;
  final Color color;
  final bool isFilled;
  final bool isSubmitting;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final disabled = applicableCount == 0 || isSubmitting;
    final effectiveOnPressed = disabled ? null : onPressed;
    final text = '$label ($applicableCount)';
    final style = TextStyle(
      fontWeight: FontWeight.w600,
      color: isFilled ? Colors.white : color,
    );

    if (isFilled) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: effectiveOnPressed,
          icon: Icon(icon, size: 18),
          label: Text(text, style: style),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                disabled ? color.withValues(alpha: 0.4) : color,
            foregroundColor: Colors.white,
            disabledBackgroundColor: color.withValues(alpha: 0.3),
            disabledForegroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: effectiveOnPressed,
        icon: Icon(icon, size: 18),
        label: Text(text, style: style),
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(
            color: disabled ? color.withValues(alpha: 0.3) : color,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

/// Một dòng phiếu trong sheet bulk. Có nút X để bỏ chọn.
class _BillRow extends StatelessWidget {
  const _BillRow({required this.bill, required this.onRemove});

  final BillExporResponse bill;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.grey_bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  bill.code ?? '--',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.heading,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  [
                    if ((bill.fullNameSender ?? '').isNotEmpty)
                      'Giao: ${bill.fullNameSender}',
                    if ((bill.receiverFullName ?? '').isNotEmpty)
                      'Nhận: ${bill.receiverFullName}',
                  ].join(' · '),
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.gray,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.gray, size: 20),
            tooltip: 'Bỏ chọn',
            onPressed: onRemove,
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 32,
            ),
          ),
        ],
      ),
    );
  }
}
