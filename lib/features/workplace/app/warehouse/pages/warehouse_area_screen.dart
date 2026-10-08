import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../base/widgets/base_scaffold.dart';
import '../../../../../common/app_theme/index.dart';
import '../../../data/datasource/app_registry/app_items_registry.dart';
import '../../../view/widgets/wp_action_card.dart';
import '../enums/warehouse_type.dart';

class WarehouseAreaScreen extends StatefulWidget {
  final WarehouseType warehouseType;

  const WarehouseAreaScreen({
    super.key,
    required this.warehouseType,
  });

  @override
  State<WarehouseAreaScreen> createState() => _WarehouseAreaScreenState();
}

class _WarehouseAreaScreenState extends State<WarehouseAreaScreen> {
  List<String> get _allowedAreaIds {
    switch (widget.warehouseType) {
      case WarehouseType.sale:
      case WarehouseType.demo:
        return ['warehouse_area:ha_noi', 'warehouse_area:ho_chi_minh', 'warehouse_area:bac_ninh'];
      case WarehouseType.agv:
        return ['warehouse_area:ha_noi'];
      case WarehouseType.project:
      case WarehouseType.test:
        return ['warehouse_area:dan_phuong'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final allItems = AppItemRegistry.warehouse_area;
    final filteredItems = allItems
        .where((item) => _allowedAreaIds.contains(item.id))
        .toList();

    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          widget.warehouseType.titleKey,
          style: AppStyles.headingTitle2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                WpActionCard(
                  title: 'warehouse.area'.tr(),
                  expandable: true,
                  collapsedItemCount: filteredItems.length,
                  items: filteredItems,
                  onItemTap: (item) {
                    context.push(
                      widget.warehouseType.routeName,
                      extra: {
                        'areaId': item.id,
                        'areaName': item.name,
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
