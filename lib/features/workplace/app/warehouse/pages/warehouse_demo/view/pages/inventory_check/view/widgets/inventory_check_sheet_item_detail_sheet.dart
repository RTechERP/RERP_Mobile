import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';

/// Bottom sheet hiển thị đầy đủ thông tin của một dòng sản phẩm trong phiếu
/// kiểm kê.
///
/// Bố cục chia thành các nhóm: thông tin sản phẩm, vị trí & serial, số lượng
/// và ghi chú — mỗi nhóm là một khối riêng để dễ quét, không dồn tất cả vào
/// một danh sách label/value dài.
class InventoryCheckSheetItemDetailSheet extends StatelessWidget {
  const InventoryCheckSheetItemDetailSheet({super.key, required this.item});

  /// Dòng sản phẩm cần xem chi tiết.
  final InventoryCountSheetItem item;

  /// Mở bottom sheet chi tiết dòng kiểm kê.
  static Future<void> show(BuildContext context, InventoryCountSheetItem item) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => InventoryCheckSheetItemDetailSheet(item: item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
              children: [
                _buildSection(
                  icon: Icons.inventory_2_outlined,
                  title: 'Thông tin sản phẩm',
                  children: [
                    _gridRow(
                      _gridCell('Mã sản phẩm', _orDash(item.productCode)),
                      _gridCell('Mã nội bộ', _orDash(item.productCodeRtc)),
                    ),
                    _gridRow(
                      _gridCell('Nhà sản xuất', _orDash(item.maker)),
                      _gridCell('Đơn vị tính', _orDash(item.unitName)),
                    ),
                    _gridRow(
                      _gridCell(
                        'Nhóm sản phẩm',
                        _orDash(item.productGroupName),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildSection(
                  icon: Icons.place_outlined,
                  title: 'Vị trí & serial',
                  children: [
                    _gridRow(
                      _gridCell('Vị trí kho', _orDash(item.locationName)),
                      _gridCell('Địa chỉ ô', _orDash(item.addressBox)),
                    ),
                    _gridRow(
                      _gridCell(
                        'Vị trí Modula',
                        _orDash(item.modulaLocationName),
                      ),
                      _gridCell('Serial', _orDash(item.serialNumber)),
                    ),
                    _gridRow(
                      _gridCell('Serial number', _orDash(item.serial)),
                      _gridCell('Part number', _orDash(item.partNumber)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildSection(
                  icon: Icons.bar_chart_rounded,
                  title: 'Số lượng',
                  children: [
                    _gridRow(
                      _gridCell(
                        'Tồn trong kho',
                        _formatQty(item.numberInStore),
                      ),
                      _gridCell('Tồn thực tế', _formatQty(item.inventoryReal)),
                    ),
                    _gridRow(
                      _gridCell(
                        'Tồn kho tổng',
                        _formatQty(item.inventoryQuantity),
                      ),
                      _gridCell('Nhập', _formatQty(item.numberImport)),
                    ),
                    _gridRow(
                      _gridCell('Xuất', _formatQty(item.numberExport)),
                      _gridCell('Đang mượn', _formatQty(item.borrowedQuantity)),
                    ),
                    _gridRow(
                      _gridCell(
                        'KH đang mượn',
                        _formatQty(item.customerBorrowedQuantity),
                      ),
                      _gridCell(
                        'Số lượng thực tế',
                        _formatQty(item.quantityActual),
                      ),
                    ),
                    _gridRow(
                      _gridCell(
                        'Chênh lệch',
                        _formatQty(item.difference),
                        valueColor: _differenceColor(item.difference),
                      ),
                    ),
                  ],
                ),
                if ((item.note ?? '').trim().isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _buildSection(
                    icon: Icons.notes_outlined,
                    title: 'Ghi chú',
                    children: [
                      _gridRow(_gridCell('Ghi chú', item.note!.trim())),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Header: icon + tên sản phẩm + mã + chip trạng thái kiểm kê.
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 14),
      decoration: const BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.line,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: AppColors.secondaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.inventory_2_outlined,
                  color: AppColors.secondaryERP,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _orDash(item.productName),
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.enableText,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${_orDash(item.productCode)}  •  ${_orDash(item.productCodeRtc)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.gray,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _buildCountedChip(),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, size: 20, color: AppColors.gray),
                tooltip: 'Đóng',
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Chip đánh dấu dòng đã kiểm kê hay chưa.
  Widget _buildCountedChip() {
    final hasCounted = item.hasCounted;
    final color = hasCounted
        ? AppColors.stateSuccessColor
        : AppColors.stateWarningColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            hasCounted ? Icons.check_circle : Icons.pending_outlined,
            size: 12,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            hasCounted ? 'Đã kiểm' : 'Chưa kiểm',
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  /// Một nhóm thông tin có tiêu đề.
  Widget _buildSection({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: Row(
              children: [
                Icon(icon, size: 15, color: AppColors.secondaryERP),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 2),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  /// Hàng lưới thông tin — tối đa 2 ô trên một hàng.
  ///
  /// Khi chỉ có 1 ô thì ô đó chiếm toàn bộ chiều rộng, tránh giá trị dài bị
  /// wrap vô ích.
  Widget _gridRow(Widget first, [Widget? second]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: first),
          if (second != null) ...[
            const SizedBox(width: 12),
            Expanded(child: second),
          ],
        ],
      ),
    );
  }

  /// Một ô trong lưới thông tin: nhãn nhỏ ở trên, giá trị ở dưới.
  Widget _gridCell(String label, String value, {Color? valueColor}) {
    final isEmpty = value == '-';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w500,
            color: AppColors.gray,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: isEmpty ? FontWeight.w400 : FontWeight.w700,
            color:
                valueColor ??
                (isEmpty ? AppColors.disableText : AppColors.enableText),
            height: 1.35,
          ),
        ),
      ],
    );
  }

  /// Màu chênh lệch: xanh khi khớp, đỏ khi lệch.
  static Color? _differenceColor(double? difference) {
    if (difference == null) return null;
    if (difference == 0) return AppColors.stateSuccessColor;
    return AppColors.stateErrorColor;
  }

  /// Text hiển thị, `--` nếu rỗng.
  static String _orDash(String? value) {
    final trimmed = (value ?? '').trim();
    return trimmed.isEmpty ? '--' : trimmed;
  }

  /// Format số lượng — bỏ phần thập phân `,00` nếu là số nguyên.
  static String _formatQty(num? value) {
    if (value == null) return '--';
    if (value == value.roundToDouble()) return value.toStringAsFixed(0);
    return value.toStringAsFixed(2);
  }
}
