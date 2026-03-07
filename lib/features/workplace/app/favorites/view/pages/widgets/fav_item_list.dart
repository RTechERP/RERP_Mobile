import 'package:flutter/material.dart';
import '../../../../../../../common/models/index.dart';

import '../../../data/datasource/service/favorites_service.dart';
import '../../model/favorite_tabs.dart';
import 'fav_item_row.dart';

class FavItemList extends StatelessWidget {
  final List<AppItemModel> items;
  final AppTab currentTab;
  final Set<String> favoriteIds;
  final ValueChanged<AppItemModel> onToggle;

  const FavItemList({
    super.key,
    required this.items,
    required this.currentTab,
    required this.favoriteIds,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final sorted = FavoriteService.loadSorted(items);


    final filtered = currentTab == AppTab.all
        ? sorted
        : sorted.where((e) => e.tab == currentTab.key).toList();
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = filtered[index];
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
