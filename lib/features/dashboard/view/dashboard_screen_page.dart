import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../common/utils/bottom_bar.dart';

class DashboardScreenPage extends StatefulWidget {
  const DashboardScreenPage({super.key});

  @override
  State<DashboardScreenPage> createState() => _DashboardScreenPageState();
}

class _DashboardScreenPageState extends State<DashboardScreenPage> {
  late final PersistentTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = PersistentTabController(initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      context: context,
      controller: _tabController,
      screens: [
        _MessageTab(),
        _AttendanceTab(),
        _HomeTab(),
        _ContactsTab(),
        _MoreTab(),
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
          Icons.add_circle_outline_outlined,
          'dashboard.more'.tr(),
          activeColorPrimary: Colors.deepOrange,
        ),
      ],
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Home')));
  }
}

class _AttendanceTab extends StatelessWidget {
  const _AttendanceTab();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Attendance')));
  }
}

class _ContactsTab extends StatelessWidget {
  const _ContactsTab();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Danh bạ')));
  }
}

class _MessageTab extends StatelessWidget {
  const _MessageTab();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Tin nhắn')));
  }
}

class _MoreTab extends StatelessWidget {
  const _MoreTab();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Thêm')));
  }
}
