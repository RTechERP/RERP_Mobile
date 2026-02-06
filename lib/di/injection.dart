import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../common/app/app_env.dart';
import '../common/local_data/shared_pref.dart';
import '../common/logger/index.dart';
import '../features/auth/data/datasource/service/auth_service.dart';
import '../features/auth/data/repository/auth_repo.dart';
import '../features/auth/data/repository/auth_repo_impl.dart';
import '../features/auth/view/bloc/auth_bloc.dart';
import '../features/workplace/app/reports/data/datasource/service/report_service.dart';
import '../features/workplace/app/reports/data/repository/report_repo.dart';
import '../features/workplace/app/reports/data/repository/report_repo_impl.dart';
import '../features/workplace/app/reports/view/hr/view/bloc/hr_bloc.dart';
import '../features/workplace/app/reports/view/tech/view/bloc/tech_bloc.dart';
import '../features/workplace/view/bloc/workspace_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies(AppEnv env) {
  // ===== COMMON =====
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());

  getIt.registerLazySingleton<LogUtils>(() => LogUtils());

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
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<Dio>()));

  getIt.registerLazySingleton<ReportService>(() => ReportService(getIt<Dio>()));

  /// ===== REPOSITORY =====
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthService>()),
  );

  getIt.registerLazySingleton<ReportRepo>(
    () => ReportRepoImpl(getIt<ReportService>()),
  );

  /// ===== BLOCS =====
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(getIt<AuthRepo>(), getIt<LogUtils>()),
  );
  getIt.registerFactory<TechBloc>(
    () => TechBloc(getIt<ReportRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );
  getIt.registerFactory<WorkspaceBloc>(() => WorkspaceBloc(getIt<LogUtils>()));
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
