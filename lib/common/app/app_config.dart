import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_env.dart';

class AppConfig {
  AppConfig._();

  static late AppEnv env;
  static late String baseUrl;
  static late bool enableDioLog;
  static late String appName;

  static bool get isDebug => env == AppEnv.debug;
  static bool get isProduction => env == AppEnv.production;

  static Future<void> load() async {
    final envString =
        dotenv.env['ENV'] ?? dotenv.env['APP_ENV'] ?? 'debug';

    env = AppEnv.fromString(envString);

    baseUrl = dotenv.env['BASE_URL'] ?? '';
    enableDioLog = dotenv.env['LOG_DIO'] == 'true';
    appName = dotenv.env['APP_NAME'] ?? 'RTC ERP';
  }
}
