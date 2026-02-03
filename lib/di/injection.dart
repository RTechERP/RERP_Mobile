import 'package:get_it/get_it.dart';
import '../common/app/app_env.dart';
import '../common/local_data/shared_pref.dart';
import '../features/workplace/app/reports/view/tech/view/bloc/tech_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies(AppEnv env) {
  // ===== COMMON =====
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());


  /// ✅ Đăng ký TechBloc
  getIt.registerFactory<TechBloc>(() => TechBloc());

  // ===== THEO ENV =====
  switch (env) {
    case AppEnv.debug:
      // register API dev
      break;
    case AppEnv.production:
      // register API prod
      break;
    case AppEnv.staging:
      break;
  }
}
