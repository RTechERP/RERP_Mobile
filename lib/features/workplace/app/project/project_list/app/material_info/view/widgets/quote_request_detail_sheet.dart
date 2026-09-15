import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/material_category_model.dart';
import 'info_detail_sheet.dart';

/// Popup chi tiết "Yêu cầu báo giá" — 21 trường.
class QuoteRequestDetailSheet {
  QuoteRequestDetailSheet._();

  static Future<void> show(BuildContext context, MaterialCategoryItem item) {
    return InfoDetailSheet.show(
      context,
      title: 'Yêu cầu báo giá',
      icon: Icons.request_quote_outlined,
      iconColor: const Color(0xFFFB8C00),
      subtitle: '${item.code} · ${item.name}',
      children: _buildFields(item),
    );
  }

  static List<Widget> _buildFields(MaterialCategoryItem item) {
    final q = MockQuoteRequest.forItem(item);

    return [
      // === TRẠNG THÁI ===
      const InfoSectionHeader('Trạng thái'),
      InfoField(label: 'Check giá', boolValue: q.priceChecked),
      InfoField(label: 'Trạng thái báo giá', value: q.status),
      InfoField(label: 'NV báo giá', value: q.quoter),
      InfoField(label: 'Lý do từ chối báo giá', value: q.rejectReason),

      // === THỜI GIAN ===
      const InfoSectionHeader('Thời gian'),
      InfoField(label: 'Người yêu cầu', value: q.requester),
      InfoField(label: 'Ngày yêu cầu', value: q.requestedAt),
      InfoField(label: 'Deadline báo giá', value: q.deadline),
      InfoField(label: 'Ngày báo giá', value: q.quotedAt),
      InfoField(label: 'LeadTime cần hàng', value: q.neededLeadTime),
      InfoField(label: 'Hiệu lực', value: q.validUntil),

      // === GIÁ ===
      const InfoSectionHeader('Giá'),
      InfoField(label: 'Giá Target', value: q.targetPrice),
      InfoField(label: 'Đơn giá báo', value: q.unitPrice),
      InfoField(label: 'Thành tiền báo giá', value: q.totalPrice),
      InfoField(label: 'Loại tiền BG', value: q.currency),
      InfoField(label: 'Tỷ giá báo', value: q.exchangeRate),
      InfoField(label: 'Thành tiền quy đổi (VND)', value: q.totalVnd),

      // === NHÀ CUNG CẤP ===
      const InfoSectionHeader('Nhà cung cấp'),
      InfoField(label: 'NCC báo giá', value: q.supplier),
      InfoField(label: 'LeadTime báo giá', value: q.supplierLeadTime),
      InfoField(label: 'Ngày về dự kiến', value: q.expectedArrival),

      // === GHI CHÚ ===
      const InfoSectionHeader('Ghi chú'),
      InfoField(label: 'Ghi chú báo giá (Pur)', value: q.notePur),
      InfoField(label: 'Ghi chú báo giá (Kỹ thuật)', value: q.noteTech),
    ];
  }
}

class MockQuoteRequest {
  MockQuoteRequest({
    required this.priceChecked,
    required this.status,
    required this.quoter,
    required this.requester,
    required this.rejectReason,
    required this.requestedAt,
    required this.deadline,
    required this.quotedAt,
    required this.neededLeadTime,
    required this.validUntil,
    required this.targetPrice,
    required this.unitPrice,
    required this.totalPrice,
    required this.currency,
    required this.exchangeRate,
    required this.totalVnd,
    required this.supplier,
    required this.supplierLeadTime,
    required this.expectedArrival,
    required this.notePur,
    required this.noteTech,
  });

  final bool? priceChecked;
  final String? status;
  final String? quoter;
  final String? requester;
  final String? rejectReason;
  final String? requestedAt;
  final String? deadline;
  final String? quotedAt;
  final String? neededLeadTime;
  final String? validUntil;
  final String? targetPrice;
  final String? unitPrice;
  final String? totalPrice;
  final String? currency;
  final String? exchangeRate;
  final String? totalVnd;
  final String? supplier;
  final String? supplierLeadTime;
  final String? expectedArrival;
  final String? notePur;
  final String? noteTech;

  static MockQuoteRequest forItem(MaterialCategoryItem item) {
    final seed = item.id;
    bool pickBool(int mod) => (seed * 7 + mod * 13) % 3 == 0;
    String? pickText(int mod, List<String?> opts) {
      if ((seed + mod * 5) % 4 == 0) return null;
      return opts[(seed + mod * 11) % opts.length];
    }

    return MockQuoteRequest(
      priceChecked: pickBool(1),
      status: pickText(1, [
        'Chờ báo giá',
        'Đã báo giá',
        'Từ chối',
        'Đang đàm phán',
      ]),
      quoter: pickText(2, [
        'Nguyễn Văn A',
        'Trần Thị B',
        'Lê Văn C',
      ]),
      requester: pickText(20, [
        'Phạm Văn D',
        'Hoàng Thị E',
        'Đỗ Văn F',
      ]),
      rejectReason: pickText(3, [
        'Giá cao hơn thị trường',
        'LeadTime không đáp ứng',
      ]),
      requestedAt: pickText(4, [
        '12/05/2026 09:30',
        '03/06/2026 14:15',
      ]),
      deadline: pickText(5, [
        '20/05/2026',
        '10/06/2026',
      ]),
      quotedAt: pickText(6, [
        '15/05/2026 10:00',
        '05/06/2026 16:30',
      ]),
      neededLeadTime: pickText(7, ['7 ngày', '14 ngày', '30 ngày']),
      validUntil: pickText(8, ['30 ngày', '60 ngày', '90 ngày']),
      targetPrice: pickText(9, ['1.200.000 đ', '4.500.000 đ']),
      unitPrice: pickText(10, ['1.250.000 đ', '4.800.000 đ']),
      totalPrice: pickText(11, ['12.500.000 đ', '48.000.000 đ']),
      currency: pickText(12, ['VND', 'USD', 'EUR', 'JPY']),
      exchangeRate: pickText(13, ['1', '25.350', '27.800']),
      totalVnd: pickText(14, [
        '12.500.000 đ',
        '316.875.000 đ',
      ]),
      supplier: pickText(15, [
        'Cty CP Thiết bị ABC',
        'Cty TNHH XYZ',
        'Nhà phân phối DEF',
      ]),
      supplierLeadTime: pickText(16, ['10 ngày', '15 ngày', '21 ngày']),
      expectedArrival: pickText(17, [
        '28/05/2026',
        '20/06/2026',
      ]),
      notePur: pickText(18, [
        'Đã check 3 NCC, chọn giá tốt nhất',
        'Cần đàm phán thêm về leadtime',
      ]),
      noteTech: pickText(19, [
        'Đạt tiêu chuẩn kỹ thuật',
        'Cần test thêm trước khi duyệt',
      ]),
    );
  }
}
