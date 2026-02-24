import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:rtc_erp/base/widgets/base_scaffold.dart";
import "package:rtc_erp/common/constants/app_image.dart";

import "../../../base/bloc/index.dart";
import "../../../base/widgets/base_widget.dart";
import "../../../common/models/index.dart";
import "../../../common/utils/dialog/index.dart";

import "bloc/workspace_bloc.dart";
import "widgets/wp_action_card.dart";
import "widgets/wp_circle_button.dart";
import "widgets/wp_favorite_add.dart";
import "widgets/wp_info_card.dart";

class WorkPlaceScreen extends StatefulWidget {
  const WorkPlaceScreen({super.key});

  @override
  State<WorkPlaceScreen> createState() => _WorkPlaceScreenState();
}

class _WorkPlaceScreenState
    extends BaseState<WorkPlaceScreen, WorkspaceEvent, WorkspaceState, WorkspaceBloc> {

  @override
  void initState() {
    super.initState();
    bloc.add(const WorkspaceEvent.init());
  }

  /// ===== LISTEN STATE =====
  @override
  void listener(BuildContext context, WorkspaceState state) {
    super.listener(context, state);

    if (state.status == BaseStateStatus.failed) {
      DialogService.showToastFailed(
        context: context,
        mess: state.message ?? 'Load workspace failed',
      );
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      onRefresh: () async {
        bloc.add(const WorkspaceEvent.refresh());
      },
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,

        /// ===== HEADER USER INFO =====
        title: blocBuilder(
              (context, state) {
            final user = state.user;

            if (state.status == BaseStateStatus.loading && user == null) {
              return const SizedBox(
                height: 36,
                child: Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            }

            return WpInfoCard(
              avatarUrl: user?.avatar ?? 'https://i.pravatar.cc/150',
              name: user?.fullName ?? '---',
              code: user?.code ?? '---',
            );
          },
          buildWhen: (p, n) =>
          p.user != n.user || p.status != n.status,
        ),

        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              WpCircleButton(
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
          WpCircleButton(
            icon: Icons.qr_code_scanner_outlined,
            onPressed: () {},
            borderColor: Colors.grey.shade300,
            iconColor: Colors.black87,
          ),
          const SizedBox(width: 12),
        ],
      ),

      body: blocBuilder(
            (context, state) {
          if (state.status == BaseStateStatus.loading && state.user == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.user == null) {
            return const Center(child: Text('Không có dữ liệu user'));
          }

          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SafeArea(
                child: Column(
                  children: [
                    WpFavoriteAdd(onAddTap: () => context.push('/favorites')),

                    const SizedBox(height: 8),

                    WpActionCard(
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
                          iconCodePoint:
                          Icons.assignment_outlined.codePoint,
                          imageUrl: AppImages.app_menu_general_form,
                        ),
                        AppItemModel(
                          id: 'summary_work',
                          iconCodePoint:
                          Icons.content_paste_search_outlined.codePoint,
                          name: 'applications.summary_work'.tr(),
                          imageUrl: AppImages.app_menu_summary_work,
                        ),
                        AppItemModel(
                          id: 'reg_work',
                          iconCodePoint:
                          Icons.person_pin_outlined.codePoint,
                          name: 'applications.reg_work'.tr(),
                          route: '/regwork',
                          imageUrl: AppImages.app_menu_reg_work,
                        ),
                        AppItemModel(
                          id: 'reg_general',
                          iconCodePoint: Icons.dvr_outlined.codePoint,
                          name: 'applications.reg_general'.tr(),
                          imageUrl: AppImages.app_menu_reg_general,
                        ),
                        AppItemModel(
                          id: 'report',
                          iconCodePoint:
                          Icons.description_outlined.codePoint,
                          name: 'applications.report'.tr(),
                          route: '/report',
                          imageUrl: AppImages.app_menu_report,
                        ),
                        AppItemModel(
                          id: 'week_plan',
                          iconCodePoint:
                          Icons.newspaper_outlined.codePoint,
                          name: 'applications.week_plan'.tr(),
                          imageUrl: AppImages.app_menu_week_plan,
                        ),
                        AppItemModel(
                          id: 'stock',
                          iconCodePoint:
                          Icons.shopping_cart_outlined.codePoint,
                          name: 'applications.stock'.tr(),
                          imageUrl: AppImages.app_menu_stock,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    WpActionCard(
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
                          iconCodePoint:
                          Icons.error_outline_outlined.codePoint,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        buildWhen: (p, n) =>
        p.status != n.status || p.user != n.user,
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
