import 'package:url_launcher/url_launcher.dart';

import '../../config/index.dart';
import '../../utils/app_exit_handler.dart';


class ForceUpdateService {
  /// Mở Google Play / App Store tương ứng với platform.
  static Future<void> openStore() async {
    final uri = Uri.parse(AppVersionConfig.currentStoreUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Thoát app ngay lập tức, hoàn toàn.
  static void exitApp() => AppExitHandler.exitApp();

  /// Mở store rồi thoát app.
  static Future<void> openStoreAndExit() async {
    await openStore();
    exitApp();
  }
}