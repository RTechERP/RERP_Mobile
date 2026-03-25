import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../di/injection.dart';
import 'app_config.dart';

class AppInitializer {
  static Future<void> init(String envFile) async {
    await dotenv.load(fileName: envFile);
    await AppConfig.load();
    configureDependencies();
  }
}
