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
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.checklist_rtl_rounded,
              color: AppColors.primaryERP,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Xác nhận hàng loạt',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Chọn thao tác áp dụng cho các phiếu đã chọn',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.gray,
                    height: 1.2,
                  ),
                ),
              ],
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
    final remaining = _remainingBills;
    final notOwnedCount =
        remaining.where((b) => !_isPreparedActor(b)).length;
    final hasRemoved = _remainingIds.length != widget.bills.length;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 12, 12),
      child: Row(
        children: [
          _SummaryChip(
            icon: Icons.receipt_long_outlined,
            label: '${remaining.length} phiếu',
            color: AppColors.primaryERP,
          ),
          if (notOwnedCount > 0) ...[
            const SizedBox(width: 6),
            _SummaryChip(
              icon: Icons.lock_outline,
              label: '$notOwnedCount không thuộc quyền',
              color: AppColors.stateWarningColor,
            ),
          ],
          const Spacer(),
          if (hasRemoved)
            TextButton.icon(
              onPressed: () => setState(() => _remainingIds
                ..clear()
                ..addAll(widget.bills
                    .map((b) => b.id)
                    .whereType<int>()
                    .where((id) => id > 0))),
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('Chọn lại'),
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: AppColors.primaryERP,
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
          isActor: _isPreparedActor(bill),
          onRemove: () => setState(() => _remainingIds.remove(bill.id)),
        );
      },
    );
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActionGroup(
            title: 'Chuẩn bị hàng',
            color: AppColors.primaryERP,
            primary: BulkAction.markPrepared,
            secondary: BulkAction.cancelPrepared,
          ),
          const SizedBox(height: 10),
          _buildActionGroup(
            title: 'Nhận hàng',
            color: AppColors.stateSuccessColor,
            primary: BulkAction.markReceived,
            secondary: BulkAction.cancelReceived,
          ),
        ],
      ),
    );
  }

  /// Render 1 nhóm action: nút xác nhận (filled) trên + nút huỷ (outlined)
  /// dưới — xếp dọc để dễ đọc.
  Widget _buildActionGroup({
    required String title,
    required Color color,
    required BulkAction primary,
    required BulkAction secondary,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 6),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 14,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.heading,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
        _buildActionCard(primary, color, filled: true),
        const SizedBox(height: 8),
        _buildActionCard(secondary, color, filled: false),
      ],
    );
  }

  /// Render 1 card action (icon + label + badge count). Nút xác nhận
  /// (`filled: true`) full-width nổi bật; nút huỷ (`filled: false`) viền.
  Widget _buildActionCard(
    BulkAction action,
    Color color, {
    required bool filled,
  }) {
    final applicableIds = _applicableIds(action);
    final applicableCount = applicableIds.length;
    final disabled = applicableCount == 0 || widget.isSubmitting;
    final spec = _actionSpec(action, filled);

    return Opacity(
      opacity: disabled ? 0.55 : 1,
      child: Material(
        color: filled ? color : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: disabled ? color.withValues(alpha: 0.3) : color,
            width: 1.2,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: disabled
              ? null
              : () => Navigator.pop(context, (action, applicableIds)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(spec.icon, size: 20, color: spec.foreground),
                    if (applicableCount > 0)
                      Positioned(
                        right: -6,
                        top: -4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: filled ? Colors.white : color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '$applicableCount',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: filled ? color : Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    spec.label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: spec.foreground,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Tra cứu thông tin hiển thị cho mỗi action.
  _ActionSpec _actionSpec(BulkAction action, bool filled) {
    switch (action) {
      case BulkAction.markPrepared:
        return _ActionSpec(
          label: 'Xác nhận chuẩn bị',
          icon: Icons.inventory_2_outlined,
          foreground: Colors.white,
        );
      case BulkAction.cancelPrepared:
        return _ActionSpec(
          label: 'Huỷ chuẩn bị',
          icon: Icons.undo,
          foreground: AppColors.primaryERP,
        );
      case BulkAction.markReceived:
        return _ActionSpec(
          label: 'Xác nhận nhận hàng',
          icon: Icons.check_circle_outline,
          foreground: Colors.white,
        );
      case BulkAction.cancelReceived:
        return _ActionSpec(
          label: 'Huỷ nhận',
          icon: Icons.cancel_outlined,
          foreground: AppColors.stateSuccessColor,
        );
    }
  }
}

/// Thông tin hiển thị cho 1 action card.
class _ActionSpec {
  const _ActionSpec({required this.label, required this.icon, required this.foreground});
  final String label;
  final IconData icon;
  final Color foreground;
}

/// Chip nhỏ hiển thị icon + text, dùng trong dải summary.
class _SummaryChip extends StatelessWidget {
  const _SummaryChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

/// Một dòng phiếu trong sheet bulk. Có nút X để bỏ chọn và hiển thị
/// trạng thái chuẩn bị / nhận hàng + cảnh báo nếu user không có quyền.
class _BillRow extends StatelessWidget {
  const _BillRow({
    required this.bill,
    required this.isActor,
    required this.onRemove,
  });

  final BillExporResponse bill;
  final bool isActor;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final prepared = bill.isOrderPrepared == true;
    final received = bill.isOrderReceived == true;

    return Opacity(
      opacity: isActor ? 1 : 0.6,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 6, 10),
        decoration: BoxDecoration(
          color: AppColors.grey_bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActor
                ? AppColors.borderColor
                : AppColors.stateWarningColor.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          bill.code ?? '--',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.heading,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (!isActor) ...[
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.lock_outline,
                          size: 13,
                          color: AppColors.stateWarningColor,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
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
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _StatusPill(
                        label: prepared ? 'Đã chuẩn bị' : 'Chưa chuẩn bị',
                        color: prepared
                            ? AppColors.stateSuccessColor
                            : AppColors.gray,
                        filled: prepared,
                      ),
                      const SizedBox(width: 6),
                      _StatusPill(
                        label: received ? 'Đã nhận' : 'Chưa nhận',
                        color: received
                            ? AppColors.primaryERP
                            : AppColors.gray,
                        filled: received,
                      ),
                    ],
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
      ),
    );
  }
}

/// Pill nhỏ hiển thị trạng thái (chuẩn bị / nhận hàng).
class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.label,
    required this.color,
    required this.filled,
  });

  final String label;
  final Color color;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: filled ? color.withValues(alpha: 0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: filled
              ? color.withValues(alpha: 0.4)
              : color.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: filled ? color : color.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}
