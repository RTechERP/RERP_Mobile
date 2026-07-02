import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/utils/dialog/index.dart';
import '../../../../data/datasource/app_registry/app_items_registry.dart';
import '../../../../view/widgets/wp_action_card.dart';
class RegGeneralScreen extends StatelessWidget {
  const RegGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = AppItemRegistry.reggeneral;

    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'applications.reg_general'.tr(),
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
                  title: 'applications.reg_general'.tr(),
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
