import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/common/app_theme/app_bar_common.dart';

import '../../../../../base/widgets/base_scaffold.dart';
import '../../../../../common/app_theme/index.dart';
import '../../../../../common/utils/dialog/index.dart';
import '../../../data/datasource/app_registry/app_items_registry.dart';
import '../../../view/widgets/wp_action_card.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({super.key});

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  @override
  Widget build(BuildContext context) {
    final items = AppItemRegistry.warehouse;

    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'applications.warehouse'.tr(),
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
                  title: 'warehouse.list'.tr(),
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
