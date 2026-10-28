import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/widgets/form/form_left_border_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/data/datasource/models/history_import_export_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/view/widgets/history_import_export_extra_sheet.dart';

/// Card một dòng lịch sử nhập/xuất kho, dựng trên [FormLeftBorderCard].
///
/// Bố cục: viền trái theo loại phiếu (nhập = xanh lá, xuất = cam) → header số
/// phiếu → tình trạng chứng từ → khối sản phẩm → ô Kho/ĐVT/Số lượng → người
/// nhận/giao. Các field bổ sung xem qua nút 3 chấm.
class HistoryImportExportCard extends StatelessWidget {
  const HistoryImportExportCard({super.key, required this.item});

  final HistoryImportExportResponse item;

  /// Phiếu xuất khi `statusText` chứa "xuất", ngược lại coi là phiếu nhập.
  bool get _isExport => (item.statusText ?? '').toLowerCase().contains('xuất');

  /// Màu nhận diện loại phiếu, dùng cho dải bên trái, chip và số lượng.
  Color get _accent =>
      _isExport ? AppColors.orangeA500 : AppColors.stateSuccessColor;

  /// Số lượng giữ nguyên giá trị double của response (1.0, 2.5); `--` nếu null.
  String get _qtyText => item.qty?.toString() ?? '--';

  @override
  Widget build(BuildContext context) {
    // Bóng đổ nằm ngoài để FormLeftBorderCard giữ nguyên viền trái + bo góc.
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: FormLeftBorderCard(
        borderColor: _accent,
        backgroundColor: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        padding: const EdgeInsets.fromLTRB(14, 12, 6, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _HeaderRow(
              code: item.billImportCode ?? '--',
              statusText: item.statusText,
              accent: _accent,
              onMore: () => _showExtraInfo(context),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if ((item.approveText ?? '').isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _ApproveBadge(text: item.approveText!),
                    ),
                  ],
                  const SizedBox(height: 10),
                  _InfoRow(
                    icon: Icons.event_available_outlined,
                    label: 'Ngày huỷ/nhận chứng từ',
                    value: _formatDate(item.dateStatus, withTime: true),
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 1, color: AppColors.borderColor),
                  const SizedBox(height: 10),
                  _ProductBlock(
                    productNewCode: item.productNewCode,
                    productCode: item.productCode,
                    productName: item.productName,
                  ),
                  const SizedBox(height: 10),
                  _MetaStrip(
                    warehouseName: item.warehouseName,
                    materialType: item.materialType,
                    unit: item.unit,
                    qtyText: _qtyText,
                    accent: _accent,
                  ),
                  const SizedBox(height: 10),
                  _PartyRow(receiver: item.reciver, deliverer: item.deliver),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Mở sheet các field bổ sung không hiển thị trên card.
  void _showExtraInfo(BuildContext context) {
    HistoryImportExportExtraSheet.show(
      context,
      billCode: item.billImportCode ?? '--',
      accent: _accent,
      entries: [
        HistoryExtraEntry(
          icon: Icons.business_outlined,
          label: 'Nhà cung cấp',
          value: item.suplier,
        ),
        HistoryExtraEntry(
          icon: Icons.place_outlined,
          label: 'Vị trí',
          value: item.addressBox,
        ),
        HistoryExtraEntry(
          icon: Icons.receipt_outlined,
          label: 'Hoá đơn',
          value: item.someBill,
        ),
        HistoryExtraEntry(
          icon: Icons.shopping_cart_outlined,
          label: 'Đơn mua hàng',
          value: item.billCode,
        ),
        HistoryExtraEntry(
          icon: Icons.folder_outlined,
          label: 'Dự án',
          value: item.projectName,
        ),
        HistoryExtraEntry(
          icon: Icons.notes_outlined,
          label: 'Ghi chú',
          value: item.note,
        ),
        HistoryExtraEntry(
          icon: Icons.schedule_outlined,
          label: 'Ngày tạo',
          value: _formatDate(item.createdDate, withTime: true),
        ),
      ],
    );
  }

  /// Format ISO `yyyy-MM-ddTHH:mm:ss` sang `dd/MM/yyyy [HH:mm]`; null nếu
  /// rỗng hoặc sai định dạng.
  static String? _formatDate(String? raw, {bool withTime = false}) {
    final date = DateTime.tryParse(raw ?? '');
    if (date == null) return null;
    return DateFormat(
      withTime ? 'dd/MM/yyyy HH:mm' : 'dd/MM/yyyy',
    ).format(date);
  }
}

/// Dòng đầu card: số phiếu, chip loại phiếu và nút 3 chấm.
class _HeaderRow extends StatelessWidget {
  const _HeaderRow({
    required this.code,
    required this.statusText,
    required this.accent,
    required this.onMore,
  });

  final String code;
  final String? statusText;
  final Color accent;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            code,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if ((statusText ?? '').isNotEmpty) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              statusText!,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: accent,
              ),
            ),
          ),
        ],
        SizedBox(
          height: 28,
          width: 28,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.more_vert, size: 20),
            color: AppColors.gray,
            tooltip: 'Thông tin bổ sung',
            visualDensity: VisualDensity.compact,
            onPressed: onMore,
          ),
        ),
      ],
    );
  }
}

