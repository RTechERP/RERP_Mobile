import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/models/product_return_approval_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/view/widgets/product_return_status_chip.dart';

/// Card hiển thị một phiếu trả sản phẩm.
///
/// Bố cục: tên sản phẩm + mã → chip trạng thái → người mượn → dự án → bảng
/// 2×2 (vị trí hộp / vị trí Modula / ngày mượn / hạn trả) → ghi chú.
class ProductReturnCard extends StatelessWidget {
  const ProductReturnCard({
    super.key,
    required this.item,
    this.onTap,
    this.selected = false,
    this.selectionEnabled = false,
    this.onToggleSelection,
  });

  /// Phiếu trả sản phẩm cần hiển thị.
  final ProductReturnHistoryItem item;

  /// Bấm vào card → mở chi tiết phiếu.
  final VoidCallback? onTap;

  /// Phiếu đang được chọn để duyệt.
  final bool selected;

  /// Hiển thị checkbox chọn phiếu hay không.
  final bool selectionEnabled;

  /// Bấm checkbox → bật/tắt chọn phiếu.
  final VoidCallback? onToggleSelection;

  @override
  Widget build(BuildContext context) {
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
            border: Border.all(
              color: selected ? AppColors.primaryERP : AppColors.borderColor,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// ===== HEADER: TÊN SẢN PHẨM + MÃ + CHIP TRẠNG THÁI =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (selectionEnabled) ...[
                    Padding(
                      padding: const EdgeInsets.only(right: 6, top: 1),
                      child: _SelectionCheckbox(
                        value: selected,
                        onTap: onToggleSelection,
                      ),
                    ),
                  ],
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
                          _text(item.productCode),
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
                  ProductReturnStatusChip(item: item),
                ],
              ),
              const SizedBox(height: 10),

              /// ===== NGƯỜI MƯỢN + DỰ ÁN =====
              _InfoLine(
                icon: Icons.person_outline,
                label: 'Người mượn',
                value: _text(item.fullName),
              ),
              const SizedBox(height: 6),
              _InfoLine(
                icon: Icons.work_outline,
                label: 'Dự án',
                value: _text(item.project),
              ),
              const SizedBox(height: 12),

              /// ===== BẢNG THÔNG TIN: VỊ TRÍ + THỜI GIAN =====
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _MetricCell(
                            label: 'Vị trí hộp',
                            value: item.boxLocation.isEmpty
                                ? '--'
                                : item.boxLocation,
                          ),
                        ),
                        const _MetricDivider(),
                        Expanded(
                          child: _MetricCell(
                            label: 'Vị trí Modula',
                            value: item.modulaLocation.isEmpty
                                ? '--'
                                : item.modulaLocation,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _MetricCell(
                            label: 'Ngày mượn',
                            value: _formatDate(item.dateBorrow),
                            valueColor: AppColors.success,
                          ),
                        ),
                        const _MetricDivider(),
                        Expanded(
                          child: _MetricCell(
                            label: 'Dự kiến trả',
                            value: _formatDate(item.dateReturnExpected),
                            valueColor: AppColors.alert,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              if ((item.note ?? '').trim().isNotEmpty) ...[
                const SizedBox(height: 10),
                _NoteRow(note: item.note!),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Text hiển thị, `--` nếu rỗng.
  static String _text(String? value) {
    final trimmed = (value ?? '').trim();
    return trimmed.isEmpty ? '--' : trimmed;
  }

  /// Format ISO sang `dd/MM/yyyy`; `--` nếu rỗng hoặc sai định dạng.
  static String _formatDate(String? raw) {
    final date = DateTime.tryParse(raw ?? '');
    if (date == null) return '--';
    return DateFormat('dd/MM/yyyy').format(date);
  }
}

/// Dòng thông tin dạng icon + "Nhãn: giá trị" (dùng cho người mượn / dự án).
class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Icon(icon, size: 14, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            height: 1.25,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.enableText,
              height: 1.25,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Ô số liệu trong bảng: nhãn nhỏ ở trên, giá trị đậm ở dưới.
///
/// [valueColor] màu của giá trị; khi rỗng (không có dữ liệu) dùng màu xám.
class _MetricCell extends StatelessWidget {
  const _MetricCell({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final isEmpty = value == '--';
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
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: (valueColor != null && !isEmpty)
                ? valueColor
                : AppColors.enableText,
            height: 1.2,
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
    return Container(width: 1, height: 28, color: AppColors.borderColor);
  }
}

/// Ô vuông chọn phiếu (checkbox) ở đầu card khi đang chọn để duyệt.
///
/// Kích thước lớn để dễ bấm trên màn hình cảm ứng.
class _SelectionCheckbox extends StatelessWidget {
  const _SelectionCheckbox({required this.value, this.onTap});

  /// Đang chọn hay chưa.
  final bool value;

  /// Bấm để bật/tắt chọn.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: value
                ? AppColors.primaryERP.withValues(alpha: 0.12)
                : AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: value ? AppColors.primaryERP : AppColors.gray,
              width: value ? 2 : 1.5,
            ),
          ),
          child: Icon(
            value ? Icons.check : null,
            size: 20,
            color: AppColors.primaryERP,
          ),
        ),
      ),
    );
  }
}

/// Dòng ghi chú của phiếu trả sản phẩm.
class _NoteRow extends StatelessWidget {
  const _NoteRow({required this.note});

  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.orangeA100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.notes_outlined,
            size: 13,
            color: AppColors.secondaryERP,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              note.trim(),
              style: const TextStyle(
                fontSize: 11.5,
                height: 1.3,
                color: AppColors.enableText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
