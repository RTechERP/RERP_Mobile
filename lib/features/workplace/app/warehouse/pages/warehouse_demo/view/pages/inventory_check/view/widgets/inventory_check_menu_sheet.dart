import 'package:flutter/material.dart';

import 'package:rtc_erp/common/app_theme/index.dart';

/// 1 mục trong menu thao tác của đợt kiểm kê (chi tiết, chỉnh sửa, xoá).
class InventoryCheckMenuItem {
  const InventoryCheckMenuItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  /// Khóa tra cứu duy nhất (vd: 'detail', 'edit', 'delete').
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  /// Thao tác xem chi tiết đợt kiểm kê.
  static const InventoryCheckMenuItem detail = InventoryCheckMenuItem(
    id: 'detail',
    name: 'Chi tiết',
    icon: Icons.info_outline,
    color: Color(0xFF1E88E5),
  );

  /// Thao tác chỉnh sửa đợt kiểm kê.
  static const InventoryCheckMenuItem edit = InventoryCheckMenuItem(
    id: 'edit',
    name: 'Chỉnh sửa',
    icon: Icons.edit_outlined,
    color: Color(0xFFFB8C00),
  );

  /// Thao tác xoá đợt kiểm kê.
  static const InventoryCheckMenuItem delete = InventoryCheckMenuItem(
    id: 'delete',
    name: 'Xoá',
    icon: Icons.delete_outline,
    color: Color(0xFFE53935),
  );

  /// Danh sách thao tác mặc định của đợt kiểm kê.
  static const List<InventoryCheckMenuItem> menuItems = [detail, edit, delete];
}

/// Bottom sheet hiển thị menu thao tác của một đợt kiểm kê.
///
/// Mở khi người dùng bấm vào card trong danh sách. Trả về `id` của thao tác
/// được chọn, `null` nếu đóng sheet mà không chọn.
class InventoryCheckMenuSheet extends StatelessWidget {
  const InventoryCheckMenuSheet({
    super.key,
    required this.menuItems,
    this.countCode,
  });

  /// Danh sách thao tác hiển thị.
  final List<InventoryCheckMenuItem> menuItems;

  /// Mã đợt kiểm kê hiển thị ở header (có thể null).
  final String? countCode;

  /// Mở bottom sheet menu. Trả về id thao tác được chọn hoặc null.
  static Future<String?> show(
    BuildContext context, {
    String? countCode,
    List<InventoryCheckMenuItem>? menuItems,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => InventoryCheckMenuSheet(
        countCode: countCode,
        menuItems: menuItems ?? InventoryCheckMenuItem.menuItems,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final code = (countCode ?? '').trim();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header: icon + mã đợt kiểm kê
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.assignment_outlined,
                    color: AppColors.primaryERP,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    code.isEmpty ? 'Thao tác đợt kiểm kê' : code,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.enableText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppColors.gray),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Grid menu thao tác
          Flexible(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                // 3 mục thao tác nên dùng 3 cột cho gọn, không bị to.
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final menu = menuItems[index];
                return _MenuTile(
                  menu: menu,
                  onTap: () => Navigator.pop(context, menu.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Một ô menu trong grid.
class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.menu, required this.onTap});

  final InventoryCheckMenuItem menu;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: menu.color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: menu.color.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: menu.color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(menu.icon, color: menu.color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                menu.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.enableText,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
