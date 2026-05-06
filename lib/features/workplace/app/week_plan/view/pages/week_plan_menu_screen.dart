import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../base/widgets/base_widget.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../routes/route_names.dart';
import '../bloc/week_plan_bloc.dart';

class WeekPlanMenuScreen extends StatefulWidget {
  const WeekPlanMenuScreen({super.key});

  @override
  State<WeekPlanMenuScreen> createState() => _WeekPlanMenuScreenState();
}

class _WeekPlanMenuScreenState
    extends
        BaseState<
          WeekPlanMenuScreen,
          WeekPlanEvent,
          WeekPlanState,
          WeekPlanBloc
        > {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(const WeekPlanEvent.initMenu());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Kế hoạch tuần', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kế hoạch tuần',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 13,
                      childAspectRatio: 1,
                      children: [
                        _MenuTile(
                          icon: Icons.assignment_outlined,
                          title: 'Việc giao tôi',
                          onTap: () => context.push(RouteNames.weekplanMyTask),
                        ),
                        _MenuTile(
                          icon: Icons.send_outlined,
                          title: 'Việc tôi giao',
                          onTap: () =>
                              context.push(RouteNames.weekplanAssigned),
                        ),
                        _MenuTile(
                          icon: Icons.link_outlined,
                          title: 'Liên quan',
                          onTap: () => context.push(RouteNames.weekplanRelated),
                        ),
                        _MenuTile(
                          icon: Icons.view_agenda_outlined,
                          title: 'Tổng công việc',
                          onTap: () => context.push(RouteNames.weekplanAll),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Menu tile widget cho Week Plan grid.
class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primaryERP, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppStyles.caption1,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
