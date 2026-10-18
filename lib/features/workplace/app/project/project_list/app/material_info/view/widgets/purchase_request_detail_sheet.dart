import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/part_list_model.dart';
import 'info_detail_sheet.dart';

/// Popup chi tiết "Yêu cầu mua hàng" — hiển thị dữ liệu từ PartListModel.
class PurchaseRequestDetailSheet {
  PurchaseRequestDetailSheet._();

  static Future<void> show(BuildContext context, {required PartListModel partListItem}) {
    return InfoDetailSheet.show(
      context,
      title: 'Yêu cầu mua hàng',
      icon: Icons.shopping_cart_outlined,
      iconColor: const Color(0xFF8E24AA),
      subtitle: '${partListItem.productCode ?? '--'} · ${partListItem.groupMaterial ?? 'Vật tư'}',
      children: _buildFields(partListItem),
    );
  }

  static List<Widget> _buildFields(PartListModel item) {
    return [
      const InfoSectionHeader('Trạng thái'),
      InfoField(label: 'Duyệt mua', value: item.isApprovedPurchaseText),
      InfoField(label: 'NV mua hàng', value: item.fullNamePurchase),

      const InfoSectionHeader('Thời gian'),
      InfoField(label: 'Ngày yêu cầu đặt hàng', value: _formatDate(item.requestDatePurchase)),
      InfoField(label: 'Deadline mua hàng', value: _formatDate(item.expectedDatePurchase)),

      const InfoSectionHeader('Đặt hàng'),
      InfoField(label: 'Mã đặt hàng', value: item.orderCode),
      InfoField(label: 'Bill đặt hàng', value: item.billCodePurchase),

      const InfoSectionHeader('Giá'),
      InfoField(label: 'Đơn giá mua', value: item.unitPricePurchase?.toStringAsFixed(0)),
      InfoField(label: 'Thành tiền mua', value: item.totalPricePurchase?.toStringAsFixed(0)),
      InfoField(label: 'Loại tiền', value: item.currencyPurchase),
      InfoField(label: 'Tỷ giá', value: item.currencyRatePurchase?.toStringAsFixed(0)),
      InfoField(label: 'Thành tiền quy đổi', value: item.totalPriceExchangePurchase?.toStringAsFixed(0)),

      const InfoSectionHeader('Nhà cung cấp'),
      InfoField(label: 'NCC mua', value: item.supplierNamePurchase),
      InfoField(label: 'LeadTime mua', value: item.leadTimePurchase),
      InfoField(label: 'Người yêu cầu mua', value: item.fullNameRequestPurchase),
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
