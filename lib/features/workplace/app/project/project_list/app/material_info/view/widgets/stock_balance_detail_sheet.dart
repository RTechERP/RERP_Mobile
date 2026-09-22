import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/part_list_model.dart';
import 'info_detail_sheet.dart';

/// Field số dùng cho popup Tồn kho: value đậm, to hơn field text thường.
class _StockNumberField extends StatelessWidget {
  const _StockNumberField({required this.label, required this.value});

  final String label;
  final double? value;

  @override
  Widget build(BuildContext context) {
    final display = value != null ? value!.toStringAsFixed(0) : '--';
    final color = value == null
        ? const Color(0xFF94A3B8)
        : const Color(0xFF1E88E5);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                display,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Popup chi tiết "Tồn kho" — hiển thị dữ liệu từ PartListModel.
class StockBalanceDetailSheet {
  StockBalanceDetailSheet._();

  static Future<void> show(BuildContext context, {required PartListModel partListItem}) {
    return InfoDetailSheet.show(
      context,
      title: 'Tồn kho',
      icon: Icons.warehouse_outlined,
      iconColor: const Color(0xFFE53935),
      subtitle: '${partListItem.productCode ?? '--'} · ${partListItem.groupMaterial ?? 'Vật tư'}',
      children: _buildFields(partListItem),
    );
  }

  static List<Widget> _buildFields(PartListModel item) {
    return [
      const InfoSectionHeader('Tồn theo kho'),
      _StockNumberField(label: 'Hà Nội', value: item.totalHn),
      _StockNumberField(label: 'Hồ Chí Minh', value: item.totalHcm),
      _StockNumberField(label: 'Đan Phượng', value: item.totalDp),
      _StockNumberField(label: 'Hải Phòng', value: item.totalHp),
      _StockNumberField(label: 'Bắc Ninh', value: item.totalBn),
      _StockNumberField(label: 'Bắc Hà', value: item.totalBh),
      const Divider(height: 24),
      _StockNumberField(label: 'Tổng tồn', value: item.totalExport),
    ];
  }
}
