import 'package:flutter/material.dart';

/// 1 mục trong bottom sheet "Thông tin vật tư" — đại diện cho 1 chức năng
/// nghiệp vụ gắn với 1 phiếu vật tư (xem chi tiết, yêu cầu báo giá, mua hàng…).
class MaterialInfoMenuItem {
  const MaterialInfoMenuItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  /// Khóa tra cứu duy nhất (vd: 'detail', 'quote', 'purchase', 'import', 'stock').
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  /// Danh sách menu hiển thị khi tap vào 1 phiếu vật tư.
  /// Cố định cho mọi phiếu (không phụ thuộc node cha/con).
  static const List<MaterialInfoMenuItem> menuItems = [
    MaterialInfoMenuItem(
      id: 'detail',
      name: 'Thông tin vật tư',
      icon: Icons.info_outline,
      color: Color(0xFF1E88E5),
    ),
    MaterialInfoMenuItem(
      id: 'quote',
      name: 'Yêu cầu báo giá',
      icon: Icons.request_quote_outlined,
      color: Color(0xFFFB8C00),
    ),
    MaterialInfoMenuItem(
      id: 'purchase',
      name: 'Yêu cầu mua hàng',
      icon: Icons.shopping_cart_outlined,
      color: Color(0xFF8E24AA),
    ),
    MaterialInfoMenuItem(
      id: 'import',
      name: 'Nhập kho',
      icon: Icons.inventory_2_outlined,
      color: Color(0xFF43A047),
    ),
    MaterialInfoMenuItem(
      id: 'stock',
      name: 'Tồn kho',
      icon: Icons.warehouse_outlined,
      color: Color(0xFFE53935),
    ),
  ];
}
