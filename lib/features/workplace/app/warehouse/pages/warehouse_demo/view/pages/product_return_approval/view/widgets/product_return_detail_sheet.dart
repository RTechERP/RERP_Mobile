import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/models/product_return_approval_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/view/widgets/product_return_status_chip.dart';

/// Bottom sheet hiển thị thông tin chi tiết của một phiếu trả sản phẩm.
///
/// Chia thành 3 nhóm:
/// - Thông tin sản phẩm: mã nội bộ, mã sản phẩm, mã QR, serial, part number,
///   hãng, số lượng mượn.
/// - Thông tin phiếu: mã phiếu xuất, code, loại phiếu, trạng thái.
/// - Thông tin mượn / trả: người mượn, dự án, ngày mượn, hạn trả, vị trí hộp,
///   vị trí Modula.
class ProductReturnDetailSheet extends StatelessWidget {
  const ProductReturnDetailSheet({super.key, required this.item});

  /// Phiếu trả sản phẩm cần xem chi tiết.
  final ProductReturnHistoryItem item;

  /// Mở bottom sheet chi tiết phiếu trả sản phẩm.
  ///
  /// Trả về `true` nếu người dùng bấm "Duyệt phiếu này" — nơi gọi sẽ chịu
  /// trách nhiệm xác nhận và gọi API duyệt.
  static Future<bool> show(
    BuildContext context,
    ProductReturnHistoryItem item,
  ) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProductReturnDetailSheet(item: item),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
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
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
              children: [
                _buildSection(
                  icon: Icons.swap_horiz_outlined,
                  title: 'Thông tin mượn / trả',
                  children: [
                    _infoRow('Người mượn', _orDash(item.fullName)),
                    _infoRow('Dự án', _orDash(item.project)),
                    _infoRow(
                      'Ngày mượn',
                      _formatDate(item.dateBorrow),
                      valueColor: AppColors.success,
                    ),
                    _infoRow(
                      'Dự kiến trả',
                      _formatDate(item.dateReturnExpected),
                      valueColor: AppColors.alert,
                    ),
                    _infoRow('Vị trí hộp', _orDash(item.boxLocation)),
                    _infoRow('Vị trí Modula', _orDash(item.modulaLocation)),
                  ],
                ),
                const SizedBox(height: 12),
                _buildSection(
                  icon: Icons.inventory_2_outlined,
                  title: 'Thông tin sản phẩm',
                  children: [
                    _infoRow('Mã nội bộ', _orDash(item.productCodeRtc)),
                    _infoRow('Mã sản phẩm', _orDash(item.productCode)),
                    _infoRow('Mã QR', _orDash(item.productQrCode)),
                    _infoRow('Serial', _orDash(item.serialNumber)),
                    _infoRow('Part Number', _orDash(item.partNumber)),
                    _infoRow('Hãng', _orDash(item.maker)),
                    _infoRow(
                      'SL mượn',
                      _formatQty(item.numberBorrow),
                      highlight: true,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildSection(
                  icon: Icons.receipt_long_outlined,
                  title: 'Thông tin phiếu',
                  children: [
                    _infoRow('Mã phiếu xuất', _orDash(item.billExportCode)),
                    _infoRow('Code', _orDash(item.serial)),
                    _infoRow('Loại phiếu', _orDash(item.billTypeText)),
                    _infoRow('Kho', _orDash(item.warehouseName)),
                    _infoRow(
                      'Ghi chú',
                      _orDash(item.note),
                      valueColor: AppColors.stateWarningColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildApproveButton(context),
        ],
      ),
    );
  }

  /// Nút duyệt riêng phiếu này.
  Widget _buildApproveButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(true),
            icon: const Icon(Icons.check_circle_outline, size: 18),
            label: const Text('Duyệt phiếu này'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.stateSuccessColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }

  /// Header: tên sản phẩm + mã + chip trạng thái + nút đóng.
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
                    const SizedBox(height: 2),
                    Text(
                      _orDash(item.productCode),
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
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  /// Một dòng thông tin: nhãn bên trái, giá trị bên phải, có đường kẻ phân cách.
  Widget _infoRow(
    String label,
    String value, {
    Color? valueColor,
    bool highlight = false,
  }) {
    final isEmpty = value == '--';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderColor)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
                color: AppColors.gray,
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isEmpty ? FontWeight.w400 : FontWeight.w700,
                color: isEmpty
                    ? AppColors.disableText
                    : (valueColor ?? AppColors.enableText),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Text hiển thị, `--` nếu rỗng.
  static String _orDash(String? value) {
    final trimmed = (value ?? '').trim();
    return trimmed.isEmpty ? '--' : trimmed;
  }

  /// Format ISO sang `dd/MM/yyyy`; `--` nếu rỗng hoặc sai định dạng.
  static String _formatDate(String? raw) {
    final date = DateTime.tryParse(raw ?? '');
    if (date == null) return '--';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Format số lượng — bỏ phần thập phân `,00` nếu là số nguyên.
  static String _formatQty(num? value) {
    if (value == null) return '--';
    if (value == value.roundToDouble()) return value.toStringAsFixed(0);
    return value.toStringAsFixed(2);
  }
}
