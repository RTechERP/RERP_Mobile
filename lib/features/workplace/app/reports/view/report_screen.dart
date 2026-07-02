import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../common/app_theme/index.dart';
import '../../../../../common/services/permissions/permission_service.dart';
import '../../../../../common/utils/dialog/index.dart';
import '../../../data/datasource/app_registry/app_items_registry.dart';
import '../../../view/widgets/wp_action_card.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rawItems = AppItemRegistry.reports;

    /// RBAC áp dụng tại đây
    final items = PermissionService.mapItems(rawItems);

    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'report.report_work'.tr(),
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
                  title: 'applications.report'.tr(),
                  expandable: true,
                  collapsedItemCount: 11,
                  items: items,
                  onItemTap: (item) {

                    /// 🚫 Chặn nếu không có quyền
                    if (!item.enabled) return;

                    /// HR
                    if (item.type == 'hr') {
                      DialogService.showSelectHr(context: context);
                      return;
                    }

                    /// Sale
                    if (item.type == 'sale') {
                      DialogService.showSelectSale(context: context);
                      return;
                    }

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
