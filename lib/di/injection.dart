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
import '../features/contact/data/datasource/services/contact_service.dart';
import '../features/contact/data/repository/contact_repo.dart';
import '../features/contact/data/repository/contact_repo_impl.dart';
import '../features/contact/view/bloc/contact_bloc.dart';
import '../features/more/data/datasource/service/more_service.dart';
import '../features/more/data/repository/more_repo.dart';
import '../features/more/data/repository/more_repo_impl.dart';
import '../features/more/view/settings/notification/bloc/notification_bloc.dart';
import '../features/dashboard/view/newsfeed/data/datasource/service/newsfeed_service.dart';
import '../features/dashboard/view/newsfeed/data/repository/newsfeed_repo.dart';
import '../features/dashboard/view/newsfeed/data/repository/newsfeed_repository.dart';
import '../features/dashboard/view/newsfeed/view/bloc/newsfeed_bloc.dart';
import '../features/version/data/datasource/service/app_version_service.dart';
import '../features/version/data/repository/app_version_repo.dart';
import '../features/version/data/repository/app_version_repo_impl.dart';
import '../features/version/view/bloc/app_version_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/service/booking_vehicle_service.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repo.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/view/bloc/booking_vehicle_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/contract_registration/data/datasource/service/contract_registration_service.dart';
import '../features/workplace/app/reg_general/view/pages/contract_registration/data/repository/contract_registration_repo.dart';
import '../features/workplace/app/reg_general/view/pages/contract_registration/data/repository/contract_registration_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/contract_registration/view/bloc/contract_registration_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/data/datasource/service/meeting_room_service.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/data/repository/meeting_room_repo.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/data/repository/meeting_room_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/view/bloc/meeting_room_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/personal_assets/data/datasource/service/personal_asset_service.dart';
import '../features/workplace/app/reg_general/view/pages/personal_assets/data/repository/personal_asset_repo.dart';
import '../features/workplace/app/reg_general/view/pages/personal_assets/data/repository/pesonal_asset_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/personal_assets/view/bloc/personal_asset_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/poll/data/datasource/service/poll_service.dart';
import '../features/workplace/app/reg_general/view/pages/poll/data/repository/poll_repo.dart';
import '../features/workplace/app/reg_general/view/pages/poll/data/repository/poll_repository.dart';
import '../features/workplace/app/reg_general/view/pages/poll/view/bloc/poll_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/data/datasource/service/stationery_service.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/data/repository/stationery_repo.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/data/repository/stationery_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/view/bloc/stationery_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/stamp/data/datasource/service/stamp_service.dart';
import '../features/workplace/app/reg_general/view/pages/stamp/data/repository/stamp_repo.dart';
import '../features/workplace/app/reg_general/view/pages/stamp/data/repository/stamp_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/stamp/view/bloc/stamp_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/data/datasource/service/work_requirement_service.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/data/repository/work_requirement_repo.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/data/repository/work_requirement_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/view/bloc/work_requirement_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/idea_registration/data/datasource/service/idea_registration_service.dart';
import '../features/workplace/app/reg_general/view/pages/idea_registration/data/repository/idea_registration_repo.dart';
import '../features/workplace/app/reg_general/view/pages/idea_registration/data/repository/idea_registration_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/idea_registration/view/bloc/idea_registration_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/work_category/data/datasource/service/work_category_service.dart';
import '../features/workplace/app/reg_general/view/pages/work_category/data/repository/work_category_repo.dart';
import '../features/workplace/app/reg_general/view/pages/work_category/data/repository/work_category_repo_impl.dart';
import '../features/workplace/app/reg_general/view/pages/work_category/view/bloc/work_category_bloc.dart';
import '../features/workplace/app/general_form/data/datasource/service/general_form_service.dart';
import '../features/workplace/app/general_form/data/repository/general_form_repo.dart';
import '../features/workplace/app/general_form/data/repository/general_form_repo_impl.dart';
import '../features/workplace/app/general_form/view/bloc/general_form_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/leave/data/datasource/service/leave_service.dart';
import '../features/workplace/app/reg_work/view/pages/leave/data/repository/leave_repo.dart';
import '../features/workplace/app/reg_work/view/pages/leave/data/repository/leave_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/leave/view/bloc/leave_bloc.dart';
import '../features/workplace/app/summary_work/leave/data/datasource/service/summary_leave_service.dart';
import '../features/workplace/app/summary_work/leave/data/repository/summary_leave_repo.dart';
import '../features/workplace/app/summary_work/leave/data/repository/summary_leave_repo_impl.dart';
import '../features/workplace/app/summary_work/leave/view/bloc/summary_leave_bloc.dart';
import '../features/workplace/app/summary_work/in_out/data/datasource/service/summary_in_out_service.dart';
import '../features/workplace/app/summary_work/in_out/data/repository/summary_in_out_repo.dart';
import '../features/workplace/app/summary_work/in_out/data/repository/summary_in_out_repo_impl.dart';
import '../features/workplace/app/summary_work/in_out/view/bloc/summary_in_out_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/data/datasource/service/overnight_service.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/data/repository/overnight_repo.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/data/repository/overnight_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/view/bloc/overnight_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/data/datasource/service/overtime_service.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/data/repository/overtime_repo.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/data/repository/overtime_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/view/bloc/overtime_bloc.dart';
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
import '../features/workplace/app/reg_work/view/pages/work_trip/data/datasource/service/work_trip_service.dart';
import '../features/workplace/app/reg_work/view/pages/work_trip/data/repository/work_trip_repo.dart';
import '../features/workplace/app/reg_work/view/pages/work_trip/data/repository/work_trip_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/work_trip/view/bloc/work_trip_bloc.dart';
import '../features/workplace/app/reports/data/datasource/service/report_service.dart';
import '../features/workplace/app/reports/data/repository/report_repo.dart';
import '../features/workplace/app/reports/data/repository/report_repo_impl.dart';
import '../features/workplace/app/reports/view/ad/view/bloc/ad_bloc.dart';
import '../features/workplace/app/reports/view/agv/view/bloc/agv_bloc.dart';
import '../features/workplace/app/reports/view/hr/view/bloc/hr_bloc.dart';
import '../features/workplace/app/reports/view/accountant/view/bloc/accountant_bloc.dart';
import '../features/workplace/app/reports/view/marketing/view/bloc/marketing_bloc.dart';
import '../features/workplace/app/reports/view/sale/view/bloc/sale_bloc.dart';
import '../features/workplace/app/reports/view/tech/view/bloc/tech_bloc.dart';
import '../features/workplace/app/signature/data/datasource/service/signature_service.dart';
import '../features/workplace/app/signature/data/repository/signature_repo.dart';
import '../features/workplace/app/signature/data/repository/signature_repo_impl.dart';
import '../features/workplace/app/signature/view/bloc/my_signature_bloc.dart';
import '../features/workplace/app/summary_work/wfh/data/datasource/service/summary_wfh_service.dart';
import '../features/workplace/app/summary_work/wfh/data/repository/summary_wfh_repo.dart';
import '../features/workplace/app/summary_work/wfh/data/repository/summary_wfh_repo_impl.dart';
import '../features/workplace/app/summary_work/wfh/view/bloc/summary_wfh_bloc.dart';
import '../features/workplace/app/summary_work/missed/data/datasource/service/summary_missed_service.dart';
import '../features/workplace/app/summary_work/missed/data/repository/summary_missed_repo.dart';
import '../features/workplace/app/summary_work/missed/data/repository/summary_missed_repo_impl.dart';
import '../features/workplace/app/summary_work/missed/view/bloc/summary_missed_bloc.dart';
import '../features/workplace/app/summary_work/overnight/data/datasource/service/summary_overnight_service.dart';
import '../features/workplace/app/summary_work/overnight/data/repository/summary_overnight_repo.dart';
import '../features/workplace/app/summary_work/overnight/data/repository/summary_overnight_repo_impl.dart';
import '../features/workplace/app/summary_work/overnight/view/bloc/summary_overnight_bloc.dart';
import '../features/workplace/app/summary_work/overtime/data/datasource/service/summary_overtime_service.dart';
import '../features/workplace/app/summary_work/overtime/data/repository/summary_overtime_repo.dart';
import '../features/workplace/app/summary_work/overtime/data/repository/summary_overtime_repo_impl.dart';
import '../features/workplace/app/summary_work/overtime/view/bloc/summary_overtime_bloc.dart';
import '../features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/service/sale_gdn_service.dart';
import '../features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/repository/sale_gdn_repo.dart';
import '../features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/repository/sale_gdn_repo_impl.dart';
import '../features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/bloc/sale_gdn_bloc.dart';
import '../features/workplace/app/week_plan/data/datasource/service/week_plan_service.dart';
import '../features/workplace/app/week_plan/data/repository/week_plan_repo.dart';
import '../features/workplace/app/week_plan/data/repository/week_plan_repo_impl.dart';
import '../features/workplace/app/week_plan/view/bloc/week_plan_approval_bloc.dart';
import '../features/workplace/app/week_plan/view/bloc/week_plan_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/salary/data/datasource/service/salary_service.dart';
import '../features/workplace/app/reg_work/view/pages/salary/data/datasource/service/salary_pin_service.dart';
import '../features/workplace/app/reg_work/view/pages/salary/data/repository/salary_repo.dart';
import '../features/workplace/app/reg_work/view/pages/salary/data/repository/salary_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/salary/data/repository/salary_pin_repo.dart';
import '../features/workplace/app/reg_work/view/pages/salary/data/repository/salary_pin_repo_impl.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/bloc/salary_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/bloc/timekeeping_bloc.dart';
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

  getIt.registerLazySingleton<OvertimeService>(
    () => OvertimeService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<WorkTripService>(
    () => WorkTripService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<OverNightService>(
    () => OverNightService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<WorkCategoryService>(
    () => WorkCategoryService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<PersonalAssetService>(
    () => PersonalAssetService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<MoreService>(() => MoreService(getIt<Dio>()));

  getIt.registerLazySingleton<StationeryService>(
    () => StationeryService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<StampService>(() => StampService(getIt<Dio>()));

  getIt.registerLazySingleton<WorkRequirementService>(
    () => WorkRequirementService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<IdeaRegistrationService>(
    () => IdeaRegistrationService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<ContractRegistrationService>(
    () => ContractRegistrationService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<WeekPlanService>(
    () => WeekPlanService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SalaryService>(() => SalaryService(getIt<Dio>()));

  getIt.registerLazySingleton<PollService>(() => PollService(getIt<Dio>()));

  getIt.registerLazySingleton<GeneralFormService>(
    () => GeneralFormService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<NewsfeedService>(
    () => NewsfeedService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AppVersionService>(
    () => AppVersionService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<ContactService>(
    () => ContactService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SaleGdnService>(
    () => SaleGdnService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SignatureService>(
    () => SignatureService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SummaryLeaveService>(
    () => SummaryLeaveService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SummaryInOutService>(
    () => SummaryInOutService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SummaryWfhService>(
        () => SummaryWfhService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SummaryMissedService>(
        () => SummaryMissedService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SummaryOvernightService>(
        () => SummaryOvernightService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SummaryOvertimeService>(
        () => SummaryOvertimeService(getIt<Dio>()),
  );

  /// ===== REPOSITORY =====
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      getIt<AuthService>(),
      getIt<MoreRepo>(),
      getIt<LocalStorage>(),
    ),
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

  getIt.registerLazySingleton<OvertimeRepo>(
    () => OvertimeRepoImpl(getIt<OvertimeService>()),
  );

  getIt.registerLazySingleton<WorkTripRepo>(
    () => WorkTripRepoImpl(getIt<WorkTripService>()),
  );

  getIt.registerLazySingleton<OvernightRepo>(
    () => OvernightRepoImpl(getIt<OverNightService>()),
  );

  getIt.registerLazySingleton<WorkCategoryRepo>(
    () => WorkCategoryRepoImpl(getIt<WorkCategoryService>()),
  );

  getIt.registerLazySingleton<PersonalAssetRepo>(
    () => PersonalAssetRepoImpl(getIt<PersonalAssetService>()),
  );

  getIt.registerLazySingleton<MoreRepo>(
    () => MoreRepoImpl(getIt<MoreService>()),
  );

  getIt.registerLazySingleton<StationeryRepo>(
    () => StationeryRepoImpl(getIt<StationeryService>()),
  );

  getIt.registerLazySingleton<StampRepo>(
    () => StampRepoImpl(getIt<StampService>()),
  );

  getIt.registerLazySingleton<WorkRequirementRepo>(
    () => WorkRequirementRepoImpl(getIt<WorkRequirementService>()),
  );

  getIt.registerLazySingleton<IdeaRegistrationRepo>(
    () => IdeaRegistrationRepoImpl(getIt<IdeaRegistrationService>()),
  );

  getIt.registerLazySingleton<ContractRegistrationRepo>(
    () => ContractRegistrationRepoImpl(getIt<ContractRegistrationService>()),
  );

  getIt.registerLazySingleton<WeekPlanRepo>(
    () => WeekPlanRepoImpl(getIt<WeekPlanService>()),
  );

  getIt.registerLazySingleton<SalaryRepo>(
    () => SalaryRepoImpl(getIt<SalaryService>()),
  );

  getIt.registerLazySingleton<PollRepo>(
    () => PollRepoImpl(getIt<PollService>()),
  );

  getIt.registerLazySingleton<GeneralFormRepo>(
    () => GeneralFormRepoImpl(getIt<GeneralFormService>()),
  );

  getIt.registerLazySingleton<NewsfeedRepo>(
    () => NewsfeedRepoImpl(getIt<NewsfeedService>()),
  );

  getIt.registerLazySingleton<AppVersionRepo>(
    () => AppVersionRepoImpl(getIt<AppVersionService>()),
  );

  getIt.registerLazySingleton<SaleGdnRepo>(
    () => SaleGdnRepoImpl(getIt<SaleGdnService>()),
  );

  getIt.registerLazySingleton<SignatureRepo>(
    () => SignatureRepoImpl(getIt<SignatureService>()),
  );

  getIt.registerLazySingleton<SummaryLeaveRepo>(
    () => SummaryLeaveRepoImpl(getIt<SummaryLeaveService>()),
  );

  getIt.registerLazySingleton<SummaryInOutRepo>(
    () => SummaryInOutRepoImpl(getIt<SummaryInOutService>()),
  );

  getIt.registerLazySingleton<SummaryWfhRepo>(
    () => SummaryWfhRepoImpl(getIt<SummaryWfhService>()),
  );

  getIt.registerLazySingleton<SummaryMissedRepo>(
    () => SummaryMissedRepoImpl(getIt<SummaryMissedService>()),
  );

  getIt.registerLazySingleton<SummaryOvernightRepo>(
    () => SummaryOvernightRepoImpl(getIt<SummaryOvernightService>()),
  );

  getIt.registerLazySingleton<SummaryOvertimeRepo>(
    () => SummaryOvertimeRepoImpl(getIt<SummaryOvertimeService>()),
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

  getIt.registerFactory<OvertimeBloc>(
    () => OvertimeBloc(
      getIt<OvertimeRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<WorkTripBloc>(
    () => WorkTripBloc(
      getIt<WorkTripRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<OvernightBloc>(
    () => OvernightBloc(
      getIt<OvernightRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<WorkCategoryBloc>(
    () => WorkCategoryBloc(
      getIt<WorkCategoryRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<PersonalAssetBloc>(
    () => PersonalAssetBloc(
      getIt<PersonalAssetRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<NotificationBloc>(
    () => NotificationBloc(
      getIt<MoreRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<StationeryBloc>(
    () => StationeryBloc(
      getIt<StationeryRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<WorkRequirementBloc>(
    () => WorkRequirementBloc(
      getIt<WorkRequirementRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<IdeaRegistrationBloc>(
    () => IdeaRegistrationBloc(
      getIt<IdeaRegistrationRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<ContractRegistrationBloc>(
    () => ContractRegistrationBloc(
      getIt<ContractRegistrationRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<StampBloc>(
    () => StampBloc(getIt<StampRepo>(), getIt<AuthRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<WeekPlanBloc>(
    () => WeekPlanBloc(
      getIt<WeekPlanRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
      getIt<LocalStorage>(),
    ),
  );

  getIt.registerFactory<WeekPlanApprovalBloc>(
    () => WeekPlanApprovalBloc(getIt<WeekPlanRepo>(), getIt<LogUtils>()),
  );

  getIt.registerLazySingleton<SalaryPinService>(
    () => SalaryPinService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<SalaryPinRepo>(
    () => SalaryPinRepoImpl(getIt<SalaryPinService>()),
  );

  getIt.registerFactory<SalaryBloc>(
    () => SalaryBloc(
      getIt<SalaryRepo>(),
      getIt<SalaryPinRepo>(),
      getIt<AuthRepo>(),
      getIt<OvertimeRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<TimekeepingBloc>(
    () => TimekeepingBloc(
      getIt<SalaryRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<PollBloc>(
    () => PollBloc(getIt<PollRepo>(), getIt<LogUtils>()),
  );
  getIt.registerFactory<NewsfeedBloc>(
    () => NewsfeedBloc(getIt<NewsfeedRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<AppVersionBloc>(
    () => AppVersionBloc(getIt<AppVersionRepo>(), getIt<LogUtils>()),
  );

  getIt.registerLazySingleton<ContactRepo>(
    () => ContactRepoImpl(getIt<ContactService>()),
  );

  getIt.registerFactory<ContactBloc>(() => ContactBloc(getIt<ContactRepo>()));

  getIt.registerFactory<AccountantBloc>(
    () => AccountantBloc(
      getIt<ReportRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<GeneralFormBloc>(
    () => GeneralFormBloc(getIt<GeneralFormRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<SaleGdnBloc>(
    () => SaleGdnBloc(getIt<SaleGdnRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<MySignatureBloc>(
    () => MySignatureBloc(getIt<SignatureRepo>(), getIt<LogUtils>()),
  );

  getIt.registerFactory<SummaryLeaveBloc>(
    () => SummaryLeaveBloc(
      getIt<SummaryLeaveRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<SummaryInOutBloc>(
    () => SummaryInOutBloc(
      getIt<SummaryInOutRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<SummaryWfhBloc>(
        () => SummaryWfhBloc(
      getIt<SummaryWfhRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<SummaryMissedBloc>(
        () => SummaryMissedBloc(
      getIt<SummaryMissedRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<SummaryOvernightBloc>(
        () => SummaryOvernightBloc(
      getIt<SummaryOvernightRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );

  getIt.registerFactory<SummaryOvertimeBloc>(
        () => SummaryOvertimeBloc(
      getIt<SummaryOvertimeRepo>(),
      getIt<AuthRepo>(),
      getIt<LogUtils>(),
    ),
  );
}
