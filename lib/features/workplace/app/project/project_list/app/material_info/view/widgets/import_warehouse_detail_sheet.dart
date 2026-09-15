import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/material_category_model.dart';
import 'info_detail_sheet.dart';

/// Popup chi tiết "Nhập kho" — 4 trường.
class ImportWarehouseDetailSheet {
  ImportWarehouseDetailSheet._();

  static Future<void> show(BuildContext context, MaterialCategoryItem item) {
    return InfoDetailSheet.show(
      context,
      title: 'Nhập kho',
      icon: Icons.inventory_2_outlined,
      iconColor: const Color(0xFF43A047),
      subtitle: '${item.code} · ${item.name}',
      children: _buildFields(item),
    );
  }

  static List<Widget> _buildFields(MaterialCategoryItem item) {
    final i = MockImport.forItem(item);

    return [
      const InfoSectionHeader('Thông tin phiếu nhập'),
      InfoField(label: 'Ngày nhập kho', value: i.importedAt),
      InfoField(label: 'Mã phiếu nhập', value: i.importCode),
      InfoField(label: 'Người nhập kho', value: i.importer),
      InfoField(label: 'Kho nhập', value: i.warehouse),
    ];
  }
}

class MockImport {
  MockImport({
    required this.importedAt,
    required this.importCode,
    required this.importer,
    required this.warehouse,
  });

  final String? importedAt;
  final String? importCode;
  final String? importer;
  final String? warehouse;

  static MockImport forItem(MaterialCategoryItem item) {
    final seed = item.id;
    String? pickText(int mod, List<String?> opts) {
      if ((seed + mod * 5) % 4 == 0) return null;
      return opts[(seed + mod * 11) % opts.length];
    }

    return MockImport(
      importedAt: pickText(1, [
        '15/05/2026 09:30',
        '22/06/2026 14:00',
        '03/07/2026 10:15',
      ]),
      importCode: pickText(2, ['PN-001', 'PN-002', 'PN-003', 'PN-004']),
      importer: pickText(3, [
        'Nguyễn Văn K',
        'Trần Thị L',
        'Lê Văn M',
      ]),
      warehouse: pickText(4, [
        'Kho Hà Nội',
        'Kho Hồ Chí Minh',
        'Kho Đan Phượng',
        'Kho Hải Phòng',
        'Kho Bắc Ninh',
      ]),
    );
  }
}
