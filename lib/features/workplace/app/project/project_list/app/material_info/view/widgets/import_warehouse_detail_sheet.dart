import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/part_list_model.dart';
import 'info_detail_sheet.dart';

/// Popup chi tiết "Nhập kho" — hiển thị dữ liệu từ PartListModel.
class ImportWarehouseDetailSheet {
  ImportWarehouseDetailSheet._();

  static Future<void> show(BuildContext context, {required PartListModel partListItem}) {
    return InfoDetailSheet.show(
      context,
      title: 'Nhập kho',
      icon: Icons.inventory_2_outlined,
      iconColor: const Color(0xFF43A047),
      subtitle: '${partListItem.productCode ?? '--'} · ${partListItem.groupMaterial ?? 'Vật tư'}',
      children: _buildFields(partListItem),
    );
  }

  static List<Widget> _buildFields(PartListModel item) {
    return [
      const InfoSectionHeader('Thông tin phiếu nhập'),
      InfoField(label: 'Ngày nhập kho', value: _formatDate(item.dateImport)),
      InfoField(label: 'Mã phiếu nhập', value: item.billImportCode),
      InfoField(label: 'SL nhập kho', value: item.quantityReturn?.toStringAsFixed(0)),
      InfoField(label: 'Bill xuất kho', value: item.billExportCode),
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
