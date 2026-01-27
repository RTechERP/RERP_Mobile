import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../common/app_registry/app_items_registry.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/utils/dialog/index.dart';
import '../../../../view/widgets/action_group_card.dart';
class RegWorkScreenPage extends StatelessWidget {
  const RegWorkScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = AppItemRegistry.regwork;

    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'applications.reg_work'.tr(),
          style: AppStyles.headingTitle2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                ActionGroupCard(
                  title: 'applications.reg_work'.tr(),
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
