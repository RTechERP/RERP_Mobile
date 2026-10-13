import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../routes/route_names.dart';

class PersonalApproveBookingGnMenuScreen extends StatefulWidget {
  const PersonalApproveBookingGnMenuScreen({super.key});

  @override
  State<PersonalApproveBookingGnMenuScreen> createState() =>
      _PersonalApproveBookingGnMenuScreenState();
}

class _PersonalApproveBookingGnMenuScreenState
    extends State<PersonalApproveBookingGnMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Duyệt ĐX/NN', style: AppStyles.headingTitle2),
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
                  for (final menu in _kBookingGnSubMenus)
                    _MenuTile(
                      icon: menu.icon,
                      title: menu.title,
                      onTap: () => _onSubMenuTap(context, menu),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Tap 1 mục con → navigate sang màn duyệt tương ứng.
  ///
  /// Logic đơn giản: mở thẳng `ApproveBookingGuestHousePage` với
  /// query `?type=` để phân biệt 3 luồng. Nếu cần phân quyền Senior/TBP
  /// riêng cho ĐX/NN, bổ sung check permission giống `_PersonalApproveTimesheetMenuScreenState`.
  void _onSubMenuTap(
    BuildContext context,
    _PersonalApproveBookingGnSubMenu menu,
  ) {
    context.push(
      '${RouteNames.personalApproveBookingGuestHouse}?type=${menu.queryType}',
    );
  }
}

/// 3 mục con của menu Duyệt ĐX/NN.
///
/// Thứ tự hiển thị: Duyệt file → Duyệt ĐNTT → Duyệt tạm ứng.
const _kBookingGnSubMenus = <_PersonalApproveBookingGnSubMenu>[
  _PersonalApproveBookingGnSubMenu(
    queryType: 'file',
    icon: Icons.folder_open_outlined,
    title: 'Duyệt file',
  ),
  _PersonalApproveBookingGnSubMenu(
    queryType: 'dntt',
    icon: Icons.receipt_long_outlined,
    title: 'Duyệt ĐNTT',
  ),
  _PersonalApproveBookingGnSubMenu(
    queryType: 'tam-ung',
    icon: Icons.payments_outlined,
    title: 'Duyệt tạm ứng',
  ),
];

/// Mô tả 1 mục con của menu Duyệt ĐX/NN.
class _PersonalApproveBookingGnSubMenu {
  const _PersonalApproveBookingGnSubMenu({
    required this.queryType,
    required this.icon,
    required this.title,
  });

  /// Query `?type=` gửi kèm khi navigate.
  final String queryType;

  /// Icon hiển thị.
  final IconData icon;

  /// Tiêu đề hiển thị.
  final String title;
}

/// Widget menu tile cho menu Duyệt ĐX/NN.
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
