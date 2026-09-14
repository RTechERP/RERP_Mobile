import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../common/constants/app_image.dart';
import '../../../../../common/utils/dialog/index.dart';
import '../../../../routes/route_names.dart';
import '../../../workplace/data/datasource/models/index.dart';
import '../../view/widgets/wp_action_card.dart';

/// Màn hình menu project - hiển thị danh sách các mục project.
class ProjectMenuScreen extends StatelessWidget {
  const ProjectMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Dự án'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            WpActionCard(
              onItemTap: (item) {
                final route = item.route;
                if (route == null || route.isEmpty) {
                  DialogService.showProcessing(context: context);
                  return;
                }
                context.push('${RouteNames.projectMenu}/${RouteNames.projectList}');
              },
              title: 'project.menu'.tr(),
              expandable: true,
              collapsedItemCount: 11,
              items: [
                AppItemModel(
                  id: 'project_list',
                  iconCodePoint: Icons.task_alt.codePoint,
                  name: 'project.project_list'.tr(),
                  imageUrl: AppImages.warehouse_project,
                  route: RouteNames.projectList,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
