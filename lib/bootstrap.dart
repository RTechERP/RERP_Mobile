import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'base/bloc/app_bloc_observer.dart';
import 'common/app/app_initializer.dart';

/// Khởi tạo app với file env đúng entrypoint:
/// - [main_debug] → `assets/env/.env.debug` (iOS scheme **dev**)
/// - [main_production] → `assets/env/.env.production` (iOS scheme **live**)
Future<void> bootstrap(String envFile) async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init(envFile);

  Bloc.observer = const AppBlocObserver();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favorites');

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('vi', 'VN')],
      path: 'assets/trans',
      fallbackLocale: const Locale('vi', 'VN'),
      child: const App(),
    ),
  );
  FlutterNativeSplash.remove();
}