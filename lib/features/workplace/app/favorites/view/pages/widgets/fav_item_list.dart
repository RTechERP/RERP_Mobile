// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Widget hiển thị danh sách items theo tab - lọc, sắp xếp, tìm kiếm

import 'package:flutter/material.dart';
import '../../../../../../../common/models/index.dart';

import '../../../data/datasource/service/favorites_service.dart';
import '../../model/favorite_tabs.dart';
import 'fav_item_row.dart';

/// Widget hiển thị danh sách items theo tab hiện tại.
///
/// - Filter items theo tab (hoặc hiển thị tất cả nếu là [AppTab.all]).
/// - Tìm kiếm theo tên item.
/// - Items giữ nguyên vị trí khi chọn/bỏ chọn, chỉ checkbox thay đổi.
class FavItemList extends StatelessWidget {
  final List<AppItemModel> items;
  final AppTab currentTab;
  final Set<String> favoriteIds;
  final ValueChanged<AppItemModel> onToggle;
  final String searchQuery;

  const FavItemList({
    super.key,
    required this.items,
    required this.currentTab,
    required this.favoriteIds,
    required this.onToggle,
    this.searchQuery = '',
  });

  @override
  Widget build(BuildContext context) {
    final sorted = FavoriteService.loadSorted(items);

    final filtered = currentTab.filterTabName == null
        ? sorted
        : sorted.where((e) => e.tab == currentTab.filterTabName).toList();

    // Lọc theo từ khóa tìm kiếm.
    final queried = searchQuery.isEmpty
        ? filtered
        : filtered
            .where((e) => e.name.toLowerCase().contains(searchQuery))
            .toList();

    // Giữ nguyên vị trí items khi chọn/bỏ chọn.
    // Chỉ thay đổi trạng thái hiển thị (checkbox), không reorder.
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: queried.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = queried[index];
        final isFavorite = favoriteIds.contains(item.id);

        return FavItemRow(
          item: item,
          isFavorite: isFavorite,
          onFavoriteChanged: (_) => onToggle(item),
        );
      },
    );
  }
}