/// Khối sản phẩm: mã nội bộ + mã sản phẩm trên một dòng, tên sản phẩm dưới.
class _ProductBlock extends StatelessWidget {
  const _ProductBlock({
    required this.productNewCode,
    required this.productCode,
    required this.productName,
  });

  final String? productNewCode;
  final String? productCode;
  final String? productName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          (productName ?? '').trim().isEmpty ? '--' : productName!.trim(),
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: AppColors.enableText,
            height: 1.3,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            _CodeTag(label: 'Mã nội bộ', value: productNewCode),
            _CodeTag(label: 'Mã SP', value: productCode),
          ],
        ),
      ],
    );
  }
}

/// Tag nhỏ dạng `label: value`, dùng cho mã nội bộ / mã sản phẩm.
class _CodeTag extends StatelessWidget {
  const _CodeTag({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final text = (value ?? '').trim().isEmpty ? '--' : value!.trim();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.grey_bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(color: AppColors.gray),
            ),
            TextSpan(
              text: text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.enableText,
              ),
            ),
          ],
        ),
        style: const TextStyle(fontSize: 11.5),
      ),
    );
  }
}

/// Dải nền chứa Kho / Loại vật tư / ĐVT / Số lượng, số lượng nổi bật bên phải.
class _MetaStrip extends StatelessWidget {
  const _MetaStrip({
    required this.warehouseName,
    required this.materialType,
    required this.unit,
    required this.qtyText,
    required this.accent,
  });

  final String? warehouseName;
  final String? materialType;
  final String? unit;
  final String qtyText;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.grey_bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MetaCell(
                  icon: Icons.warehouse_outlined,
                  label: 'Kho',
                  value: warehouseName,
                ),
                const SizedBox(height: 6),
                _MetaCell(
                  icon: Icons.category_outlined,
                  label: 'Loại vật tư',
                  value: materialType,
                ),
              ],
            ),
          ),
          Container(
            height: 34,
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.borderColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'ĐVT: ',
                      style: TextStyle(color: AppColors.gray),
                    ),
                    TextSpan(
                      text: unit == null || unit!.trim().isEmpty
                          ? '--'
                          : unit!.trim(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.enableText,
                      ),
                    ),
                  ],
                ),
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'SL: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray,
                      ),
                    ),
                    TextSpan(
                      text: qtyText,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: accent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Dòng `icon + label` nhỏ bên trong [_MetaStrip].
class _MetaCell extends StatelessWidget {
  const _MetaCell({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final text = (value ?? '').trim().isEmpty ? '--' : value!.trim();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 13, color: AppColors.gray),
        const SizedBox(width: 5),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(color: AppColors.gray),
                ),
                TextSpan(
                  text: text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
            style: const TextStyle(fontSize: 11.5, height: 1.25),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Dòng Người nhận / Người giao, chia đôi chiều ngang.
class _PartyRow extends StatelessWidget {
  const _PartyRow({required this.receiver, required this.deliverer});

  final String? receiver;
  final String? deliverer;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _PartyCell(
            icon: Icons.person_pin_outlined,
            label: 'Người nhận',
            value: receiver,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _PartyCell(
            icon: Icons.local_shipping_outlined,
            label: 'Người giao',
            value: deliverer,
          ),
        ),
      ],
    );
  }
}

class _PartyCell extends StatelessWidget {
  const _PartyCell({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final text = (value ?? '').trim().isEmpty ? '--' : value!.trim();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Icon(icon, size: 14, color: AppColors.secondaryERP),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 10.5, color: AppColors.gray),
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.enableText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Một dòng `icon + label: value` dùng cho "Ngày huỷ/nhận chứng từ".
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final text = (value ?? '').trim().isEmpty ? '--' : value!.trim();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(color: AppColors.gray),
                ),
                TextSpan(
                  text: text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
            style: const TextStyle(fontSize: 12, height: 1.2),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Pill hiển thị tình trạng chứng từ (vd. "Huỷ/Chưa nhận chứng từ").
class _ApproveBadge extends StatelessWidget {
  const _ApproveBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final isWarning = text.contains('Huỷ') || text.contains('Chưa');
    final color = isWarning
        ? AppColors.stateWarningColor
        : AppColors.stateSuccessColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isWarning ? Icons.info_outline : Icons.check_circle,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
