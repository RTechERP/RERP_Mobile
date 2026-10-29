import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/utils/dialog/index.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../routes/route_names.dart';
import '../../../../data/datasource/models/index.dart';
import '../../../../view/widgets/wp_action_card.dart';

/// Màn hình menu CRM — lớp menu trung gian trong flow CRM.
///
/// Flow: workspace → "CRM" (màn này) → chọn "Tổng hợp khách hàng" →
/// màn [SummaryCustomerScreen].
///
/// Menu hiện chỉ có 1 mục, nhưng được thiết kế dạng grid để mở rộng thêm
/// các chức năng CRM về sau mà không phải đổi cấu trúc màn hình.
class CrmMenuScreen extends StatelessWidget {
  const CrmMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('applications.crm'.tr(), style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: WpActionCard(
              title: 'crm.menu'.tr(),
              expandable: true,
              collapsedItemCount: 11,
              items: _menuItems,
              onItemTap: (item) {
                final route = item.route;
                if (route == null || route.isEmpty) {
                  DialogService.showProcessing(context: context);
                  return;
                }
                context.push(route);
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Danh sách chức năng CRM hiển thị trong menu.
  List<AppItemModel> get _menuItems => [
    AppItemModel(
      id: 'crm:summary_customer',
      name: 'crm.summary_customer'.tr(),
      iconCodePoint: Icons.people_alt_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'crm',
      route: '${RouteNames.crmMenu}/${RouteNames.crmSummaryCustomer}',
    ),
    AppItemModel(
      id: 'crm:lead_marketing',
      name: 'crm.lead_marketing'.tr(),
      iconCodePoint: Icons.campaign_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'crm',
      route: '${RouteNames.crmMenu}/${RouteNames.crmLeadMarketing}',
    ),
  ];
}
