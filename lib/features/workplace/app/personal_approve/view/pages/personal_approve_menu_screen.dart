import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../base/bloc/index.dart';
import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../base/widgets/base_widget.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/utils/dialog/index.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../routes/route_names.dart';

import '../bloc/personal_approve_menu_bloc.dart';

/// Menu Phê duyệt - menu trung gian liệt kê các nhóm duyệt (Duyệt công, ...).
///
/// Đây là lớp menu thứ 1 trong flow Phê duyệt:
///   workspace → "Phê duyệt" (màn này) → "Duyệt công" → màn TBP/Senior.
///
/// Bấm "Duyệt công" sẽ resolve theo permission hiện tại:
/// - Có `personal_approve:senior` → màn Senior duyệt (thẳng).
/// - Ngược lại → menu loại phiếu (grid 9 mục) → từng màn TBP duyệt.
class PersonalApproveMenuScreen extends StatefulWidget {
  const PersonalApproveMenuScreen({super.key});

  @override
  State<PersonalApproveMenuScreen> createState() =>
      _PersonalApproveMenuScreenState();
}

class _PersonalApproveMenuScreenState extends BaseState<
    PersonalApproveMenuScreen,
    PersonalApproveMenuEvent,
    PersonalApproveMenuState,
    PersonalApproveMenuBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const PersonalApproveMenuEvent.init());
  }

  @override
  void listener(BuildContext context, PersonalApproveMenuState state) {
    super.listener(context, state);

    if (state.status == BaseStateStatus.failed) {
      DialogService.showToastFailed(
        context: context,
        mess: state.message ?? 'Load user failed',
      );
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Phê duyệt', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: blocBuilder((context, state) {
        // Chờ bloc lấy xong thông tin user hiện tại thì mới quyết định
        // menu nào được hiển thị — tránh nháy menu rồi mới mất.
        if (state.status == BaseStateStatus.init ||
            state.status == BaseStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BaseStateStatus.failed) {
          return _buildMessage(
            icon: Icons.error_outline,
            color: AppColors.alert,
            message: state.message ?? 'Không tải được thông tin người dùng',
          );
        }

        // Mục "Duyệt phiếu mua" chỉ hiện với tài khoản trong whitelist.
        final canSeePurchasing =
            _kApproveEmployeeIds.contains(state.currentUserEmployeeId);

        return _buildMenuContent(context, canSeePurchasing: canSeePurchasing);
      }),
    );
  }

  /// Màn trạng thái không có nội dung: icon + thông báo, canh giữa.
  Widget _buildMessage({
    required IconData icon,
    required Color color,
    required String message,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: color),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }

  /// Render các nhóm menu phê duyệt.
  ///
  /// [canSeePurchasing] quyết định mục "Duyệt phiếu mua" có hiển thị hay
  /// không — chỉ tài khoản trong whitelist mới thấy.
  Widget _buildMenuContent(
    BuildContext context, {
    required bool canSeePurchasing,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final group in _kPersonalApproveGroups)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _ApproveGroupSection(
                      group: group,
                      canSeeRestricted: canSeePurchasing,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Nhóm duyệt trong menu Phê duyệt.
class _ApproveGroup {
  const _ApproveGroup({required this.title, required this.items});

  /// Tiêu đề nhóm (vd: "Duyệt công").
  final String title;

  /// Danh sách mục con trong nhóm.
  final List<_ApproveGroupItem> items;
}

/// 1 mục con trong nhóm duyệt.
class _ApproveGroupItem {
  const _ApproveGroupItem({
    required this.title,
    required this.icon,
    required this.route,
    this.restrictedToWhitelist = false,
  });

  final String title;
  final IconData icon;
  final String route;

  /// `true` → mục chỉ hiển thị với user thuộc whitelist
  /// [_kApproveEmployeeIds] (dùng cho mục "Duyệt phiếu mua").
  final bool restrictedToWhitelist;
}

/// Hiển thị 1 nhóm duyệt: tiêu đề + grid các mục con.
///
/// [canSeeRestricted] điều khiển việc hiển thị các mục đánh dấu
/// [ _ApproveGroupItem.restrictedToWhitelist ].
class _ApproveGroupSection extends StatelessWidget {
  const _ApproveGroupSection({
    required this.group,
    required this.canSeeRestricted,
  });

  final _ApproveGroup group;
  final bool canSeeRestricted;

  @override
  Widget build(BuildContext context) {
    final visibleItems = group.items
        .where((item) => !item.restrictedToWhitelist || canSeeRestricted)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          group.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
              for (final item in visibleItems)
                _MenuTile(
                  icon: item.icon,
                  title: item.title,
                  route: item.route,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Whitelist `EmployeeID` được phép hiển thị mục "Duyệt phiếu mua".
///
/// Gồm 3 tài khoản (cùng `DepartmentID` = 1):
/// | Code  | EmployeeID | currentUser.ID |
/// |-------|------------|---------------|
/// | GM00  | 1          | 1             |
/// | PD00  | 2          | 2             |
/// | BD00  | 3          | 1293          |
///
/// Đối chiếu theo `EmployeeID` vì đó là field đã được bloc cache trong
/// `PersonalApproveMenuState.currentUserEmployeeId`. Riêng BD00 có
/// `currentUser.ID` khác `EmployeeID` nhưng không ảnh hưởng — `ID` chỉ
/// dùng cho mã nhân viên, không dùng để định danh người duyệt.
const _kApproveEmployeeIds = <int>{1, 2, 3};

/// Danh sách nhóm duyệt hiển thị trong menu Phê duyệt.
///
/// Hiện tại có 2 nhóm:
/// - "Duyệt công" — duyệt các phiếu timesheet (9 loại).
/// - "Duyệt ĐX/NN" — duyệt phiếu Đặt xe + Nhà nghỉ. Bấm vào mở menu
///   con gồm 3 mục: Duyệt file, Duyệt ĐNTT, Duyệt tạm ứng.
///
/// Khi thêm nhóm duyệt mới, chỉ cần thêm 1 nhóm vào list này.
final _kPersonalApproveGroups = <_ApproveGroup>[
  _ApproveGroup(
    title: 'Menu phê duyệt',
    items: [
      _ApproveGroupItem(
        title: 'Duyệt công',
        icon: Icons.access_time_filled_outlined,
        route: RouteNames.personalApproveTimesheetMenu,
      ),
      _ApproveGroupItem(
        title: 'Duyệt ĐX/NN',
        icon: Icons.hotel_outlined,
        route: RouteNames.personalApproveBookingGnMenu,
      ),
      _ApproveGroupItem(
        title: 'Duyệt phiếu mua',
        icon: Icons.shopping_cart_outlined,
        route: RouteNames.personalApprovePurchasing,
        restrictedToWhitelist: true,
      ),
    ],
  ),
];

/// Widget menu tile cho Personal Approve grid.
class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.route,
  });

  final IconData icon;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.push(route),
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
