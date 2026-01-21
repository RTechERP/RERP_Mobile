import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'base/bloc/app_bloc_observer.dart';
import 'common/app/app_initializer.dart';

Future<void> bootstrap(String envFile) async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.init(envFile);

  Bloc.observer = const AppBlocObserver();

  runApp(const App());
}
