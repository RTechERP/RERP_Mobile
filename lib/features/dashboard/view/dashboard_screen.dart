// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình dashboard chính - quản lý bottom navigation và khởi tạo các tabs (tin nhắn, workplace, newsfeed, danh bạ, more)

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../common/utils/bottom_bar.dart';
import '../../../routes/route_names.dart';
import '../../auth/view/bloc/auth_bloc.dart';
import '../../contact/view/contact_screen.dart';
import '../../message/view/message_screen.dart';
import '../../more/view/more_screen.dart';
import '../../workplace/view/workspace_screen.dart';
import 'newsfeed/newsfeed_screen.dart';

/// DashboardScreen là màn hình chính sau khi đăng nhập.
///
/// Chứa 5 tabs: Tin nhắn, Workplace, Newsfeed (Bảng tin), Danh bạ, More.
/// Mỗi tab được render trong PersistentBottomNavBar.
/// AuthBloc lắng nghe trạng thái đăng nhập, tự động navigate về login nếu hết phiên.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final PersistentTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = PersistentTabController(initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous.isAuthenticated != current.isAuthenticated,
      listener: (context, state) {
        if (!state.isAuthenticated) {
          context.go(RouteNames.login);
        }
      },
      child: BottomBarDashboard(
        context: context,
        controller: _tabController,
        screens: const [
          MessageScreen(),
          WorkPlaceScreen(),
          NewsFeedScreen(),
          ContactScreen(),
          MoreScreen(),
        ],
        items: [
          navItem(
            Icons.message_outlined,
            'dashboard.chat'.tr(),
            activeColorPrimary: Colors.deepOrange,
          ),
          navItem(
            Icons.keyboard_command_key_outlined,
            'dashboard.workplace'.tr(),
            activeColorPrimary: Colors.deepOrange,
          ),
          navItem(
            Icons.dashboard,
            'dashboard.feeds'.tr(),
            activeColorPrimary: Colors.deepOrange,
          ),
          navItem(
            Icons.contact_phone_outlined,
            'dashboard.contacts'.tr(),
            activeColorPrimary: Colors.deepOrange,
          ),
          navItem(
            Icons.person,
            'dashboard.personal'.tr(),
            activeColorPrimary: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}