import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_difference_chip.dart';

/// Card hiển thị một dòng sản phẩm trong phiếu kiểm kê.
///
/// Bố cục: tên sản phẩm + mã → chip chênh lệch + chip đã kiểm kê → vị trí kho
/// → dải số liệu (tồn trong kho / đang mượn / khách mượn / chênh lệch) dạng
/// hàng ngang, không chia ô box để tránh rối mắt khi danh sách dài.
class InventoryCountSheetItemCard extends StatelessWidget {
  const InventoryCountSheetItemCard({
    super.key,
    required this.item,
    required this.index,
    this.onTap,
  });

  final InventoryCountSheetItem item;

  /// STT hiển thị trên card.
  final int index;

  /// Bấm vào card → mở sheet chi tiết dòng kiểm kê.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final difference = item.difference;

    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// ===== HEADER: STT + TÊN SẢN PHẨM + CHIP TRẠNG THÁI =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      '$index',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryERP,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _text(item.productName),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.enableText,
                            height: 1.25,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${_text(item.productCode)}  •  ${_text(item.productCodeRtc)}',
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: AppColors.gray,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (difference != null) ...[
                        InventoryCheckDifferenceChip(difference: difference),
                        const SizedBox(width: 6),
                      ],
                      _CountedChip(hasCounted: item.hasCounted),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              /// ===== VỊ TRÍ KHO & VỊ TRÍ MODULA =====
              _LocationSection(
                locationName: item.locationName,
                addressBox: item.addressBox,
                modulaLocationName: item.modulaLocationName,
              ),
              const SizedBox(height: 12),

              /// ===== DẢI SỐ LIỆU =====
              Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _MetricCell(
                        label: 'Tồn trong kho',
                        value: _formatQty(item.numberInStore),
                      ),
                    ),
                    const _MetricDivider(),
                    Expanded(
                      child: _MetricCell(
                        label: 'Đang mượn',
                        value: _formatQty(item.numberBorrowing),
                      ),
                    ),
                    const _MetricDivider(),
                    Expanded(
                      child: _MetricCell(
                        label: 'Khách mượn',
                        value: _formatQty(item.quantityExportMuon),
                      ),
                    ),
                    const _MetricDivider(),
                    Expanded(
                      child: _MetricCell(
                        label: 'Thực tế',
                        value: _formatQty(item.quantityActual),
                        color: item.hasCounted
                            ? AppColors.secondaryERP
                            : null,
                      ),
                    ),
                    const _MetricDivider(),
                    Expanded(
                      child: _MetricCell(
                        label: 'Chênh lệch',
                        value: _formatQty(difference),
                        color: _differenceColor(difference),
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

  /// Màu hiển thị chênh lệch: xanh khi khớp, đỏ khi lệch, xám khi chưa kiểm.
  static Color? _differenceColor(double? difference) {
    if (difference == null) return null;
    if (difference == 0) return AppColors.stateSuccessColor;
    return AppColors.stateErrorColor;
  }

  /// Text hiển thị, `--` nếu rỗng.
  static String _text(String? value) {
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

/// Chip đánh dấu dòng đã kiểm kê hay chưa.
class _CountedChip extends StatelessWidget {
  const _CountedChip({required this.hasCounted});

  final bool hasCounted;

  @override
  Widget build(BuildContext context) {
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
}

/// Khu vực vị trí: tách rõ "Vị trí kho" (vị trí lưu kho / địa chỉ ô) và
/// "Vị trí Modula" (chuỗi các ô Modula của sản phẩm).
class _LocationSection extends StatelessWidget {
  const _LocationSection({
    required this.locationName,
    required this.addressBox,
    required this.modulaLocationName,
  });

  /// Tên vị trí kho (kèm QR code) — `LocationName` trong API.
  final String? locationName;

  /// Địa chỉ ô lưu kho — `AddressBox` trong API.
  final String? addressBox;

  /// Chuỗi các vị trí Modula của sản phẩm — `ModulaLocationName` trong API.
  final String? modulaLocationName;

  @override
  Widget build(BuildContext context) {
    final location = (locationName ?? '').trim();
    final address = (addressBox ?? '').trim();
    final modula = (modulaLocationName ?? '').trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ===== VỊ TRÍ KHO =====
        _LocationLine(
          icon: Icons.warehouse_outlined,
          label: 'Vị trí kho',
          isEmpty: location.isEmpty && address.isEmpty,
          children: [
            if (location.isNotEmpty) _LocationChip(text: location),
            if (address.isNotEmpty) _LocationChip(text: 'Ô: $address'),
          ],
        ),
        const SizedBox(height: 4),

        /// ===== VỊ TRÍ MODULA =====
        _LocationLine(
          icon: Icons.grid_view_outlined,
          label: 'Vị trí Modula',
          isEmpty: modula.isEmpty,
          children: [
            if (modula.isNotEmpty) _LocationChip(text: modula, isModula: true),
          ],
        ),
      ],
    );
  }
}

/// Một dòng vị trí: icon + nhãn + các chip bên phải.
class _LocationLine extends StatelessWidget {
  const _LocationLine({
    required this.icon,
    required this.label,
    required this.isEmpty,
    required this.children,
  });

  /// Icon đại diện nhóm vị trí.
  final IconData icon;

  /// Nhãn nhóm vị trí.
  final String label;

  /// Nhóm vị trí không có dữ liệu.
  final bool isEmpty;

  /// Các chip thông tin vị trí.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 13, color: AppColors.gray),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
            color: AppColors.gray,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: isEmpty
              ? const Text(
                  '--',
                  style: TextStyle(fontSize: 11, color: AppColors.gray),
                )
              : Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: children,
                ),
        ),
      ],
    );
  }
}

/// Chip nhỏ hiển thị thông tin vị trí.
class _LocationChip extends StatelessWidget {
  const _LocationChip({required this.text, this.isModula = false});

  final String text;

  /// Chip vị trí Modula — dùng màu chính của ERP để phân biệt với vị trí kho.
  final bool isModula;

  @override
  Widget build(BuildContext context) {
    final color = isModula ? AppColors.primaryERP : AppColors.secondaryERP;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

/// Ô số liệu trong dải: nhãn nhỏ ở trên, giá trị đậm ở dưới.
class _MetricCell extends StatelessWidget {
  const _MetricCell({required this.label, required this.value, this.color});

  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.5,
            color: AppColors.gray,
            height: 1.1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: color ?? AppColors.enableText,
            height: 1.15,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// Đường kẻ dọc giữa các ô số liệu.
class _MetricDivider extends StatelessWidget {
  const _MetricDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 26, color: AppColors.borderColor);
  }
}
