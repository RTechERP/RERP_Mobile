import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'base/bloc/app_bloc_observer.dart';
import 'common/app/app_initializer.dart';

Future<void> bootstrap(String envFile) async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init(envFile);

  Bloc.observer = const AppBlocObserver();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('vi', 'VN')],
      path: 'assets/trans',
      fallbackLocale: const Locale('vi', 'VN'),
      child: const App(),
    ),
  );
}
