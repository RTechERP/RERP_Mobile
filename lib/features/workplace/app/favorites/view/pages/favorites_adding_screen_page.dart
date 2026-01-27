import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/widgets/app_item_list.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/widgets/catalog_drawer.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/widgets/tab_with_drawer_row.dart';


import '../../../../../../common/app_registry/app_items_registry.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/models/index.dart';
import '../../data/datasource/service/favorites_service.dart';
import '../model/favorite_tabs.dart';

class FavoritesAddingScreen extends StatefulWidget {
  const FavoritesAddingScreen({super.key});

  @override
  State<FavoritesAddingScreen> createState() => _FavoritesAddingScreenState();
}

class _FavoritesAddingScreenState extends State<FavoritesAddingScreen> {
  late Set<String> _favoriteIds;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favoriteIds = FavoriteService.loadIdSet();
  }
  void _toggleFavorite(AppItemModel item) async {
    await FavoriteService.toggle(item);

    setState(() {
      _favoriteIds.contains(item.id)
          ? _favoriteIds.remove(item.id)
          : _favoriteIds.add(item.id);
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
        endDrawer: const CatalogDrawer(),
        appBar: AppBarCommon(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'favorites.title'.tr(),
                  style: AppStyles.headingTitle2,
                ),
                SizedBox(height: 2),
                Text(
                  '${'favorites.added'.tr()}(${_favoriteIds.length})',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          actions: const [
                Icon(Icons.search_outlined),
                SizedBox(width: 8),
          ]
        ),
        body: Column(
          children: [
            TabWithDrawerRow(tabs: tabs),
            Expanded(
              child: TabBarView(
                children: tabs.map(
                      (tab) => AppItemList(
                    items: applicationItems,
                    currentTab: tab,
                    favoriteIds: _favoriteIds,
                    onToggle: _toggleFavorite,
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


