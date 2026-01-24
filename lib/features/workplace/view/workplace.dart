import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:rtc_erp/common/app_theme/app_colors.dart";
import "package:rtc_erp/features/workplace/view/widgets/action_group_card.dart";
import "package:rtc_erp/features/workplace/view/widgets/circle_icon_button.dart";
import "package:rtc_erp/features/workplace/view/widgets/favorites_add.dart";
import "package:rtc_erp/features/workplace/view/widgets/info_card.dart";

import "../../../base/widgets/base_scaffold.dart";
import "../../../common/models/index.dart";

class WorkPlace extends StatelessWidget {
  const WorkPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      onRefresh: () async {

        await Future.delayed(const Duration(seconds: 2));

      },
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: InfoCard(
          avatarUrl: 'https://i.pravatar.cc/150',
          name: 'Nguyễn Văn A',
          company: 'RTC ERP',
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleIconButton(
                icon: Icons.notifications_none_outlined,
                onPressed: () {},
              ),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          CircleIconButton(
            icon: Icons.qr_code_scanner_outlined,
            onPressed: () {},
            borderColor: Colors.grey.shade300,
            iconColor: Colors.black87,
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                FavoritesAdd(onTap: (){
                  context.push('/favorites');
                }),
                const SizedBox(height: 16),
            
                ActionGroupCard(
                  title: 'tab.works'.tr(),
                  expandable: true,
                  collapsedItemCount: 11,
                  items: [
                  AppItem(
                    id: 'attendance',
                    name: 'attendance.work'.tr(),
                    icon: Icons.assignment_outlined,
                    onTap: () => context.push('/attendance'),
                  ),
                  AppItem(
                    id: 'timekeeping',
                    icon: Icons.notifications_outlined,
                    name: 'attendance.timekeeping'.tr(),
                    onTap: () {},
                  ),
                ],
                ),
                const SizedBox(height: 16),

                ActionGroupCard(
                  title: 'tab.features'.tr(),
                  expandable: true,
                  collapsedItemCount: 11,
                  items: [
                    AppItem(
                      id: 'bonus',
                      name: 'features.bonus'.tr(),
                      icon: Icons.notifications_none_outlined,
                      isProcessing: true,
                    ),
                    AppItem(
                      id: 'bonus',
                      name: 'features.bonus'.tr(),
                      icon: Icons.notifications_none_outlined,
                      isProcessing: true,
                    ),
                    AppItem(
                      id: 'bonus',
                      name: 'features.bonus'.tr(),
                      icon: Icons.notifications_none_outlined,
                      isProcessing: true,
                    ),
                    AppItem(
                      id: 'bonus',
                      name: 'features.bonus'.tr(),
                      icon: Icons.notifications_none_outlined,
                      isProcessing: true,
                    ),
                    AppItem(
                      id: 'bonus',
                      name: 'features.bonus'.tr(),
                      icon: Icons.notifications_none_outlined,
                      isProcessing: true,
                    ),



                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
