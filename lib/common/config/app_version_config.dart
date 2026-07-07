import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

import '../../base/bloc/index.dart';
import '../../di/injection.dart';
import '../../features/version/view/bloc/app_version_bloc.dart';

class AppVersionConfig {
  static const String androidStoreUrl =
      'https://play.google.com/store/apps/details?id=com.rtc.erp';

  static const String iosStoreUrl =
      'https://apps.apple.com/us/app/rerp/id6781107264';

  static String? _cachedAppVersion;
  static String _minSupportedVersion = '1.1.0';

  static String get currentStoreUrl =>
      Platform.isIOS ? iosStoreUrl : androidStoreUrl;

  static String get currentAppVersion => _cachedAppVersion ?? '0.0.0';

  static String get minSupportedVersion => _minSupportedVersion;

  static Future<void> preloadCurrentVersion() async {
    final info = await PackageInfo.fromPlatform();
    _cachedAppVersion = info.version;
  }

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
    return _isOlderThan(currentAppVersion, _minSupportedVersion);
  }

  static Future<void> loadMinSupportedVersion() async {
    final bloc = getIt<AppVersionBloc>();
    bloc.add(const AppVersionEvent.init());

    await for (final state in bloc.stream) {
      if (state.status == BaseStateStatus.success && state.appVersion != null) {
        _minSupportedVersion = state.appVersion!.minSupportedVersion ?? '';
        break;
      }
      if (state.status == BaseStateStatus.failed) {
        break;
      }
    }
  }
}
