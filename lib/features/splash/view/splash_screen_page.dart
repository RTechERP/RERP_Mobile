import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../base/widgets/base_scaffold.dart';
import '../../../common/app_theme/app_styles.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    /// Fake init (API, local storage, token check...)
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      /// TODO: check auth / token ở đây
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(size: 80),
            const SizedBox(height: 16),
            CircularProgressIndicator(),
            const SizedBox(height: 12),
            Text(
              'RTC ERP',
              style: AppStyles.subtitle1
            ),
          ],
        ),
      ),
    );
  }
}
