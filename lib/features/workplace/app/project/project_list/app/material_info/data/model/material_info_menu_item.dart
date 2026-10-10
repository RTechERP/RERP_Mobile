import 'package:flutter/material.dart';

/// 1 mục trong bottom sheet "Thông tin vật tư" — đại diện cho 1 chức năng
/// nghiệp vụ gắn với 1 phiếu vật tư (xem chi tiết, yêu cầu báo giá, mua hàng…).
class MaterialInfoMenuItem {
  const MaterialInfoMenuItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.children = const [],
  });

  /// Khóa tra cứu duy nhất (vd: 'detail', 'quote', 'purchase', 'import', 'stock').
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  /// Nhóm thao tác con (chỉ dùng cho menu bulk: báo giá, TBP, xuất kho, chuyển kho).
  /// Rỗng → hiển thị phẳng trong grid như [menuItems].
  final List<MaterialInfoMenuItem> children;

  /// 5 mục menu hiển thị khi user tap vào body của 1 phiếu vật tư.
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

  /// 5 kho, dùng chung cho xuất kho và chuyển kho.
  static const List<MaterialInfoMenuItem> _warehouses = [
    MaterialInfoMenuItem(
      id: 'hn',
      name: 'Hà Nội',
      icon: Icons.location_city_outlined,
      color: Color(0xFFE65100),
    ),
    MaterialInfoMenuItem(
      id: 'hcm',
      name: 'HCM',
      icon: Icons.apartment_rounded,
      color: Color(0xFFE65100),
    ),
    MaterialInfoMenuItem(
      id: 'bacninh',
      name: 'Bắc Ninh',
      icon: Icons.factory_outlined,
      color: Color(0xFFE65100),
    ),
    MaterialInfoMenuItem(
      id: 'haiphong',
      name: 'Hải Phòng',
      icon: Icons.anchor_rounded,
      color: Color(0xFFE65100),
    ),
    MaterialInfoMenuItem(
      id: 'danphuong',
      name: 'Đan Phượng',
      icon: Icons.agriculture_outlined,
      color: Color(0xFFE65100),
    ),
  ];

  /// 4 nhóm thao tác bulk hiển thị khi user chọn ≥1 phiếu rồi bấm "Thao tác".
  /// Mỗi nhóm mở 1 sheet con với các lựa chọn con bên dưới.
  static const List<MaterialInfoMenuItem> bulkMenuItems = [
    MaterialInfoMenuItem(
      id: 'bulk.quote',
      name: 'Yêu cầu báo giá',
      icon: Icons.request_quote_outlined,
      color: Color(0xFFFB8C00),
      children: [
        MaterialInfoMenuItem(
          id: 'bulk.quote.create',
          name: 'Báo giá',
          icon: Icons.add_circle_outline,
          color: Color(0xFFFB8C00),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.quote.cancel',
          name: 'Huỷ báo giá',
          icon: Icons.cancel_outlined,
          color: Color(0xFFD84315),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.quote.re_quote',
          name: 'Báo giá lại',
          icon: Icons.replay_outlined,
          color: Color(0xFFFB8C00),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.quote.cancel_re_quote',
          name: 'Huỷ báo giá lại',
          icon: Icons.block_outlined,
          color: Color(0xFFD84315),
        ),
      ],
    ),
    MaterialInfoMenuItem(
      id: 'bulk.tbp',
      name: 'TBP',
      icon: Icons.fact_check_outlined,
      color: Color(0xFF7B1FA2),
      children: [
        MaterialInfoMenuItem(
          id: 'bulk.tbp.approve',
          name: 'Duyệt mới',
          icon: Icons.thumb_up_outlined,
          color: Color(0xFF7B1FA2),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.tbp.cancel_approve',
          name: 'Huỷ duyệt mới',
          icon: Icons.thumb_down_outlined,
          color: Color(0xFFC62828),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.tbp.approve_stock',
          name: 'Duyệt tích xanh',
          icon: Icons.eco_outlined,
          color: Color(0xFF2E7D32),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.tbp.cancel_approve_stock',
          name: 'Huỷ duyệt tích xanh',
          icon: Icons.dangerous_outlined,
          color: Color(0xFFC62828),
        ),
      ],
    ),
    MaterialInfoMenuItem(
      id: 'bulk.export',
      name: 'Yêu cầu xuất kho',
      icon: Icons.outbox_outlined,
      color: Color(0xFFE65100),
      children: _warehouses,
    ),
    MaterialInfoMenuItem(
      id: 'bulk.transfer',
      name: 'Yêu cầu chuyển kho',
      icon: Icons.swap_horiz_rounded,
      color: Color(0xFF2E7D32),
      children: [
        MaterialInfoMenuItem(
          id: 'bulk.transfer.hn',
          name: 'Hà Nội',
          icon: Icons.location_city_outlined,
          color: Color(0xFFE65100),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.transfer.hcm',
          name: 'HCM',
          icon: Icons.apartment_rounded,
          color: Color(0xFFE65100),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.transfer.bacninh',
          name: 'Bắc Ninh',
          icon: Icons.factory_outlined,
          color: Color(0xFFE65100),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.transfer.haiphong',
          name: 'Hải Phòng',
          icon: Icons.anchor_rounded,
          color: Color(0xFFE65100),
        ),
        MaterialInfoMenuItem(
          id: 'bulk.transfer.danphuong',
          name: 'Đan Phượng',
          icon: Icons.agriculture_outlined,
          color: Color(0xFFE65100),
        ),
      ],
    ),
  ];
}
