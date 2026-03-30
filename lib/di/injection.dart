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
import '../features/workplace/app/reg_work/view/pages/leave/data/datasource/service/leave_service.dart';
import '../features/workplace/app/reg_work/view/pages/leave/data/repository/leave_repo.dart';
import '../features/workplace/app/reg_work/view/pages/leave/data/repository/leave_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/leave/view/bloc/leave_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/data/datasource/service/lunch_service.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/data/repository/lunch_repo.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/data/repository/lunch_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/view/bloc/lunch_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/data/datasource/service/in_out_service.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/data/repository/in_out_repo.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/data/repository/in_out_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/view/bloc/in_out_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/missed/data/datasource/service/missed_service.dart';
import '../features/workplace/app/reg_work/view/pages/missed/data/repository/missed_repo.dart';
import '../features/workplace/app/reg_work/view/pages/missed/data/repository/missed_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/missed/view/bloc/missed_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/data/datasource/service/wfh_service.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/data/repository/wfh_repo.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/data/repository/wfh_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/view/bloc/wfh_bloc.dart';
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

  getIt.registerLazySingleton<InOutService>(() => InOutService(getIt<Dio>()));

  getIt.registerLazySingleton<WfhService>(() => WfhService(getIt<Dio>()));

  getIt.registerLazySingleton<MissedService>(() => MissedService(getIt<Dio>()));

  getIt.registerLazySingleton<LeaveService>(() => LeaveService(getIt<Dio>()));

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

  getIt.registerLazySingleton<InOutRepo>(
    () => InOutRepoImpl(getIt<InOutService>()),
  );

  getIt.registerLazySingleton<WfhRepo>(() => WfhRepoImpl(getIt<WfhService>()));

  getIt.registerLazySingleton<MissedRepo>(
    () => MissedRepoImpl(getIt<MissedService>()),
  );

  getIt.registerLazySingleton<LeaveRepo>(
    () => LeaveRepoImpl(getIt<LeaveService>()),
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

  getIt.registerFactory<InOutBloc>(
    () => InOutBloc(getIt<InOutRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<WfhBloc>(
    () => WfhBloc(getIt<WfhRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<MissedBloc>(
    () => MissedBloc(getIt<MissedRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<LeaveBloc>(
    () => LeaveBloc(getIt<LeaveRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );
}
