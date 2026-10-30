import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';

/// 1 mục trong menu thao tác của phiếu lead (xem chi tiết, xoá...).
class LeadMenuItem {
  const LeadMenuItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  /// Khóa tra cứu duy nhất (vd: 'detail', 'delete').
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  /// Thao tác xem chi tiết phiếu lead.
  static const LeadMenuItem detail = LeadMenuItem(
    id: 'detail',
    name: 'Chi tiết phiếu',
    icon: Icons.info_outline,
    color: Color(0xFF1E88E5),
  );

  /// Thao tác chỉnh sửa phiếu lead.
  static const LeadMenuItem edit = LeadMenuItem(
    id: 'edit',
    name: 'Chỉnh sửa',
    icon: Icons.edit_outlined,
    color: Color(0xFFFB8C00),
  );

  /// Thao tác ghi hoạt động lên phiếu lead.
  static const LeadMenuItem activity = LeadMenuItem(
    id: 'activity',
    name: 'Ghi hoạt động',
    icon: Icons.history_toggle_off_outlined,
    color: Color(0xFF8E24AA),
  );

  /// Thao tác xác nhận TT không phù hợp — loại bỏ lead.
  static const LeadMenuItem disqualify = LeadMenuItem(
    id: 'disqualify',
    name: 'TT không phù hợp',
    icon: Icons.block_outlined,
    color: Color(0xFFED3A3A),
  );

  /// Thao tác huỷ xác nhận TT không phù hợp — mở lại lead.
  static const LeadMenuItem reopen = LeadMenuItem(
    id: 'reopen',
    name: 'Huỷ TT không phù hợp',
    icon: Icons.lock_open_outlined,
    color: Color(0xFF33B469),
  );

  /// Thao tác xoá phiếu lead.
  static const LeadMenuItem delete = LeadMenuItem(
    id: 'delete',
    name: 'Xoá phiếu',
    icon: Icons.delete_outline,
    color: Color(0xFFE53935),
  );

  /// Danh sách thao tác mặc định của phiếu lead.
  static const List<LeadMenuItem> menuItems = [
    detail,
    edit,
    activity,
    disqualify,
    reopen,
    delete,
  ];
}

/// Bottom sheet hiển thị menu thao tác của một phiếu lead.
///
/// Mở khi người dùng bấm vào card trong danh sách. Trả về `id` của thao tác
/// được chọn, `null` nếu đóng sheet mà không chọn.
class LeadMenuSheet extends StatelessWidget {
  const LeadMenuSheet({
    super.key,
    required this.menuItems,
    this.leadCode,
  });

  /// Danh sách thao tác hiển thị.
  final List<LeadMenuItem> menuItems;

  /// Mã phiếu lead hiển thị ở header (có thể null).
  final String? leadCode;

  /// Mở bottom sheet menu. Trả về id thao tác được chọn hoặc null.
  static Future<String?> show(
    BuildContext context, {
    String? leadCode,
    List<LeadMenuItem>? menuItems,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LeadMenuSheet(
        leadCode: leadCode,
        menuItems: menuItems ?? LeadMenuItem.menuItems,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final code = (leadCode ?? '').trim();

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
          // Header: icon + mã phiếu lead
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
                    code.isEmpty ? 'Thao tác phiếu lead' : code,
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // Từ 3 mục trở lên dùng 3 cột để ô menu gọn, không bị to
                // như màn vật tư.
                crossAxisCount: menuItems.length >= 3 ? 3 : 2,
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

  final LeadMenuItem menu;
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
