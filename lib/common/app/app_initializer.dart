import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../di/injection.dart';
import '../config/app_version_config.dart';
import '../services/firebase/firebase_initializer.dart';
import '../utils/datetime_utils.dart';
import 'app_config.dart';

class AppInitializer {
  static Future<void> init(String envFile) async {
    await dotenv.load(fileName: envFile);
    await AppConfig.load();
    configureDependencies();
    await FirebaseInitializer.init();
    await AppVersionConfig.preloadCurrentVersion();
    await AppVersionConfig.loadMinSupportedVersion();
    initializeTimeZones();
  }
}
