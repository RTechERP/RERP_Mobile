import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/routes/route_names.dart';

import 'common/app_theme/app_colors.dart';
import 'common/config/app_version_config.dart';
import 'common/utils/dialog/dialog_service.dart';
import 'features/auth/data/repository/auth_repository.dart';

class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }


  Future<void> _init() async {
    if (AppVersionConfig.isForceUpdateRequired()) {
      if (!mounted) return;
      await DialogService.showForceUpdate(context: context);
      return;
    }

    final isLoggedIn = await AuthRepository.checkLogin();

    if (!mounted) return;

    if (isLoggedIn) {
      context.go(RouteNames.dashboard);
    } else {
      context.go(RouteNames.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ❗ render tạm 1 widget trống
    return const Scaffold(
      backgroundColor: AppColors.grey_bg,
      body: SizedBox.shrink(),
    );
  }
}
