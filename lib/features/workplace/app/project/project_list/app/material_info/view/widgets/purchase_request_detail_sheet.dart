import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/material_category_model.dart';
import 'info_detail_sheet.dart';

/// Popup chi tiết "Yêu cầu mua hàng" — 21 trường.
class PurchaseRequestDetailSheet {
  PurchaseRequestDetailSheet._();

  static Future<void> show(BuildContext context, MaterialCategoryItem item) {
    return InfoDetailSheet.show(
      context,
      title: 'Yêu cầu mua hàng',
      icon: Icons.shopping_cart_outlined,
      iconColor: const Color(0xFF8E24AA),
      subtitle: '${item.code} · ${item.name}',
      children: _buildFields(item),
    );
  }

  static List<Widget> _buildFields(MaterialCategoryItem item) {
    final p = MockPurchaseRequest.forItem(item);

    return [
      // === CHUNG ===
      const InfoSectionHeader('Chung'),
      InfoField(label: 'Yêu cầu mua', value: p.purchaseRequest),
      InfoField(label: 'Người yêu cầu', value: p.requester),
      InfoField(label: 'Tình trạng', value: p.status),
      InfoField(label: 'NV mua hàng', value: p.buyer),

      // === THỜI GIAN ===
      const InfoSectionHeader('Thời gian'),
      InfoField(label: 'Deadline mua hàng', value: p.deadline),
      InfoField(label: 'Ngày yêu cầu đặt hàng', value: p.orderRequestAt),
      InfoField(label: 'Ngày dự kiến hàng về', value: p.expectedArrival),
      InfoField(label: 'Ngày nhận hàng', value: p.receivedAt),

      // === ĐẶT HÀNG ===
      const InfoSectionHeader('Đặt hàng'),
      InfoField(label: 'Mã đặt hàng', value: p.orderCode),

      // === GIÁ ===
      const InfoSectionHeader('Giá'),
      InfoField(label: 'Đơn giá mua hàng', value: p.unitPrice),
      InfoField(label: 'Thành tiền mua hàng', value: p.totalPrice),
      InfoField(label: 'Loại tiền MH', value: p.currency),
      InfoField(label: 'Tỷ giá mua', value: p.exchangeRate),
      InfoField(label: 'Thành tiền quy đổi MH (VND)', value: p.totalVnd),

      // === NHÀ CUNG CẤP ===
      const InfoSectionHeader('Nhà cung cấp'),
      InfoField(label: 'NCC mua hàng', value: p.supplier),
      InfoField(label: 'LeadTime đặt hàng', value: p.leadTime),

      // === SỐ LƯỢNG ===
      const InfoSectionHeader('Số lượng'),
      InfoField(label: 'Số lượng đã về', value: p.qtyReceived),
      InfoField(label: 'Số lượng đã xuất', value: p.qtyIssued),
      InfoField(label: 'Số lượng còn lại', value: p.qtyRemaining),
      InfoField(label: 'Mã nội bộ', value: p.internalCode),
      InfoField(label: 'Phiếu xuất', value: p.exportTicket),

      // === GHI CHÚ ===
      const InfoSectionHeader('Ghi chú'),
      InfoField(label: 'Ghi chú mua', value: p.note),
    ];
  }
}

class MockPurchaseRequest {
  MockPurchaseRequest({
    required this.purchaseRequest,
    required this.requester,
    required this.status,
    required this.buyer,
    required this.deadline,
    required this.orderRequestAt,
    required this.expectedArrival,
    required this.receivedAt,
    required this.orderCode,
    required this.unitPrice,
    required this.totalPrice,
    required this.currency,
    required this.exchangeRate,
    required this.totalVnd,
    required this.supplier,
    required this.leadTime,
    required this.qtyReceived,
    required this.qtyIssued,
    required this.qtyRemaining,
    required this.internalCode,
    required this.exportTicket,
    required this.note,
  });

  final String? purchaseRequest;
  final String? requester;
  final String? status;
  final String? buyer;
  final String? deadline;
  final String? orderRequestAt;
  final String? expectedArrival;
  final String? receivedAt;
  final String? orderCode;
  final String? unitPrice;
  final String? totalPrice;
  final String? currency;
  final String? exchangeRate;
  final String? totalVnd;
  final String? supplier;
  final String? leadTime;
  final String? qtyReceived;
  final String? qtyIssued;
  final String? qtyRemaining;
  final String? internalCode;
  final String? exportTicket;
  final String? note;

  static MockPurchaseRequest forItem(MaterialCategoryItem item) {
    final seed = item.id;
    String? pickText(int mod, List<String?> opts) {
      if ((seed + mod * 5) % 4 == 0) return null;
      return opts[(seed + mod * 11) % opts.length];
    }

    return MockPurchaseRequest(
      purchaseRequest: pickText(1, ['YC-001', 'YC-002', 'YC-003']),
      requester: pickText(2, [
        'Phạm Văn D',
        'Hoàng Thị E',
        'Đỗ Văn F',
      ]),
      status: pickText(3, [
        'Chờ mua',
        'Đang đặt hàng',
        'Đã về kho',
        'Hoàn thành',
      ]),
      buyer: pickText(4, [
        'Lê Văn G',
        'Bùi Thị H',
        'Trịnh Văn I',
      ]),
      deadline: pickText(5, ['25/05/2026', '15/06/2026']),
      orderRequestAt: pickText(6, ['18/05/2026', '10/06/2026']),
      expectedArrival: pickText(7, ['28/05/2026', '20/06/2026']),
      receivedAt: pickText(8, ['29/05/2026', '21/06/2026']),
      orderCode: pickText(9, ['DH-001', 'DH-002', 'DH-003']),
      unitPrice: pickText(10, ['1.280.000 đ', '4.750.000 đ']),
      totalPrice: pickText(11, ['12.800.000 đ', '47.500.000 đ']),
      currency: pickText(12, ['VND', 'USD', 'EUR']),
      exchangeRate: pickText(13, ['1', '25.350', '27.800']),
      totalVnd: pickText(14, ['12.800.000 đ', '314.062.500 đ']),
      supplier: pickText(15, [
        'Cty CP Thiết bị ABC',
        'Cty TNHH XYZ',
        'Nhà phân phối DEF',
      ]),
      leadTime: pickText(16, ['10 ngày', '15 ngày', '21 ngày']),
      qtyReceived: pickText(17, ['10', '50', '100']),
      qtyIssued: pickText(18, ['5', '20', '60']),
      qtyRemaining: pickText(19, ['5', '30', '40']),
      internalCode: pickText(20, ['NB-001', 'NB-002', 'NB-003']),
      exportTicket: pickText(21, ['PX-001', 'PX-002', 'PX-003']),
      note: pickText(22, [
        'Hàng đã kiểm tra đạt chất lượng',
        'Cần xác nhận lại SL với NCC',
      ]),
    );
  }
}
