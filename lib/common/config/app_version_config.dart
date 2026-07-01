import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

class AppVersionConfig {
  /// Phiên bản tối thiểu mà thiết bị phải có để tiếp tục sử dụng app.
  /// TODO: thay bằng API backend khi có.
  static const String minSupportedVersion = '1.1.0';

  /// URL store Android (Google Play).
  static const String androidStoreUrl =
      'https://play.google.com/store/apps/details?id=com.rtc.erp';

  /// URL store iOS (App Store).
  static const String iosStoreUrl =
      'https://apps.apple.com/us/app/rerp/id6781107264';

  static String? _cachedAppVersion;

  static String get currentStoreUrl =>
      Platform.isIOS ? iosStoreUrl : androidStoreUrl;

  static String get currentAppVersion => _cachedAppVersion ?? '0.0.0';

  /// Cache version của thiết bị. Gọi 1 lần ở AppInitializer.
  static Future<void> preloadCurrentVersion() async {
    final info = await PackageInfo.fromPlatform();
    _cachedAppVersion = info.version;
  }

  /// So sánh 2 version dạng x.y.z. Trả về true nếu [current] < [min].
  static bool _isOlderThan(String current, String min) {
    final c = current.split('.').map(int.tryParse).toList();
    final m = min.split('.').map(int.tryParse).toList();

    for (var i = 0; i < m.length; i++) {
      final cv = (i < c.length ? c[i] : 0) ?? 0;
      final mv = m[i] ?? 0;
      if (cv < mv) return true;
      if (cv > mv) return false;
    }
    return false;
  }

  static bool isForceUpdateRequired() {
    return _isOlderThan(currentAppVersion, minSupportedVersion);
  }
}
