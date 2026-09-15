import 'package:flutter/material.dart';

import '../../../material_category/data/datasource/model/material_category_model.dart';
import 'info_detail_sheet.dart';

/// Field số dùng cho popup Tồn kho: value đậm, to hơn field text thường.
class _StockNumberField extends StatelessWidget {
  const _StockNumberField({required this.label, required this.value});

  final String label;
  final int? value;

  @override
  Widget build(BuildContext context) {
    final display = value?.toString() ?? '--';
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

/// Popup chi tiết "Tồn kho" — 5 trường số theo 5 chi nhánh kho.
class StockBalanceDetailSheet {
  StockBalanceDetailSheet._();

  static Future<void> show(BuildContext context, MaterialCategoryItem item) {
    return InfoDetailSheet.show(
      context,
      title: 'Tồn kho',
      icon: Icons.warehouse_outlined,
      iconColor: const Color(0xFFE53935),
      subtitle: '${item.code} · ${item.name}',
      children: _buildFields(item),
    );
  }

  static List<Widget> _buildFields(MaterialCategoryItem item) {
    final s = MockStock.forItem(item);

    return [
      const InfoSectionHeader('Tồn theo kho'),
      _StockNumberField(label: 'Hà Nội', value: s.hanoi),
      _StockNumberField(label: 'Hồ Chí Minh', value: s.hcm),
      _StockNumberField(label: 'Đan Phượng', value: s.danPhuong),
      _StockNumberField(label: 'Hải Phòng', value: s.haiPhong),
      _StockNumberField(label: 'Bắc Ninh', value: s.bacNinh),
    ];
  }
}

class MockStock {
  MockStock({
    required this.hanoi,
    required this.hcm,
    required this.danPhuong,
    required this.haiPhong,
    required this.bacNinh,
  });

  final int? hanoi;
  final int? hcm;
  final int? danPhuong;
  final int? haiPhong;
  final int? bacNinh;

  static MockStock forItem(MaterialCategoryItem item) {
    final seed = item.id;

    /// Sinh số tồn deterministic từ seed, có thể null theo xác suất 1/4
    /// để minh họa field rỗng (hiển thị '--').
    int? pickInt(int mod, int max) {
      if ((seed + mod * 5) % 4 == 0) return null;
      return ((seed * 17 + mod * 31) % max) + 1;
    }

    return MockStock(
      hanoi: pickInt(1, 1500),
      hcm: pickInt(2, 2000),
      danPhuong: pickInt(3, 800),
      haiPhong: pickInt(4, 600),
      bacNinh: pickInt(5, 400),
    );
  }
}
