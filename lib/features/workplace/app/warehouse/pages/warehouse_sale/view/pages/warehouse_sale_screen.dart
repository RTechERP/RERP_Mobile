import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/features/workplace/data/datasource/app_registry/app_items_registry.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../view/widgets/wp_action_card.dart';

class WarehouseSaleScreen extends StatelessWidget {
  final String areaId;
  final String areaName;

  const WarehouseSaleScreen({
    super.key,
    required this.areaId,
    required this.areaName,
  });

  String get title => '${'warehouse.sale'.tr()} - $areaName';

  @override
  Widget build(BuildContext context) {
    final items = AppItemRegistry.warehouse_sale;
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          title,
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
                  title: 'warehouse.sale'.tr(),
                  expandable: true,
                  collapsedItemCount: 11,
                  items: items,
                  onItemTap: (item) {
                    if (item.route != null) {
                      context.push(item.route!);
                    }
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
