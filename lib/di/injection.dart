import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../common/app/app_env.dart';
import '../common/local_data/shared_pref.dart';
import '../features/auth/data/datasource/service/auth_service.dart';
import '../features/auth/data/repository/auth_repo.dart';
import '../features/auth/data/repository/auth_repo_impl.dart';
import '../features/auth/view/bloc/auth_bloc.dart';
import '../features/workplace/app/reports/view/hr/view/bloc/hr_bloc.dart';
import '../features/workplace/app/reports/view/tech/view/bloc/tech_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies(AppEnv env) {
  // ===== COMMON =====
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());

  /// ===== NETWORK =====
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.20.30.149:8088/rerpapi/api', // TODO: đổi baseUrl
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    return dio;
  });

  /// ===== SERVICES =====
  getIt.registerLazySingleton<AuthService>(
        () => AuthService(getIt<Dio>()),
  );

  /// ===== REPOSITORY =====
  getIt.registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(getIt<AuthService>()),
  );

  /// ===== BLOCS =====
  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthRepo>()));
  getIt.registerFactory<TechBloc>(() => TechBloc());
  getIt.registerFactory<HrBloc>(() => HrBloc());

  // ===== THEO ENV =====
  switch (env) {
    case AppEnv.debug:
      break;
    case AppEnv.production:
      break;
    case AppEnv.staging:
      break;
  }
}