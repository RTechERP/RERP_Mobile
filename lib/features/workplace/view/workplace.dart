import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:rtc_erp/features/workplace/view/widgets/action_group_card.dart";
import "package:rtc_erp/features/workplace/view/widgets/circle_icon_button.dart";
import "package:rtc_erp/features/workplace/view/widgets/favorites_add.dart";
import "package:rtc_erp/features/workplace/view/widgets/info_card.dart";

import "../../../base/widgets/base_scaffold.dart";
import "../../../common/models/index.dart";
import "../../../common/utils/dialog/index.dart";

class WorkPlace extends StatefulWidget {
  const WorkPlace({super.key});

  @override
  State<WorkPlace> createState() => _WorkPlaceState();
}

class _WorkPlaceState extends State<WorkPlace> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
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
        padding: const EdgeInsets.only(top: 12),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                FavoritesAdd(onAddTap: () => context.push('/favorites')),

                const SizedBox(height: 8),

                ActionGroupCard(
                  onItemTap: (item) {
                    final route = item.route;

                    if (route == null || route.isEmpty) {
                      DialogService.showProcessing(context: context);
                      return;
                    }

                    context.push(route);
                  },
                  title: 'tab.applications'.tr(),
                  expandable: true,
                  collapsedItemCount: 11,
                  items: [
                    AppItemModel(
                      id: 'general_forms',
                      name: 'applications.general_forms'.tr(),
                      iconCodePoint: Icons.assignment_outlined.codePoint,
                    ),
                    AppItemModel(
                      id: 'summary_work',
                      iconCodePoint:
                          Icons.content_paste_search_outlined.codePoint,
                      name: 'applications.summary_work'.tr(),
                    ),
                    AppItemModel(
                      id: 'reg_work',
                      iconCodePoint: Icons.person_pin_outlined.codePoint,
                      name: 'applications.reg_work'.tr(),
                      route: '/regwork',
                    ),
                    AppItemModel(
                      id: 'reg_general',
                      iconCodePoint: Icons.dvr_outlined.codePoint,
                      name: 'applications.reg_general'.tr(),
                    ),
                    AppItemModel(
                      id: 'report',
                      iconCodePoint: Icons.description_outlined.codePoint,
                      name: 'applications.report'.tr(),
                    ),
                    AppItemModel(
                      id: 'week_plan',
                      iconCodePoint: Icons.newspaper_outlined.codePoint,
                      name: 'applications.week_plan'.tr(),
                    ),
                    AppItemModel(
                      id: 'stock',
                      iconCodePoint: Icons.shopping_cart_outlined.codePoint,
                      name: 'applications.stock'.tr(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                ActionGroupCard(
                  onItemTap: (item) {
                    final route = item.route;

                    if (route == null || route.isEmpty) {
                      DialogService.showProcessing(context: context);
                      return;
                    }

                    context.push(route);
                  },
                  title: 'tab.features'.tr(),
                  expandable: true,
                  collapsedItemCount: 11,
                  items: [
                    AppItemModel(
                      id: 'process',
                      name: 'common.process'.tr(),
                      iconCodePoint: Icons.error_outline_outlined.codePoint,
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

// class _FavoriteGrid extends StatelessWidget {
//   final List<AppItemModel> items;
//   final VoidCallback onAddTap;
//
//   const _FavoriteGrid({
//     required this.items,
//     required this.onAddTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: items.length + 1,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4,
//           mainAxisSpacing: 12,
//           crossAxisSpacing: 12,
//           childAspectRatio: 0.9,
//         ),
//         itemBuilder: (context, index) {
//           if (index == items.length) {
//             return _AddFavoriteItem(onTap: onAddTap);
//           }
//
//           final item = items[index];
//           return _ActionGridItem(
//             item: item,
//             onTap: () {
//               final route = item.route;
//               if (route == null || route.isEmpty) {
//                 DialogService.showProcessing(context: context);
//                 return;
//               }
//               context.push(route);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class _AddFavoriteItem extends StatelessWidget {
//   final VoidCallback onTap;
//
//   const _AddFavoriteItem({required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(12),
//       onTap: onTap,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 44,
//             height: 44,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: AppColors.primaryERP),
//             ),
//             child: Icon(
//               Icons.add,
//               color: AppColors.primaryERP,
//             ),
//           ),
//           const SizedBox(height: 6),
//           const Text(
//             'Thêm',
//             style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
