// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình thêm/bỏ favorites - hiển thị danh sách items, filter theo tab, tìm kiếm, toggle yêu thích

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/widgets/fav_item_list.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/widgets/fav_catalog_drawer.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/widgets/fav_tab_drawer.dart';

import '../../../../../../common/app_registry/app_items_registry.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/models/index.dart';
import '../../data/datasource/service/favorites_service.dart';
import '../model/favorite_tabs.dart';

/// Màn hình thêm hoặc bỏ items khỏi favorites.
///
/// Hiển thị danh sách items theo tab (Tất cả, Đơn từ, Tổng hợp, Chung, Tuần, Báo cáo, Biểu mẫu).
/// Hỗ trợ tìm kiếm theo tên và toggle trạng thái yêu thích.
/// Items giữ nguyên vị trí khi chọn/bỏ chọn.
/// Số lượng favorites hiển thị trên title.
class FavoritesAddingScreen extends StatefulWidget {
  const FavoritesAddingScreen({super.key});

  @override
  State<FavoritesAddingScreen> createState() => _FavoritesAddingScreenState();
}

class _FavoritesAddingScreenState extends State<FavoritesAddingScreen> {
  late Set<String> _favoriteIds;
  String _searchQuery = '';
  bool _isSearchVisible = false;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _favoriteIds = FavoriteService.loadIdSet();
    _searchController = TextEditingController(text: _searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Toggle trạng thái yêu thích của một item.
  void _toggleFavorite(AppItemModel item) async {
    await FavoriteService.toggle(item);

    setState(() {
      _favoriteIds.contains(item.id)
          ? _favoriteIds.remove(item.id)
          : _favoriteIds.add(item.id);
    });
  }

  /// Cập nhật từ khóa tìm kiếm.
  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value.trim().toLowerCase();
    });
  }

  /// Toggle hiển thị ô tìm kiếm trên màn hình.
  void _toggleSearchField() {
    setState(() {
      if (_isSearchVisible) {
        _isSearchVisible = false;
        _searchQuery = '';
        _searchController.clear();
      } else {
        _isSearchVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = FavoriteTabs.values;

    final applicationItems = AppItemRegistry.all;

    return DefaultTabController(
      length: tabs.length,
      child: BaseScaffold(
        endDrawerEnableOpenDragGesture: false,
        endDrawer: const FavCatalogDrawer(),
        appBar: AppBarCommon(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'favorites.title'.tr(),
                style: AppStyles.headingTitle2,
              ),
              const SizedBox(height: 2),
              Text(
                '${'favorites.added'.tr()}(${_favoriteIds.length})',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                _isSearchVisible || _searchQuery.isNotEmpty
                    ? Icons.close_outlined
                    : Icons.search_outlined,
              ),
              onPressed: _toggleSearchField,
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Column(
          children: [
            if (_isSearchVisible) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Nhập tên mục...',
                    prefixIcon: const Icon(Icons.search_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onChanged: _onSearchChanged,
                ),
              ),
            ],
            FavTabDrawer(tabs: tabs),
            Expanded(
              child: TabBarView(
                children: tabs.map(
                      (tab) => FavItemList(
                    items: applicationItems,
                    currentTab: tab,
                    favoriteIds: _favoriteIds,
                    onToggle: _toggleFavorite,
                    searchQuery: _searchQuery,
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
