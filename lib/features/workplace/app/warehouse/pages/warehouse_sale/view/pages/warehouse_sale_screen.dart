import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../data/datasource/app_registry/app_items_registry.dart';
import '../../../../../../view/widgets/wp_action_card.dart';
class WarehouseSaleScreen extends StatefulWidget {
  const WarehouseSaleScreen({super.key});

  @override
  State<WarehouseSaleScreen> createState() => _WarehouseSaleScreenState();
}

class _WarehouseSaleScreenState extends State<WarehouseSaleScreen> {
  @override
  Widget build(BuildContext context) {
    final items = AppItemRegistry.warehouse_area;
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'warehouse.area'.tr(),
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
                  title: 'warehouse_sale.function'.tr(),
                  expandable: true,
                  collapsedItemCount: 11,
                  items: items,
                  onItemTap: (item) {
                    final route = item.route;
                    if (route == null || route.isEmpty) {
                      DialogService.showProcessing(context: context);
                      return;
                    }
                    context.push(route);
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
