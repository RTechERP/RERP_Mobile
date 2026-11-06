import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../view/widgets/wp_action_card.dart';
import '../../../../../../data/datasource/app_registry/app_items_registry.dart';

class WarehouseDemoScreen extends StatelessWidget {
  final String areaId;
  final String areaName;

  const WarehouseDemoScreen({
    super.key,
    required this.areaId,
    required this.areaName,
  });

  String get title => '${'warehouse.demo'.tr()} - $areaName';

  @override
  Widget build(BuildContext context) {
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
                  title: 'warehouse.function'.tr(),
                  expandable: true,
                  collapsedItemCount: 11,
                  items: AppItemRegistry.warehouse_demo,
                  onItemTap: (item) {
                    if (item.route != null && item.route!.isNotEmpty) {
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
