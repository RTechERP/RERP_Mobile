import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/part_list_model.dart';
import 'info_detail_sheet.dart';

/// Popup chi tiết "Yêu cầu báo giá" — hiển thị dữ liệu từ PartListModel.
class QuoteRequestDetailSheet {
  QuoteRequestDetailSheet._();

  static Future<void> show(BuildContext context, {required PartListModel partListItem}) {
    return InfoDetailSheet.show(
      context,
      title: 'Yêu cầu báo giá',
      icon: Icons.request_quote_outlined,
      iconColor: const Color(0xFFFB8C00),
      subtitle: '${partListItem.productCode ?? '--'} · ${partListItem.groupMaterial ?? 'Vật tư'}',
      children: _buildFields(partListItem),
    );
  }

  static List<Widget> _buildFields(PartListModel item) {
    return [
      const InfoSectionHeader('Trạng thái'),
      InfoField(label: 'Check giá', boolValue: item.isCheckPrice),
      InfoField(label: 'Trạng thái báo giá', value: item.statusPriceRequestText),
      InfoField(label: 'NV báo giá', value: item.fullNameQuote),
      InfoField(label: 'Người yêu cầu', value: item.fullNameRequestPrice),

      const InfoSectionHeader('Thời gian'),
      InfoField(label: 'Ngày yêu cầu', value: _formatDate(item.datePriceRequest)),
      InfoField(label: 'Deadline báo giá', value: _formatDate(item.deadlinePriceRequest)),
      InfoField(label: 'Ngày báo giá', value: _formatDate(item.datePriceQuote)),
      InfoField(label: 'LeadTime báo giá', value: item.leadTimeQuote),
      InfoField(label: 'Ngày về dự kiến', value: _formatDate(item.dateExpectedQuote)),

      const InfoSectionHeader('Giá'),
      InfoField(label: 'Giá lịch sử', value: item.unitPriceHistory?.toStringAsFixed(0)),
      InfoField(label: 'Đơn giá báo', value: item.unitPriceQuote?.toStringAsFixed(0)),
      InfoField(label: 'Thành tiền báo giá', value: item.totalPriceQuote?.toStringAsFixed(0)),
      InfoField(label: 'Loại tiền', value: item.currencyQuote),
      InfoField(label: 'Tỷ giá', value: item.currencyRateQuote?.toStringAsFixed(0)),
      InfoField(label: 'Thành tiền quy đổi (VND)', value: item.totalPriceExchangeQuote?.toStringAsFixed(0)),

      const InfoSectionHeader('Nhà cung cấp'),
      InfoField(label: 'NCC báo giá', value: item.nameNccPriceQuote),
      InfoField(label: 'Ghi chú báo giá', value: item.noteQuote),
    ];
  }

  static String? _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    try {
      final d = DateTime.parse(raw);
      return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
    } catch (_) {
      return raw;
    }
  }
}
