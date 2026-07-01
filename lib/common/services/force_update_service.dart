import 'dart:io';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/app_version_config.dart';

class ForceUpdateService {
  /// Mở Google Play / App Store tương ứng với platform.
  static Future<void> openStore() async {
    final uri = Uri.parse(AppVersionConfig.currentStoreUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Thoát app ngay lập tức.
  static void exitApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }

  /// Mở store rồi thoát app.
  static Future<void> openStoreAndExit() async {
    await openStore();
    exitApp();
  }
}