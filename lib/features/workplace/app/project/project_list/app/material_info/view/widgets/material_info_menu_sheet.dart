import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../material_category/data/datasource/model/part_list_model.dart';
import '../../data/model/material_info_menu_item.dart';

/// Bottom sheet hiển thị menu chức năng của vật tư.
///
/// Cùng 1 widget dùng cho 2 ngữ cảnh:
/// - Tap body card (có [partListItem]): hiện header tên - mã - hãng + 5 mục
///   [MaterialInfoMenuItem.menuItems].
/// - Tap dấu tròn chọn phiếu (không truyền [partListItem]): chỉ hiện 4 mục
///   [MaterialInfoMenuItem.bulkMenuItems], không có header.
class MaterialInfoMenuSheet extends StatelessWidget {
  const MaterialInfoMenuSheet({
    super.key,
    required this.menuItems,
    this.partListItem,
    this.title,
  });

  /// Vật tư đại diện cho header. `null` → bỏ qua header, chỉ hiện lưới menu.
  final PartListModel? partListItem;
  final List<MaterialInfoMenuItem> menuItems;

  /// Tiêu đề hiển thị khi [partListItem] là null (sheet con 1 cấp).
  final String? title;

  /// Mở bottom sheet menu. Trả về id của menu được chọn (vd 'detail', 'quote'),
  /// hoặc null nếu đóng bằng cách khác (tap backdrop, nút close, back...).
  ///
  /// Bỏ [partListItem] để hiện sheet không header (dùng cho thao tác bulk).
  static Future<String?> show(
    BuildContext context, {
    PartListModel? partListItem,
    List<MaterialInfoMenuItem>? menuItems,
    String? title,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MaterialInfoMenuSheet(
        partListItem: partListItem,
        menuItems: menuItems ?? MaterialInfoMenuItem.menuItems,
        title: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = partListItem;
    final name = (item?.groupMaterial ?? '').isNotEmpty
        ? item!.groupMaterial!
        : 'Vật tư';
    final code = (item?.productCode ?? '').isNotEmpty
        ? item!.productCode!
        : '--';
    final maker = (item?.manufacturer ?? '').isNotEmpty
        ? item!.manufacturer!
        : '--';

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
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
          // Header: icon + tên phiếu + mã (khi có vật tư),
          // hoặc tiêu đề nhóm (khi mở sheet con 1 cấp).
          if (partListItem != null || title != null) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
              child: Row(
                children: [
                  if (title == null)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryERP.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.inventory_2_outlined,
                        color: AppColors.primaryERP,
                        size: 20,
                      ),
                    ),
                  if (title == null) const SizedBox(width: 12),
                  Expanded(
                    child: title != null
                        ? Text(
                            title!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.enableText,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.enableText,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '$code · $maker',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.gray,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
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
          ],
          // Grid menu — 4 mục dùng 2 cột, 5 mục dùng 3 cột cho vừa khung.
          Flexible(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: menuItems.length > 4 ? 3 : 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final menu = menuItems[index];
                return _MenuTile(
                  menu: menu,
                  onTap: () async {
                    // Có nhóm con → mở sheet con bằng await để nhận id khi
                    // user chọn xong; bỏ qua nếu user đóng sheet con rỗng.
                    if (menu.children.isNotEmpty) {
                      final childId = await MaterialInfoMenuSheet.show(
                        context,
                        title: menu.name,
                        menuItems: menu.children,
                      );
                      if (childId != null && context.mounted) {
                        Navigator.pop(context, childId);
                      }
                      return;
                    }
                    Navigator.pop(context, menu.id);
                  },
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

  final MaterialInfoMenuItem menu;
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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: menu.color.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(menu.icon, color: menu.color, size: 24),
                  ),
                  if (menu.children.isNotEmpty)
                    Positioned(
                      right: -2,
                      bottom: -2,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: menu.color,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          size: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
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
