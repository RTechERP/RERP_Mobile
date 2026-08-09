// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình workspace chính - hiển thị user info, menu ứng dụng, tính năng

import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:rtc_erp/base/widgets/base_scaffold.dart";
import "package:rtc_erp/common/constants/app_image.dart";
import "../../../common/app/app_config.dart";

import "../../../base/bloc/index.dart";
import "../../../base/widgets/base_widget.dart";
import "../../../common/enums/role_enum.dart";
import "../../../common/services/permissions/role_groups.dart";
import "../../../common/services/permissions/role_resolver.dart";
import "../../../common/utils/dialog/index.dart";

import "../../../routes/route_names.dart";
import "../../auth/data/datasource/models/user_model.dart";
import "../../auth/view/bloc/auth_bloc.dart";

import "../data/datasource/models/index.dart";
import "bloc/workspace_bloc.dart";
import "widgets/wp_action_card.dart";
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

    if (roles.contains(AppRole.tech) && employeeId != 271 ||
        roles.contains(AppRole.agv) ||
        roles.contains(AppRole.ad)) {
      return RouteNames.reportITdepart;
    }

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

    // if (roles.contains(AppRole.agv)) {
    //   return RouteNames.reportAGVdepart;
    // }
    //
    // if (roles.contains(AppRole.ad)) {
    //   return RouteNames.reportADdepart;
    // }

    if (roles.contains(AppRole.marketing)) {
      return RouteNames.reportMarketingdepart;
    }

    if (roles.contains(AppRole.accountant)) {
      return RouteNames.reportAccountant;
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

        title: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (p, n) =>
              p.user != n.user ||
              p.status != n.status ||
              p.avatarUploadedAt != n.avatarUploadedAt,
          builder: (context, authState) {
            final user = authState.user;

            // URL dùng `user.imagePath` (server field `ImagePath`) làm cache-bust.
            // Sau upload, AuthBloc re-fetch user → user.imagePath đổi → URL đổi
            // → CachedNetworkImage fetch ảnh mới đồng bộ trên mọi màn đang
            // nghe AuthBloc (more_screen, workspace_screen, ...).
            //
            // Nếu `imagePath` rỗng (chưa upload) thì trả null → WpInfoCard
            // hiển thị icon person default.
            //
            // Ngoài ra thêm `cacheBust` (epoch ms) để chắc chắn cache bị bust
            // kể cả khi server trả về cùng imagePath (server có thể reuse filename).
            final avatarUrl = _resolveAvatarUrl(
              user?.employeeId,
              imagePath: user?.imagePath,
              cacheBust: authState.avatarUploadedAt?.millisecondsSinceEpoch,
            );

            return WpInfoCard(
              avatarUrl: avatarUrl,
              name: user?.fullName ?? '---',
              code: user?.code ?? '---',
            );
          },
        ),
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

                  const SizedBox(height: 16),

                  WpActionCard(
                    onItemTap: (item) async {
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

                      // Personal Approve: route đã được WorkspaceBloc resolve sẵn
                      // lúc load workspace (theo permission Senior N85).
                      // Bấm là vào thẳng, không gọi API, không show processing.
                      if (item.id == 'personal_approve') {
                        final route = state.personalApproveRoute;
                        if (route != null && route.isNotEmpty) {
                          context.push(route);
                        }
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
                        route: RouteNames.report,
                        imageUrl: AppImages.app_menu_report,
                      ),
                      AppItemModel(
                        id: 'general_forms',
                        iconCodePoint: Icons.file_copy_outlined.codePoint,
                        name: 'applications.general_forms'.tr(),
                        route: RouteNames.generalforms,
                        imageUrl: AppImages.app_menu_general_form,
                      ),
                      // AppItemModel(
                      //   id: 'summary_work',
                      //   iconCodePoint:
                      //       Icons.content_paste_search_outlined.codePoint,
                      //   name: 'applications.summary_work'.tr(),
                      //   imageUrl: AppImages.app_menu_summary_work,
                      // ),
                      AppItemModel(
                        id: 'week_plan',
                        iconCodePoint: Icons.newspaper_outlined.codePoint,
                        name: 'applications.week_plan'.tr(),
                        route: RouteNames.weekplan,
                        imageUrl: AppImages.app_menu_week_plan,
                      ),
                      // AppItemModel(
                      //   id: 'week_plan',
                      //   iconCodePoint: Icons.newspaper_outlined.codePoint,
                      //   name: 'applications.week_plan'.tr(),
                      //   route: '/week_plan',
                      //   imageUrl: AppImages.app_menu_week_plan,
                      // ),
                      if (_hasApprovePermission(state.user))
                        AppItemModel(
                          id: 'personal_approve',
                          iconCodePoint: Icons.approval_outlined.codePoint,
                          name: 'applications.personal_approve'.tr(),
                          // route trống - sẽ resolve ngay khi tap
                          // imageUrl: AppImages.app_menu_week_plan,
                        ),
                      // AppItemModel(
                      //   id: 'stock',
                      //   iconCodePoint: Icons.shopping_cart_outlined.codePoint,
                      //   name: 'applications.stock'.tr(),
                      //   imageUrl: AppImages.app_menu_stock,
                      // ),
                      // AppItemModel(
                      //   id: 'warehouse',
                      //   iconCodePoint: Icons.warehouse_outlined.codePoint,
                      //   name: 'applications.warehouse'.tr(),
                      //   route: RouteNames.warehouse,
                      // ),
                    ],
                  ),

                  // const SizedBox(height: 8),
                  //
                  // WpActionCard(
                  //   onItemTap: (item) {
                  //     final route = item.route;
                  //     if (route == null || route.isEmpty) {
                  //       DialogService.showProcessing(context: context);
                  //       return;
                  //     }
                  //     context.push(route);
                  //   },
                  //   title: 'tab.features'.tr(),
                  //   expandable: true,
                  //   collapsedItemCount: 11,
                  //   items: [
                  //     AppItemModel(
                  //       id: 'process',
                  //       name: 'common.process'.tr(),
                  //       iconCodePoint: Icons.error_outline_outlined.codePoint,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      }, buildWhen: (p, n) => p.status != n.status || p.user != n.user),
    );
  }

  /// Kiểm tra user có được phép hiển thị chức năng "Phê duyệt" hay không.
  ///
  /// Dựa trên field `permissions` (chuỗi phân tách bởi dấu phẩy) của user.
  /// Chỉ những user có chứa một trong các mã N1, N32, N85 mới được thấy item.
  bool _hasApprovePermission(User? user) {
    if (user == null) return false;
    final codes = user.permissions.split(',').map((e) => e.trim()).toSet();
    return codes.any(_approvePermissionCodes.contains);
  }

  /// Danh sách các mã permission cho phép hiển thị chức năng Phê duyệt.
  static const _approvePermissionCodes = {'N1', 'N32', 'N85'};

  /// Resolve full URL cho avatar qua endpoint /api/home/avatar.
  ///
  /// Trả về `null` khi:
  ///  - Chưa có `employeeId`.
  ///  - Chưa có `imagePath` (server field `ImagePath`) — user chưa upload
  ///    avatar lần nào → caller render icon person default.
  ///  - Chưa cấu hình `baseUrl`.
  ///
  /// [imagePath] thay đổi mỗi lần user upload avatar mới, dùng làm query
  /// param để cache-bust đồng bộ trên mọi màn.
  ///
  /// [cacheBust] là epoch ms của lần fetch hiện tại — bắt buộc phải có sau khi
  /// upload để tránh cache CachedNetworkImage trả ảnh cũ khi server trả về
  /// cùng `imagePath` (server có thể reuse filename).
  String? _resolveAvatarUrl(
    int? employeeId, {
    String? imagePath,
    int? cacheBust,
  }) {
    // Chưa có employeeId hoặc chưa có imagePath (server chưa upload avatar)
    // → để WpInfoCard render icon person default.
    if (employeeId == null) return null;
    if (imagePath == null || imagePath.isEmpty) return null;

    final baseUrl = AppConfig.baseUrl.trim();
    if (baseUrl.isEmpty) return null;

    var normalizedBaseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    if (normalizedBaseUrl.endsWith('/api')) {
      normalizedBaseUrl = normalizedBaseUrl.substring(
        0,
        normalizedBaseUrl.length - 4,
      );
    }

    final bust = cacheBust != null ? '&_t=$cacheBust' : '';
    return '$normalizedBaseUrl/api/home/avatar?employeeId=$employeeId&v=$imagePath$bust';
  }
}
