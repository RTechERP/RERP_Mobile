import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/services/permissions/role_groups.dart';
import '../../../../../../common/utils/dialog/index.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../routes/route_names.dart';
import '../../../../../auth/data/repository/auth_repository.dart';
import '../../../../data/datasource/models/index.dart';
import '../../../../view/widgets/wp_action_card.dart';

/// Màn hình menu CRM — lớp menu trung gian trong flow CRM.
///
/// Flow: workspace → "CRM" (màn này) → chọn chức năng CRM.
///
/// Mục "Lead Marketing" chỉ hiển thị với user có quyền
/// [PermissionGroups.crmLeadMarketing]; mục "Lead Sale" chỉ hiển thị với user
/// có quyền [PermissionGroups.crmLeadSale].
class CrmMenuScreen extends StatefulWidget {
  const CrmMenuScreen({super.key});

  @override
  State<CrmMenuScreen> createState() => _CrmMenuScreenState();
}

class _CrmMenuScreenState extends State<CrmMenuScreen> {
  /// Tập mã quyền của user hiện tại (vd: `N124`, `N125`).
  Set<String> _permissionCodes = {};

  @override
  void initState() {
    super.initState();
    _loadPermissions();
  }

  /// Đọc mã quyền từ user đã cache để lọc các mục menu.
  Future<void> _loadPermissions() async {
    final user = await AuthRepository.getCurrentUser();
    if (!mounted || user == null) return;
    setState(() {
      _permissionCodes = user.permissions
          .split(',')
          .map((code) => code.trim())
          .toSet();
    });
  }

  /// User có ít nhất một mã quyền trong [codes] hay không.
  bool _hasAny(List<String> codes) => codes.any(_permissionCodes.contains);

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

  /// Danh sách chức năng CRM hiển thị trong menu, đã lọc theo quyền user.
  List<AppItemModel> get _menuItems => [
    AppItemModel(
      id: 'crm:summary_customer',
      name: 'crm.summary_customer'.tr(),
      iconCodePoint: Icons.people_alt_outlined.codePoint,
      iconFontFamily: 'MaterialIcons',
      tab: 'crm',
      route: '${RouteNames.crmMenu}/${RouteNames.crmSummaryCustomer}',
    ),
    if (_hasAny(PermissionGroups.crmLeadMarketing))
      AppItemModel(
        id: 'crm:lead_marketing',
        name: 'crm.lead_marketing'.tr(),
        iconCodePoint: Icons.campaign_outlined.codePoint,
        iconFontFamily: 'MaterialIcons',
        tab: 'crm',
        route: '${RouteNames.crmMenu}/${RouteNames.crmLeadMarketing}',
      ),
    if (_hasAny(PermissionGroups.crmLeadSale))
      AppItemModel(
        id: 'crm:lead_sale',
        name: 'crm.lead_sale'.tr(),
        iconCodePoint: Icons.point_of_sale_outlined.codePoint,
        iconFontFamily: 'MaterialIcons',
        tab: 'crm',
        route: '${RouteNames.crmMenu}/${RouteNames.crmLeadSale}',
      ),
  ];
}
