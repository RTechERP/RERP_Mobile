import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../base/network/dio/dio_interceptor.dart';
import '../common/app/app_config.dart';
import '../common/config/api_config.dart';
import '../common/local_data/shared_pref.dart';
import '../common/logger/index.dart';
import '../common/utils/snack_bar_helper.dart';
import '../features/auth/data/datasource/service/auth_service.dart';
import '../features/auth/data/repository/auth_repo.dart';
import '../features/auth/data/repository/auth_repo_impl.dart';
import '../features/auth/view/bloc/auth_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/service/booking_vehicle_service.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repo.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/view/bloc/booking_vehicle_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/data/datasource/service/meeting_room_service.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/data/repository/meeting_room_repo.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/data/repository/meeting_room_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/view/bloc/meeting_room_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/data/datasource/service/lunch_service.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/data/repository/lunch_repo.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/data/repository/lunch_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/view/bloc/lunch_bloc.dart';
import '../features/workplace/app/reports/data/datasource/service/report_service.dart';
import '../features/workplace/app/reports/data/repository/report_repo.dart';
import '../features/workplace/app/reports/data/repository/report_repo_impl.dart';
import '../features/workplace/app/reports/view/ad/view/bloc/ad_bloc.dart';
import '../features/workplace/app/reports/view/agv/view/bloc/agv_bloc.dart';
import '../features/workplace/app/reports/view/hr/view/bloc/hr_bloc.dart';
import '../features/workplace/app/reports/view/marketing/view/bloc/marketing_bloc.dart';
import '../features/workplace/app/reports/view/sale/view/bloc/sale_bloc.dart';
import '../features/workplace/app/reports/view/tech/view/bloc/tech_bloc.dart';
import '../features/workplace/view/bloc/workspace_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // ===== COMMON =====
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());

  getIt.registerLazySingleton<LogUtils>(() => LogUtils());

  getIt.registerLazySingleton<SnackBarHelper>(() => SnackBarHelper());

  /// ===== NETWORK =====
  getIt.registerLazySingleton<Dio>(() {
    final baseUrl = AppConfig.baseUrl;

    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: ApiConfig.connectTimeout),
        receiveTimeout: Duration(seconds: ApiConfig.receiveTimeout),
        receiveDataWhenStatusError: true,
        headers: const {
          'accept': 'application/json',
          'content-Type': 'Application/json',
        },
      ),
    );
    if (AppConfig.enableDioLog) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: false,
          responseHeader: false,
          requestBody: false,
          responseBody: false,
          request: false,
          logPrint: printDebug,
        ),
      );
    }
    dio.interceptors.add(DioInterceptor());
    return dio;
  });

  /// ===== SERVICES =====
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<Dio>()));

  getIt.registerLazySingleton<ReportService>(() => ReportService(getIt<Dio>()));

  getIt.registerLazySingleton<MeetingRoomService>(
    () => MeetingRoomService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<BookingVehicleService>(
    () => BookingVehicleService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<LunchService>(() => LunchService(getIt<Dio>()));

  /// ===== REPOSITORY =====
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthService>()),
  );

  getIt.registerLazySingleton<ReportRepo>(
    () => ReportRepoImpl(getIt<ReportService>()),
  );

  getIt.registerLazySingleton<MeetingRoomRepo>(
    () => MeetingRoomRepoImpl(getIt<MeetingRoomService>()),
  );

  getIt.registerLazySingleton<BookingVehicleRepo>(
    () => BookingVehicleRepoImpl(getIt<BookingVehicleService>()),
  );

  getIt.registerLazySingleton<LunchRepo>(
    () => LunchRepoImpl(getIt<LunchService>()),
  );

  /// ===== BLOCS =====
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(getIt<AuthRepo>(), getIt<LogUtils>()),
  );
  getIt.registerFactory<TechBloc>(
    () => TechBloc(getIt<ReportRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );
  getIt.registerFactory<WorkspaceBloc>(() => WorkspaceBloc(getIt<LogUtils>()));
  getIt.registerFactory<HrBloc>(
    () => HrBloc(getIt<ReportRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<MarketingBloc>(
    () => MarketingBloc(
      getIt<ReportRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );
  getIt.registerFactory<AgvBloc>(
    () => AgvBloc(getIt<ReportRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );
  getIt.registerFactory<AdBloc>(
    () => AdBloc(getIt<ReportRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );
  getIt.registerFactory<SaleBloc>(
    () => SaleBloc(getIt<ReportRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<MeetingRoomBloc>(
    () => MeetingRoomBloc(
      getIt<MeetingRoomRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<BookingVehicleBloc>(
    () => BookingVehicleBloc(
      getIt<BookingVehicleRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<LunchBloc>(
    () => LunchBloc(getIt<LunchRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );
}
