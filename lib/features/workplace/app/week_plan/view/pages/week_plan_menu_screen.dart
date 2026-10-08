import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/constants/index.dart';
import '../../../../../../common/utils/dialog/index.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../routes/route_names.dart';
import '../../../../data/datasource/models/index.dart';
import '../../../../view/widgets/wp_action_card.dart';

class WeekPlanMenuScreen extends StatefulWidget {
  const WeekPlanMenuScreen({super.key});

  @override
  State<WeekPlanMenuScreen> createState() => _WeekPlanMenuScreenState();
}

class _WeekPlanMenuScreenState extends State<WeekPlanMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final items = _menuItems;

    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Kế hoạch tuần', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: WpActionCard(
              title: 'Kế hoạch tuần',
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
          ),
        ),
      ),
    );
  }

  List<AppItemModel> get _menuItems => [
        AppItemModel(
          id: 'week_plan:my_task',
          name: 'Việc giao tôi',
          iconCodePoint: Icons.assignment_outlined.codePoint,
          iconFontFamily: 'MaterialIcons',
          tab: 'week_plan',
          route: RouteNames.weekplanMyTask,
          imageUrl: AppImages.week_plan_my_task,
        ),
        AppItemModel(
          id: 'week_plan:assigned',
          name: 'Việc tôi giao',
          iconCodePoint: Icons.send_outlined.codePoint,
          iconFontFamily: 'MaterialIcons',
          tab: 'week_plan',
          route: RouteNames.weekplanAssigned,
          imageUrl: AppImages.week_plan_assign,
        ),
        AppItemModel(
          id: 'week_plan:related',
          name: 'Liên quan',
          iconCodePoint: Icons.link_outlined.codePoint,
          iconFontFamily: 'MaterialIcons',
          tab: 'week_plan',
          route: RouteNames.weekplanRelated,
          imageUrl: AppImages.week_plan_related,
        ),
        AppItemModel(
          id: 'week_plan:dashboard',
          name: 'Tổng quan',
          iconCodePoint: Icons.dashboard_outlined.codePoint,
          iconFontFamily: 'MaterialIcons',
          tab: 'week_plan',
          route: RouteNames.weekplanDashboard,
          imageUrl: AppImages.week_plan_overall,
        ),
        AppItemModel(
          id: 'week_plan:timeline',
          name: 'Timeline',
          iconCodePoint: Icons.view_timeline_outlined.codePoint,
          iconFontFamily: 'MaterialIcons',
          tab: 'week_plan',
          route: RouteNames.weekplanTimeline,
          imageUrl: AppImages.week_plan_timeline,
        ),
      ];
}
