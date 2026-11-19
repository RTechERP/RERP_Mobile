import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/models/product_return_approval_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/view/widgets/product_return_status_chip.dart';

/// Bottom sheet hiển thị thông tin chi tiết của một phiếu trả sản phẩm.
///
/// Chỉ hiển thị nhóm thông tin sản phẩm / phiếu: mã nội bộ, mã sản phẩm, mã
/// QR, mã phiếu xuất, serial, part number, mã người tạo, hãng, số lượng mượn
/// và loại phiếu.
class ProductReturnDetailSheet extends StatelessWidget {
  const ProductReturnDetailSheet({super.key, required this.item});

  /// Phiếu trả sản phẩm cần xem chi tiết.
  final ProductReturnHistoryItem item;

  /// Mở bottom sheet chi tiết phiếu trả sản phẩm.
  static Future<void> show(
    BuildContext context,
    ProductReturnHistoryItem item,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProductReturnDetailSheet(item: item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
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
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
              children: [
                _buildSection(
                  icon: Icons.inventory_2_outlined,
                  title: 'Thông tin chi tiết',
                  children: [
                    _gridRow(
                      _gridCell('Mã nội bộ', _orDash(item.productCodeRtc)),
                      _gridCell('Mã sản phẩm', _orDash(item.productCode)),
                    ),
                    _gridRow(
                      _gridCell('Mã QR', _orDash(item.productQrCode)),
                      _gridCell('Mã phiếu xuất', _orDash(item.billExportCode)),
                    ),
                    _gridRow(
                      _gridCell('Serial', _orDash(item.serialNumber)),
                      _gridCell('Part Number', _orDash(item.partNumber)),
                    ),
                    _gridRow(
                      _gridCell('Code', _orDash(item.createdBy)),
                      _gridCell('Hãng', _orDash(item.maker)),
                    ),
                    _gridRow(
                      _gridCell('SL mượn', _formatQty(item.numberBorrow)),
                      _gridCell('Loại phiếu', _orDash(item.billTypeText)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Header: icon + tên sản phẩm + chip trạng thái.
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
                child: Text(
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
              ),
              const SizedBox(width: 8),
              ProductReturnStatusChip(item: item),
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
  Widget _gridCell(String label, String value) {
    final isEmpty = value == '--';

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
            color: isEmpty ? AppColors.disableText : AppColors.enableText,
            height: 1.35,
          ),
        ),
      ],
    );
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
