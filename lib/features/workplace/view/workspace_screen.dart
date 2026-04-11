// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình workspace chính - hiển thị user info, menu ứng dụng, tính năng

import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:rtc_erp/base/widgets/base_scaffold.dart";
import "package:rtc_erp/common/constants/app_image.dart";

import "../../../base/bloc/index.dart";
import "../../../base/widgets/base_widget.dart";
import "../../../common/enums/role_enum.dart";
import "../../../common/models/index.dart";
import "../../../common/services/permissions/role_groups.dart";
import "../../../common/services/permissions/role_resolver.dart";
import "../../../common/utils/dialog/index.dart";

import "../../../routes/route_names.dart";
import "../../auth/data/datasource/models/user_model.dart";

import "bloc/workspace_bloc.dart";
import "widgets/wp_action_card.dart";
import "widgets/wp_circle_button.dart";
import "widgets/wp_favorite_add.dart";
import "widgets/wp_info_card.dart";

/// Màn hình workspace chính.
///
/// Hiển thị thông tin user (avatar, tên, mã), các ứng dụng (Đơn từ, Báo cáo),
/// và tính năng (Quy trình). Xử lý navigate đến route phù hợp theo role của user.
class WorkPlaceScreen extends StatefulWidget {
  const WorkPlaceScreen({super.key});

  @override
  State<WorkPlaceScreen> createState() => _WorkPlaceScreenState();
}

class _WorkPlaceScreenState
    extends
        BaseState<
          WorkPlaceScreen,
          WorkspaceEvent,
          WorkspaceState,
          WorkspaceBloc
        > {
  @override
  void initState() {
    super.initState();
    bloc.add(const WorkspaceEvent.init());
  }

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

  /// Resolve route báo cáo dựa trên role của user.
  ///
  /// Thứ tự ưu tiên: HR > Sale > Tech > AGV > AD > Marketing.
  /// Với HR: ưu tiên position (LXCP, CP) trước department, fallback về HR Admin.
  String? resolveReportRoute(User user) {
    final roles = RoleResolver.resolve(user);
    final employeeId = user.employeeId;
    final deptId = user.departmentId;
    final posId = user.positionId;

    if (roles.contains(AppRole.hr)) {
      if (employeeId == 5) return RouteNames.reportHRAdmin;

      if (PositionGroups.positionLxs.contains(posId) ||
          PositionGroups.positionCps.contains(posId)) {
        return RouteNames.reportHRLXCP;
      }

      if (DepartmentGroups.hr.contains(deptId)) {
        return RouteNames.reportHRAdmin;
      }

      return RouteNames.reportHRAdmin;
    }

    if (roles.contains(AppRole.sale)) {
      return RouteNames.reportSaledepart;
    }

    if (roles.contains(AppRole.tech)) {
      return RouteNames.reportITdepart;
    }

    if (roles.contains(AppRole.agv)) {
      return RouteNames.reportAGVdepart;
    }

    if (roles.contains(AppRole.ad)) {
      return RouteNames.reportADdepart;
    }

    if (roles.contains(AppRole.marketing)) {
      return RouteNames.reportMarketingdepart;
    }

    return null;
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

        title: blocBuilder((context, state) {
          final user = state.user;

          if (state.status == BaseStateStatus.loading && user == null) {
            return const SizedBox(
              height: 36,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            );
          }

          return WpInfoCard(
            avatarUrl: user?.avatar ?? 'https://i.pravatar.cc/150',
            name: user?.fullName ?? '---',
            code: user?.code ?? '---',
          );
        }, buildWhen: (p, n) => p.user != n.user || p.status != n.status),

        actions: [
          // Stack(
          //   clipBehavior: Clip.none,
          //   children: [
          //     WpCircleButton(
          //       icon: Icons.notifications_none_outlined,
          //       onPressed: () {},
          //     ),
          //     Positioned(
          //       right: 2,
          //       top: 2,
          //       child: Container(
          //         width: 10,
          //         height: 10,
          //         decoration: const BoxDecoration(
          //           color: Colors.red,
          //           shape: BoxShape.circle,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(width: 12),
          WpCircleButton(
            icon: Icons.qr_code_scanner_outlined,
            onPressed: () {},
            borderColor: Colors.grey.shade300,
            iconColor: Colors.black87,
          ),
          const SizedBox(width: 12),
        ],
      ),

      body: blocBuilder((context, state) {
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
                      final user = state.user;
                      if (user == null) return;

                      if (item.id == 'report') {
                        final route = resolveReportRoute(user);

                        if (route != null) {
                          context.push(route);
                          return;
                        }

                        DialogService.showProcessing(context: context);
                        return;
                      }

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
                        id: 'reg_work',
                        iconCodePoint: Icons.person_pin_outlined.codePoint,
                        name: 'applications.reg_work'.tr(),
                        route: '/regwork',
                        imageUrl: AppImages.app_menu_reg_work,
                      ),
                      AppItemModel(
                        id: 'reg_general',
                        iconCodePoint: Icons.dvr_outlined.codePoint,
                        name: 'applications.reg_general'.tr(),
                        imageUrl: AppImages.app_menu_reg_general,
                        route: RouteNames.reggeneral,
                      ),
                      AppItemModel(
                        id: 'report',
                        iconCodePoint: Icons.description_outlined.codePoint,
                        name: 'applications.report'.tr(),
                        route: '/report',
                        imageUrl: AppImages.app_menu_report,
                      ),
                      AppItemModel(
                        id: 'general_forms',
                        name: 'applications.general_forms'.tr(),
                        iconCodePoint: Icons.assignment_outlined.codePoint,
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
                        id: 'week_plan',
                        iconCodePoint: Icons.newspaper_outlined.codePoint,
                        name: 'applications.week_plan'.tr(),
                        imageUrl: AppImages.app_menu_week_plan,
                      ),
                      AppItemModel(
                        id: 'stock',
                        iconCodePoint: Icons.shopping_cart_outlined.codePoint,
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
                        iconCodePoint: Icons.error_outline_outlined.codePoint,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }, buildWhen: (p, n) => p.status != n.status || p.user != n.user),
    );
  }
}
