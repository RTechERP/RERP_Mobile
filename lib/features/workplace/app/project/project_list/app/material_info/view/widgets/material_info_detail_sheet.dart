import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/material_category_model.dart';
import 'info_detail_sheet.dart';

/// Popup chi tiết "Thông tin vật tư" — 16 trường.
///
/// Tạm thời dùng dữ liệu mock từ MaterialCategoryItem + các field phụ
/// sinh ra để demo UI; sẽ thay bằng API sau.
class MaterialInfoDetailSheet {
  MaterialInfoDetailSheet._();

  static Future<void> show(BuildContext context, MaterialCategoryItem item) {
    return InfoDetailSheet.show(
      context,
      title: 'Thông tin vật tư',
      icon: Icons.info_outline,
      iconColor: const Color(0xFF1E88E5),
      subtitle: '${item.code} · ${item.name}',
      children: _buildFields(context, item),
    );
  }

  static List<Widget> _buildFields(BuildContext context, MaterialCategoryItem item) {
    final device = (item.deviceCode == null || item.deviceCode!.isEmpty)
        ? null
        : item.deviceCode;

    // Các field chưa có trên model -> lấy mock ngẫu nhiên từ item.id để demo
    // deterministic cho mỗi phiếu. Khi backend ready sẽ thay bằng field thật.
    final m = MockMaterialInfo.forItem(item);

    return [
      // === THÔNG SỐ ===
      const InfoSectionHeader('Thông số kỹ thuật'),
      InfoField(label: 'Thông số kỹ thuật', value: m.specs),
      InfoField(label: 'Mã đặc biệt', value: m.specialCode),
      InfoField(label: 'Hãng SX', value: m.manufacturer),
      InfoField(label: 'Đơn vị', value: m.unit),

      // === TRẠNG THÁI ===
      const InfoSectionHeader('Trạng thái'),
      InfoField(label: 'Tích xanh', boolValue: m.greenCheck),
      InfoField(label: 'TBP duyệt', boolValue: m.tbpApproved),
      InfoField(label: 'Hàng mới', boolValue: m.isNew),
      InfoField(label: 'TBP duyệt SP mới', boolValue: m.tbpApprovedNew),

      // === GIÁ ===
      const InfoSectionHeader('Giá'),
      InfoField(label: 'Đơn giá', value: m.unitPrice),
      InfoField(label: 'Tổng tiền', value: m.totalPrice),
      InfoField(label: 'Đơn giá lịch sử', value: m.historicalPrice),
      InfoField(label: 'Loại tiền', value: m.currency),
      InfoField(label: 'Chất lượng', value: m.quality),

      // === KHÁC ===
      const InfoSectionHeader('Khác'),
      InfoField(label: 'Người tạo', value: m.createdBy),
      InfoField(label: 'Ngày tạo', value: m.createdAt),
      InfoField(label: 'Mã thiết bị', value: device),
      InfoField(label: 'Ghi chú', value: item.note),
      InfoField(label: 'Lý do phát sinh', value: m.reasonOccur),
      InfoField(label: 'Lý do xoá', value: m.reasonDelete),
    ];
  }
}

/// Mock data factory — sinh dữ liệu nhất quán từ item.id (hash) để
/// mỗi phiếu luôn hiển thị cùng giá trị qua các lần mở popup.
class MockMaterialInfo {
  MockMaterialInfo({
    required this.specs,
    required this.specialCode,
    required this.manufacturer,
    required this.unit,
    required this.greenCheck,
    required this.tbpApproved,
    required this.isNew,
    required this.tbpApprovedNew,
    required this.historicalPrice,
    required this.unitPrice,
    required this.totalPrice,
    required this.currency,
    required this.quality,
    required this.createdBy,
    required this.createdAt,
    required this.reasonOccur,
    required this.reasonDelete,
  });

  final String? specs;
  final String? specialCode;
  final String? manufacturer;
  final String? unit;
  final bool? greenCheck;
  final bool? tbpApproved;
  final bool? isNew;
  final bool? tbpApprovedNew;
  final String? historicalPrice;
  final String? unitPrice;
  final String? totalPrice;
  final String? currency;
  final String? quality;
  final String? createdBy;
  final String? createdAt;
  final String? reasonOccur;
  final String? reasonDelete;

  static MockMaterialInfo forItem(MaterialCategoryItem item) {
    final seed = item.id;
    bool pickBool(int mod) => (seed * 7 + mod * 13) % 3 == 0;
    String? pickText(int mod, List<String?> opts) {
      if ((seed + mod * 5) % 4 == 0) return null;
      return opts[(seed + mod * 11) % opts.length];
    }

    return MockMaterialInfo(
      specs: pickText(1, [
        'Thép không gỉ SUS304, dày 2mm',
        'Nhôm A6061, anodized',
        'Inox 316 chống ăn mòn',
      ]),
      specialCode: pickText(2, ['SP-001-A', 'SP-002-B', null, 'SP-XL-01']),
      manufacturer: pickText(3, [
        'Mitsubishi (JP)',
        'Schneider (FR)',
        'Festo (DE)',
        'SMC (JP)',
      ]),
      unit: pickText(4, ['Cái', 'Bộ', 'Mét', 'Kg']),
      greenCheck: pickBool(1),
      tbpApproved: pickBool(2),
      isNew: pickBool(3),
      tbpApprovedNew: pickBool(4),
      historicalPrice: pickText(5, [
        '1.250.000 đ',
        '4.800.000 đ',
        '320.000 đ',
      ]),
      unitPrice: pickText(15, [
        '1.300.000 đ',
        '4.950.000 đ',
        '350.000 đ',
      ]),
      totalPrice: pickText(16, [
        '13.000.000 đ',
        '49.500.000 đ',
        '3.500.000 đ',
      ]),
      currency: pickText(6, ['VND', 'USD', 'EUR', 'JPY']),
      quality: pickText(7, ['Loại A', 'Loại B', 'OEM']),
      createdBy: pickText(8, [
        'Nguyễn Văn A',
        'Trần Thị B',
        'Lê Văn C',
      ]),
      createdAt: pickText(9, [
        '12/05/2026 09:30',
        '03/06/2026 14:15',
        '20/07/2026 10:45',
      ]),
      reasonOccur: pickText(10, [
        'Bổ sung cho dự án mở rộng',
        'Thay thế hàng hỏng',
      ]),
      reasonDelete: pickText(11, [
        'Trùng mã với phiếu cũ',
        'Sai thông số kỹ thuật',
      ]),
    );
  }
}
