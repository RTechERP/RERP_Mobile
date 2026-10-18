import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/services/permissions/permission_service.dart';
import '../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../features/auth/data/repository/auth_repository.dart';
import '../../../../../../routes/route_names.dart';

/// Menu "Duyệt công" - chọn loại phiếu cần duyệt.
///
/// Đây là lớp menu thứ 2 trong flow Phê duyệt:
///   workspace → "Phê duyệt" (menu nhóm) → "Duyệt công" (màn này) → từng phiếu.
///
/// Khi user bấm 1 mục con, route được resolve theo permission hiện tại:
/// - Có quyền Senior (`N85` hoặc `personal_approve:senior`) → màn Senior.
/// - Có quyền TBP (`N1`/`N32`) → màn TBP với query `?tType=` (filter API).
/// - Không có quyền nào → báo lỗi.
///
/// Thứ tự ưu tiên: Senior > TBP.
class PersonalApproveTimesheetMenuScreen extends StatefulWidget {
  const PersonalApproveTimesheetMenuScreen({super.key});

  @override
  State<PersonalApproveTimesheetMenuScreen> createState() =>
      _PersonalApproveTimesheetMenuScreenState();
}

class _PersonalApproveTimesheetMenuScreenState
    extends State<PersonalApproveTimesheetMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Duyệt công', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: _buildMenuContent(context),
    );
  }

  Widget _buildMenuContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
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
                  for (final menu in _kPersonalApproveSubMenus)
                    _MenuTile(
                      icon: menu.icon,
                      title: menu.title,
                      onTap: () => _resolveAndNavigate(context, menu.tType),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Resolve route theo permission của user hiện tại và navigate.
  ///
  /// Thứ tự ưu tiên:
  /// 1. Có quyền Senior (`N85` hoặc `personal_approve:senior`) → màn Senior.
  ///    (Admin mặc định có `personal_approve:senior` do `AppRole.admin` có
  ///    mọi permission — trừ khi admin cũng có `N1`/`N32` thì ưu tiên TBP.)
  /// 2. Có quyền TBP (`N1`/`N32`) → màn TBP với query `?tType=` (filter API).
  /// 3. Không có quyền nào → báo lỗi.
  Future<void> _resolveAndNavigate(BuildContext context, int tType) async {
    // Capture router trước khi await để tránh `use_build_context_synchronously`
    // sau khi gọi `AuthRepository.getCurrentUser()`.
    final router = GoRouter.of(context);
    final user = await AuthRepository.getCurrentUser();
    if (!mounted) return;

    final codes = (user?.permissions ?? '')
        .split(',')
        .map((e) => e.trim())
        .toSet();
    final hasTbp = codes.any(_tbpPermissionCodes.contains);
    final hasSenior = codes.contains('N85') ||
        PermissionService.hasAccess('personal_approve:senior');

    if (hasTbp) {
      // Có quyền TBP (N1/N32) → ưu tiên màn TBP với query `?tType=` để
      // API `getApproveTimesheet` filter theo loại phiếu.
      router.push(RouteNames.personalApproveTimesheetByType(tType));
      return;
    }

    if (hasSenior) {
      // Senior duyệt: vào thẳng màn Senior (xem tất cả phiếu,
      // không filter theo tType).
      router.push(RouteNames.personalApproveSeniorTimesheet);
      return;
    }

    if (context.mounted) {
      DialogService.showToastFailed(
        context: context,
        mess: 'Bạn không có quyền duyệt công. Vui lòng liên hệ quản trị.',
      );
    }
  }

  /// Mã permission cho phép user duyệt ở màn TBP.
  static const _tbpPermissionCodes = {'N1', 'N32'};
}

/// Danh sách các mục con của menu Duyệt công.
///
/// Mỗi mục map sang 1 `tType` của API `getApproveTimesheet` (1..9).
/// Khi user bấm, route được mở với query `?tType=<value>` → màn TBP
/// filter API theo `TType` trong payload.
///
/// Thứ tự hiển thị lấy theo yêu cầu nghiệp vụ (không trùng với thứ tự
/// số `tType`).
const _kPersonalApproveSubMenus = <_PersonalApproveSubMenu>[
  _PersonalApproveSubMenu(
    tType: 1,
    icon: Icons.event_busy_outlined,
    title: 'Đăng ký nghỉ',
  ),
  _PersonalApproveSubMenu(
    tType: 2,
    icon: Icons.access_time_outlined,
    title: 'Đ.muộn - v.sớm',
  ),
  _PersonalApproveSubMenu(
    tType: 3,
    icon: Icons.more_time_outlined,
    title: 'Làm thêm',
  ),
  _PersonalApproveSubMenu(
    tType: 8,
    icon: Icons.nightlight_outlined,
    title: 'Làm đêm',
  ),
  _PersonalApproveSubMenu(
    tType: 4,
    icon: Icons.airport_shuttle_outlined,
    title: 'Công tác',
  ),
  _PersonalApproveSubMenu(
    tType: 9,
    icon: Icons.directions_car_outlined,
    title: 'Đặt xe',
  ),
  _PersonalApproveSubMenu(
    tType: 5,
    icon: Icons.home_work_outlined,
    title: 'WFH',
  ),
  _PersonalApproveSubMenu(
    tType: 6,
    icon: Icons.fingerprint_outlined,
    title: 'Quên chấm công',
  ),
  _PersonalApproveSubMenu(
    tType: 7,
    icon: Icons.payments_outlined,
    title: 'Tạm ứng lương',
  ),
  _PersonalApproveSubMenu(
    tType: 11,
    icon: Icons.payments_outlined,
    title: 'Đăng ký nhà nghỉ',
  ),
];

/// Mô tả 1 mục con của menu Duyệt công.
class _PersonalApproveSubMenu {
  const _PersonalApproveSubMenu({
    required this.tType,
    required this.icon,
    required this.title,
  });

  /// `TType` của API `getApproveTimesheet` tương ứng với loại phiếu.
  final int tType;

  /// Icon hiển thị.
  final IconData icon;

  /// Tiêu đề hiển thị.
  final String title;
}

/// Widget menu tile cho menu Duyệt công.
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
