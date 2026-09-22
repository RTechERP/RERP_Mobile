import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../material_category/data/datasource/model/part_list_model.dart';
import '../../data/model/material_info_menu_item.dart';

/// Bottom sheet hiển thị menu "Thông tin vật tư" khi tap vào 1 phiếu vật tư.
///
/// Tap vào 1 mục sẽ đóng sheet; logic điều hướng chi tiết để router xử lý sau.
class MaterialInfoMenuSheet extends StatelessWidget {
  const MaterialInfoMenuSheet({
    super.key,
    required this.partListItem,
  });

  final PartListModel partListItem;

  /// Mở bottom sheet menu. Trả về id của menu được chọn (vd 'detail', 'quote'),
  /// hoặc null nếu đóng bằng cách khác (tap backdrop, nút close, back...).
  static Future<String?> show(
    BuildContext context, {
    required PartListModel partListItem,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MaterialInfoMenuSheet(partListItem: partListItem),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = (partListItem.groupMaterial ?? '').isNotEmpty
        ? partListItem.groupMaterial!
        : 'Vật tư';
    final code = (partListItem.productCode ?? '').isNotEmpty
        ? partListItem.productCode!
        : '--';
    final maker = (partListItem.manufacturer ?? '').isNotEmpty
        ? partListItem.manufacturer!
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
          // Header: icon + tên phiếu + mã + close
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
                    Icons.inventory_2_outlined,
                    color: AppColors.primaryERP,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
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
          // Grid menu
          Flexible(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemCount: MaterialInfoMenuItem.menuItems.length,
              itemBuilder: (context, index) {
                final menu = MaterialInfoMenuItem.menuItems[index];
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
