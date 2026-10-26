import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/data/datasource/models/history_import_export_model.dart';

/// Card hiển thị một dòng lịch sử nhập/xuất kho: mã phiếu + trạng thái,
/// sản phẩm, số lượng và các bên liên quan (người giao, người nhận, NCC...).
class HistoryImportExportCard extends StatelessWidget {
  const HistoryImportExportCard({super.key, required this.item});

  final HistoryImportExportResponse item;

  /// Format `yyyy-MM-ddTHH:mm:ss` từ API sang `dd/MM/yyyy`; trả `--` nếu rỗng/sai.
  String get _dateText {
    final date = DateTime.tryParse(item.creatDate ?? '');
    return date == null ? '--' : DateFormat('dd/MM/yyyy').format(date);
  }

  /// Hiển thị số lượng bỏ phần thập phân thừa (1.00 → 1).
  String get _qtyText {
    final qty = item.qty;
    if (qty == null) return '--';
    final text = qty == qty.truncateToDouble()
        ? qty.toStringAsFixed(0)
        : qty.toString();
    return '$text ${item.unit ?? ''}'.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeaderRow(
            code: item.billImportCode ?? '--',
            statusText: item.statusText,
          ),
          const SizedBox(height: 12),
          _ProductBlock(
            name: item.productName ?? '--',
            code: item.productNewCode ?? item.productCode,
            qtyText: _qtyText,
          ),
          const SizedBox(height: 12),
          _InfoRow(icon: Icons.event_outlined, label: 'Ngày', value: _dateText),
          const SizedBox(height: 6),
          _InfoRow(
            icon: Icons.warehouse_outlined,
            label: 'Kho',
            value: _joinNonEmpty([item.warehouseName, item.khoType]),
          ),
          const SizedBox(height: 6),
          _InfoRow(
            icon: Icons.local_shipping_outlined,
            label: 'Người giao',
            value: item.deliver,
          ),
          const SizedBox(height: 6),
          _InfoRow(
            icon: Icons.person_pin_outlined,
            label: 'Người nhận',
            value: item.reciver,
          ),
          const SizedBox(height: 6),
          _InfoRow(
            icon: Icons.business_outlined,
            label: 'NCC',
            value: item.suplier,
          ),
          const SizedBox(height: 6),
          _InfoRow(
            icon: Icons.folder_outlined,
            label: 'Dự án',
            value: item.projectName,
          ),
          if ((item.note ?? '').trim().isNotEmpty) ...[
            const SizedBox(height: 6),
            _InfoRow(
              icon: Icons.notes_outlined,
              label: 'Ghi chú',
              value: item.note,
            ),
          ],
          if ((item.approveText ?? '').isNotEmpty) ...[
            const SizedBox(height: 10),
            _ApproveBadge(text: item.approveText!),
          ],
        ],
      ),
    );
  }

  static String _joinNonEmpty(List<String?> parts) {
    final text = parts.where((p) => (p ?? '').isNotEmpty).join(' - ');
    return text.isEmpty ? '--' : text;
  }
}

/// Dòng đầu card: mã phiếu và chip loại phiếu (vd. "Phiếu Nhập").
class _HeaderRow extends StatelessWidget {
  const _HeaderRow({required this.code, required this.statusText});

  final String code;
  final String? statusText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.receipt_long_outlined,
          size: 18,
          color: AppColors.primaryERP,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            code,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.enableText,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if ((statusText ?? '').isNotEmpty) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              statusText!,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryERP,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Khối sản phẩm: tên, mã và số lượng.
class _ProductBlock extends StatelessWidget {
  const _ProductBlock({
    required this.name,
    required this.code,
    required this.qtyText,
  });

  final String name;
  final String? code;
  final String qtyText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.grey_bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                if ((code ?? '').isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    code!,
                    style: TextStyle(fontSize: 11, color: AppColors.gray),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            qtyText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryERP,
            ),
          ),
        ],
      ),
    );
  }
}

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
    final text = (value ?? '').trim().isEmpty ? '--' : value!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 14, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: TextStyle(fontSize: 12, color: AppColors.gray, height: 1.2),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.enableText,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Pill hiển thị trạng thái duyệt/nhận chứng từ (vd. "Huỷ/Chưa nhận chứng từ").
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
        border: Border.all(color: color.withValues(alpha: 0.45)),
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
