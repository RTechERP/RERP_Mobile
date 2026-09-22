import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/part_list_model.dart';
import 'info_detail_sheet.dart';

/// Popup chi tiết "Thông tin vật tư" — hiển thị dữ liệu từ PartListModel.
class MaterialInfoDetailSheet {
  MaterialInfoDetailSheet._();

  static Future<void> show(BuildContext context, {required PartListModel partListItem}) {
    return InfoDetailSheet.show(
      context,
      title: 'Thông tin vật tư',
      icon: Icons.info_outline,
      iconColor: const Color(0xFF1E88E5),
      subtitle: '${partListItem.productCode ?? '--'} · ${partListItem.groupMaterial ?? 'Vật tư'}',
      children: _buildFields(partListItem),
    );
  }

  static List<Widget> _buildFields(PartListModel item) {
    return [
      const InfoSectionHeader('Thông tin chung'),
      InfoField(label: 'Mã sản phẩm', value: item.productCode),
      InfoField(label: 'Model', value: item.model),
      InfoField(label: 'Hãng sản xuất', value: item.manufacturer),
      InfoField(label: 'Nhóm vật tư', value: item.groupMaterial),
      InfoField(label: 'Đơn vị', value: item.unit),
      InfoField(label: 'Mã TT', value: item.tt),

      const InfoSectionHeader('Số lượng'),
      InfoField(label: 'SL tối thiểu', value: item.qtyMin?.toString()),
      InfoField(label: 'SL đủ', value: item.qtyFull?.toString()),
      InfoField(label: 'SL còn lại', value: item.remainQuantity?.toString()),

      const InfoSectionHeader('Trạng thái'),
      InfoField(label: 'Trạng thái báo giá', value: item.statusPriceRequestText),
      InfoField(label: 'Duyệt TBP', value: item.isApprovedTbpText),
      InfoField(label: 'Duyệt mua hàng', value: item.isApprovedPurchaseText),
      InfoField(label: 'Ghi chú', value: item.note),

      const InfoSectionHeader('Báo giá'),
      InfoField(label: 'Đơn giá báo giá', value: item.unitPriceQuote?.toStringAsFixed(0)),
      InfoField(label: 'Thành tiền báo giá', value: item.totalPriceQuote?.toStringAsFixed(0)),
      InfoField(label: 'NCC báo giá', value: item.nameNccPriceQuote),
      InfoField(label: 'Lead time báo giá', value: item.leadTimeQuote),

      const InfoSectionHeader('Thông tin khác'),
      InfoField(label: 'Bill xuất', value: item.billExportCode),
      InfoField(label: 'Ngày tạo', value: _formatDate(item.createdDate)),
      InfoField(label: 'Người tạo', value: item.createdBy),
      InfoField(label: 'Mã đặc biệt', value: item.specialCode),
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
