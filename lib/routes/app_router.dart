// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Cấu hình go_router - định nghĩa routes, ShellRoute, BlocProvider

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/contract_registration/view/bloc/contract_registration_bloc.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/contract_registration/view/pages/contract_registration_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/contract_registration/view/pages/contract_registration_add_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/contract_registration/view/pages/contract_registration_detail_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/models/booking_vehicle_model.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/favorites_adding_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/view/bloc/booking_vehicle_bloc.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/view/pages/booking_vehicle_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/meeting_room/view/pages/meeting_room_add_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/reg_general_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/work_category/view/pages/work_category_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/leave/view/pages/leave_add_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/lunch/view/pages/lunch_add_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/lunch/view/pages/lunch_detail_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/reg_work_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/work_trip/view/pages/work_trip_detail_screen.dart';
import 'package:rtc_erp/routes/route_names.dart';

import '../app_init_screen.dart';
import '../common/enums/index.dart';
import '../di/injection.dart';
import '../features/auth/view/bloc/auth_bloc.dart';
import '../features/auth/view/pages/login_screen.dart';
import '../features/dashboard/view/dashboard_screen.dart';
import '../features/more/view/settings/notification/bloc/notification_bloc.dart';
import '../features/more/view/settings/notification/page/notification_settings_screen.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/view/pages/booking_vehicle_add_screen.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/view/pages/booking_vehicle_edit_screen.dart';
import '../features/workplace/app/reg_general/view/pages/booking_vehicle/view/pages/booking_vehicle_detail_screen.dart';
import '../features/workplace/app/reg_general/view/pages/contract_registration/data/datasource/models/contract_registration_model.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/view/bloc/meeting_room_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/view/pages/meeting_room_screen.dart';
import '../features/workplace/app/reg_general/view/pages/meeting_room/view/pages/meeting_room_edit_screen.dart';
import '../features/workplace/app/reg_general/view/pages/personal_assets/data/datasource/models/personal_asset_model.dart';
import '../features/workplace/app/reg_general/view/pages/personal_assets/view/bloc/personal_asset_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/personal_assets/view/pages/personal_asset_detail_screen.dart';
import '../features/workplace/app/reg_general/view/pages/personal_assets/view/pages/personal_asset_screen.dart';
import '../features/workplace/app/reg_general/view/pages/personal_assets/view/pages/personal_property_detail_screen.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/data/datasource/models/stationery_model.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/stationery_edit_route_args.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/view/bloc/stationery_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/view/pages/stationery_add_screen.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/view/pages/stationery_edit_screen.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/view/pages/stationery_detail_screen.dart';
import '../features/workplace/app/reg_general/view/pages/stationery/view/pages/stationery_screen.dart';
import '../features/workplace/app/reg_general/view/pages/work_category/view/bloc/work_category_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/work_category/data/datasource/models/work_category_model.dart';
import '../features/workplace/app/reg_general/view/pages/work_category/view/pages/work_category_add_screen.dart';
import '../features/workplace/app/reg_general/view/pages/work_category/view/pages/work_category_detail_screen.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/data/datasource/models/work_requirement_model.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/view/bloc/work_requirement_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/view/pages/work_requirement_add_screen.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/view/pages/work_requirement_detail_screen.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/view/pages/work_requirement_edit_screen.dart';
import '../features/workplace/app/reg_general/view/pages/work_requirement/view/pages/work_requirement_screen.dart';
import '../features/workplace/app/reg_general/view/pages/idea_registration/view/bloc/idea_registration_bloc.dart';
import '../features/workplace/app/reg_general/view/pages/idea_registration/view/pages/idea_registration_screen.dart';
import '../features/workplace/app/reg_general/view/pages/idea_registration/view/pages/idea_registration_add_screen.dart';
import '../features/workplace/app/reg_general/view/pages/idea_registration/view/pages/idea_registration_edit_screen.dart';
import '../features/workplace/app/reg_general/view/pages/idea_registration/data/datasource/models/idea_registration_model.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/view/pages/in_out_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/view/pages/in_out_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/view/pages/in_out_screen.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/view/bloc/in_out_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/leave/view/bloc/leave_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/leave/data/datasource/models/leave_model.dart';
import '../features/workplace/app/reg_work/view/pages/leave/leave_detail_route_args.dart';
import '../features/workplace/app/reg_work/view/pages/leave/view/pages/leave_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/leave/view/pages/leave_screen.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/view/bloc/lunch_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/view/pages/lunch_screen.dart';
import '../features/workplace/app/reg_work/view/pages/missed/view/bloc/missed_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/missed/view/pages/missed_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/missed/view/pages/missed_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/missed/view/pages/missed_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/data/datasource/models/overnight_model.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/view/bloc/overnight_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/view/pages/overnight_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/view/pages/overnight_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/view/pages/overnight_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/view/bloc/overtime_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/view/pages/overtime_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/view/pages/overtime_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/view/pages/overtime_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/data/datasource/models/overtime_model.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/pages/finger_print_screen.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/pages/overview_screen.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/view/bloc/wfh_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/view/pages/wfh_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/view/pages/wfh_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/view/pages/wfh_screen.dart';
import '../features/workplace/app/reg_work/view/pages/work_trip/data/datasource/models/work_trip_model.dart';
import '../features/workplace/app/reg_work/view/pages/work_trip/view/bloc/work_trip_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/work_trip/view/pages/work_trip_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/work_trip/view/pages/work_trip_screen.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/bloc/salary_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/bloc/timekeeping_bloc.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/pages/salary_screen.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/pages/salary_menu_screen.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/pages/timekeeping_screen.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/pages/forgot_pin_screen.dart';
import '../features/workplace/app/reg_work/view/pages/salary/view/pages/salary_card_detail_screen.dart';
import '../features/workplace/app/reports/data/datasource/models/report_model.dart';
import '../features/workplace/app/reports/view/ad/view/bloc/ad_bloc.dart';
import '../features/workplace/app/reports/view/ad/view/pages/ad_add_screen.dart';
import '../features/workplace/app/reports/view/ad/view/pages/ad_detail_screen.dart';
import '../features/workplace/app/reports/view/ad/view/pages/ad_edit_screen.dart';
import '../features/workplace/app/reports/view/ad/view/pages/ad_screen.dart';
import '../features/workplace/app/reports/view/agv/view/bloc/agv_bloc.dart';
import '../features/workplace/app/reports/view/agv/view/pages/agv_add_screen.dart';
import '../features/workplace/app/reports/view/agv/view/pages/agv_detail_screen.dart';
import '../features/workplace/app/reports/view/agv/view/pages/agv_edit_screen.dart';
import '../features/workplace/app/reports/view/agv/view/pages/agv_screen.dart';
import '../features/workplace/app/reports/view/hr/view/bloc/hr_bloc.dart';
import '../features/workplace/app/reports/view/hr/view/pages/hr_add_screen.dart';
import '../features/workplace/app/reports/view/hr/view/pages/hr_admin_detail_screen.dart';
import '../features/workplace/app/reports/view/hr/view/pages/hr_admin_screen.dart';
import '../features/workplace/app/reports/view/hr/view/pages/hr_edit_screen.dart';
import '../features/workplace/app/reports/view/hr/view/pages/hr_lcxp_detail_screen.dart';
import '../features/workplace/app/reports/view/hr/view/pages/hr_lxcp_edit_screen.dart';
import '../features/workplace/app/reports/view/hr/view/pages/hr_lxcp_screen.dart';
import '../features/workplace/app/reports/view/marketing/view/bloc/marketing_bloc.dart';
import '../features/workplace/app/reports/view/marketing/view/pages/marketing_add_screen.dart';
import '../features/workplace/app/reports/view/marketing/view/pages/marketing_detail_screen.dart';
import '../features/workplace/app/reports/view/marketing/view/pages/marketing_edit_screen.dart';
import '../features/workplace/app/reports/view/marketing/view/pages/marketing_screen.dart';
import '../features/workplace/app/reports/view/report_screen.dart';
import '../features/workplace/app/reports/view/sale/view/bloc/sale_bloc.dart';
import '../features/workplace/app/reports/view/sale/view/pages/sale_admin_add_screen.dart';
import '../features/workplace/app/reports/view/sale/view/pages/sale_admin_detail_screen.dart';

import '../features/workplace/app/reports/view/sale/view/pages/sale_admin_edit_screen.dart';
import '../features/workplace/app/reports/view/sale/view/pages/sale_screen.dart';
import '../features/workplace/app/reports/view/sale/view/pages/sale_staff_add_screen.dart';
import '../features/workplace/app/reports/view/sale/view/pages/sale_staff_detail_screen.dart';
import '../features/workplace/app/reports/view/sale/view/pages/sale_staff_edit_screen.dart';
import '../features/workplace/app/reports/view/tech/view/bloc/tech_bloc.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_add_screen.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_detail_screen.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_edit_screen.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_screen.dart';
import '../features/workplace/app/week_plan/view/bloc/week_plan_bloc.dart';
import '../features/workplace/app/week_plan/view/pages/week_plan_add_screen.dart';
import '../features/workplace/app/week_plan/view/pages/week_plan_all_screen.dart';
import '../features/workplace/app/week_plan/view/pages/week_plan_assigned_screen.dart';
import '../features/workplace/app/week_plan/view/pages/week_plan_detail_screen.dart';
import '../features/workplace/app/week_plan/view/pages/week_plan_menu_screen.dart';
import '../features/workplace/app/week_plan/view/pages/week_plan_my_task_screen.dart';
import '../features/workplace/app/week_plan/view/pages/week_plan_related_screen.dart';
import '../features/workplace/view/bloc/workspace_bloc.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',

    routes: [
      //---(Splash)---//
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const AppInitScreen(),
      ),

      //---(Auth)---//
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<AuthBloc>()..add(const AuthEvent.init()),
            child: const LoginScreen(),
          );
        },
      ),

      //---(Dashboard)---//
      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<AuthBloc>()..add(const AuthEvent.init()),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<WorkspaceBloc>()..add(const WorkspaceEvent.init()),
              ),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.dashboard,
            builder: (context, state) => const DashboardScreen(),
          ),
        ],
      ),

      //---(RegWork)---//
      GoRoute(
        path: RouteNames.regwork,
        builder: (context, state) => const RegWorkScreen(),
      ),

      //---(Lunch)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<LunchBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.regworkLunch,
            builder: (context, state) => const LunchScreen(),
          ),
          GoRoute(
            path: RouteNames.regworkLunchDetail,
            builder: (context, state) => const LunchDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.regworkLunchAdd,
            builder: (context, state) => const LunchAddScreen(),
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<LeaveBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.regworkLeave,
            builder: (context, state) => const LeaveScreenPage(),
          ),

          GoRoute(
            path: RouteNames.regworkLeaveDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is LeaveDetailRouteArgs) {
                return LeaveDetailScreenPage(
                  phaseId: extra.phaseId,
                  detailId: extra.detailId,
                  listStartDate: extra.listStartDate,
                  listTimeOnLeave: extra.listTimeOnLeave,
                );
              }
              if (extra is LeaveItem) {
                final phaseId = extra.employeeOnLeavePhaseId ?? 0;
                return LeaveDetailScreenPage(
                  phaseId: phaseId,
                  detailId: extra.id,
                  listStartDate: extra.startDate,
                  listTimeOnLeave: extra.timeOnLeave,
                );
              }
              return const LeaveDetailScreenPage(phaseId: 0, detailId: 0);
            },
          ),
          GoRoute(
            path: RouteNames.regworkLeaveAdd,
            builder: (context, state) => const LeaveAddScreenPage(),
          ),
        ],
      ),

      //---(InOut)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<InOutBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.regworkInOut,
            builder: (context, state) => const InOutScreenPage(),
          ),
          GoRoute(
            path: RouteNames.regworkInOutDetail,
            builder: (context, state) => const InOutDetailScreenPage(),
          ),
          GoRoute(
            path: RouteNames.regworkInOutAdd,
            builder: (context, state) => const InOutAddScreenPage(),
          ),
        ],
      ),

      //---(Overtime)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<OvertimeBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.regworkOvertime,
            builder: (context, state) => const OvertimeScreenPage(),
          ),
          GoRoute(
            path: RouteNames.regworkOvertimeDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is OvertimeItem) {
                return OvertimeDetailScreenPage(item: extra);
              }
              return const OvertimeDetailScreenPage();
            },
          ),
          GoRoute(
            path: RouteNames.regworkOvertimeAdd,
            builder: (context, state) => const OvertimeAddScreenPage(),
          ),
        ],
      ),

      //---(Wfh)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<WfhBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.regworkWfh,
            builder: (context, state) => const WfhScreen(),
          ),
          GoRoute(
            path: RouteNames.regworkWfhDetail,
            builder: (context, state) => const WfhDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.regworkWfhAdd,
            builder: (context, state) => const WfhAddScreen(),
          ),
        ],
      ),

      //---(Missed)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<MissedBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.regworkMissed,
            builder: (context, state) => const MissedScreen(),
          ),
          GoRoute(
            path: RouteNames.regworkMissedDetail,
            builder: (context, state) => const MissedDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.regworkMissedAdd,
            builder: (context, state) => const MissedAddScreen(),
          ),
        ],
      ),

      //---(WorkTrip)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<WorkTripBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.regworkWorkTrip,
            builder: (context, state) => const WorkTripScreenPage(),
          ),
          GoRoute(
            path: RouteNames.regworkWorkTripAdd,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is WorkTripDetailItem) {
                return WorkTripAddScreenPage(copyFrom: extra);
              }
              return const WorkTripAddScreenPage();
            },
          ),
          GoRoute(
            path: RouteNames.regworkWorkTripDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is WorkTripItem) {
                return WorkTripDetailScreen(item: extra);
              }
              return const WorkTripDetailScreen();
            },
          ),
        ],
      ),

      //---(Overnight)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<OvernightBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.regworkOvernight,
            builder: (context, state) => const OvernightScreenPage(),
          ),
          GoRoute(
            path: RouteNames.regworkOvernightDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is OvernightItem) {
                return OvernightDetailScreen(item: extra);
              }
              return const OvernightDetailScreen();
            },
          ),
          GoRoute(
            path: RouteNames.regworkOvernightAdd,
            builder: (context, state) => const OvernightAddScreen(),
          ),
        ],
      ),

      //---(Salary)---//
      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<SalaryBloc>()),
              BlocProvider.value(value: getIt<TimekeepingBloc>()),
              // BlocProvider.value(value: getIt<FingerPrintBloc>()),

            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.salaryMenu,
            builder: (context, state) => const SalaryMenuScreen(),
          ),
          GoRoute(
            path: RouteNames.salaryPayslip,
            builder: (context, state) => const SalaryScreen(),
          ),
          GoRoute(
            path: RouteNames.salarySummary,
            builder: (context, state) => const SalaryOverviewScreen(),
          ),
          GoRoute(
            path: RouteNames.salaryFingerprint,
            builder: (context, state) => const FingerPrintScreen(),
          ),
          GoRoute(
            path: RouteNames.salaryAttendance,
            builder: (context, state) => const TimekeepingScreen(),
          ),
          GoRoute(
            path: RouteNames.salaryForgotPin,
            builder: (context, state) => const ForgotPinScreen(),
          ),
          GoRoute(
            path: RouteNames.salaryCardDetail,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;
              SalaryCardType? cardType;
              DateTime? month;
              if (extra != null) {
                cardType = extra['cardType'] as SalaryCardType?;
                month = extra['month'] as DateTime?;
              }
              return SalaryCardDetailScreen(
                cardType: cardType,
                month: month,
              );
            },
          ),
        ],
      ),

      //---(Report)---//
      GoRoute(
        path: RouteNames.report,
        builder: (context, state) => const ReportScreen(),
      ),

      //---(Tech)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<TechBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.reportITdepart,
            builder: (context, state) => const TechScreen(),
          ),
          GoRoute(
            path: RouteNames.reportITdepartAdd,
            builder: (context, state) {
              final payload = state.extra as Map<String, dynamic>?;
              final copyItems =
                  payload?['copyItems'] as List<CopyNullResponse>?;
              final projects = payload?['projects'] as List<ProjectResponse>?;
              return TechAddScreen(copyItems: copyItems, rtcProject: projects);
            },
          ),
          GoRoute(
            path: RouteNames.reportITdepartDetail,
            builder: (context, state) => const TechDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.reportITdepartEdit,
            builder: (context, state) {
              final dailyId = state.extra as int;
              return TechEditScreen(dailyId: dailyId);
            },
          ),
        ],
      ),

      //---(Hr)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<HrBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.reportHRAdmin,
            builder: (context, state) => const HrAdminScreen(),
          ),
          GoRoute(
            path: RouteNames.reportHRLXCP,
            builder: (context, state) => const HrLxcpScreen(),
          ),
          GoRoute(
            path: RouteNames.reportHRAdd,
            builder: (context, state) {
              final type = state.extra as DepartmentType?;
              return HrAddScreen(type: type);
            },
          ),
          GoRoute(
            path: RouteNames.reportHRAdminDetail,
            builder: (context, state) => const HrAdminDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.reportHRLXCPDetail,
            builder: (context, state) => const HrHclxDetailScreen(),
          ),

          GoRoute(
            path: RouteNames.reportHREdit,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;

              return HrEditScreen(
                dailyId: extra['dailyId'] as int,
                type: extra['type'] as DepartmentType?,
              );
            },
          ),
          GoRoute(
            path: RouteNames.reportHRLxcpEdit,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;

              return HrLxcpEditScreen(
                dailyId: extra['dailyId'] as int,
                positionId: extra['positionId'] as int,
              );
            },
          ),
        ],
      ),

      //---(Marketing)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<MarketingBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.reportMarketingdepart,
            builder: (context, state) => const MarketingScreen(),
          ),
          GoRoute(
            path: RouteNames.reportMarketingdepartAdd,
            builder: (context, state) => const MarketingAddScreen(),
          ),
          GoRoute(
            path: RouteNames.reportMarketingdepartDetail,
            builder: (context, state) => const MarketingDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.reportMarketingdepartEdit,
            builder: (context, state) {
              final dailyId = state.extra as int;
              return MarketingEditScreen(dailyId: dailyId);
            },
          ),
        ],
      ),

      //---(Ad)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<AdBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.reportADdepart,
            builder: (context, state) => const AdScreen(),
          ),
          GoRoute(
            path: RouteNames.reportADdepartAdd,
            builder: (context, state) => const AdAddScreen(),
          ),
          GoRoute(
            path: RouteNames.reportADdepartDetail,
            builder: (context, state) => const AdDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.reportADdepartEdit,
            builder: (context, state) {
              final dailyId = state.extra as int;
              return AdEditScreen(dailyId: dailyId);
            },
          ),
        ],
      ),

      //---(Agv)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<AgvBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.reportAGVdepart,
            builder: (context, state) => const AgvScreen(),
          ),
          GoRoute(
            path: RouteNames.reportAGVdepartAdd,
            builder: (context, state) => const AgvAddScreen(),
          ),
          GoRoute(
            path: RouteNames.reportAGVdepartDetail,
            builder: (context, state) => const AgvDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.reportAGVdepartEdit,
            builder: (context, state) {
              final dailyId = state.extra as int;
              return AgvEditScreen(dailyId: dailyId);
            },
          ),
        ],
      ),

      //---(Sale)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<SaleBloc>(), child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.reportSaledepart,
            builder: (context, state) => const SaleScreen(),
          ),
          GoRoute(
            path: RouteNames.reportSaleStaffAdd,
            builder: (context, state) => const SaleStaffAddScreen(),
          ),
          GoRoute(
            path: RouteNames.reportSaleAdminAdd,
            builder: (context, state) => const SaleAdminAddScreen(),
          ),
          GoRoute(
            path: RouteNames.reportSaleStaffDetail,
            builder: (context, state) => const SaleStaffDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.reportSaledAdminDetail,
            builder: (context, state) => const SaleAdminDetailScreen(),
          ),
          GoRoute(
            path: RouteNames.reportSaleStaffEdit,
            builder: (context, state) {
              final dailyId = state.extra as int;
              return SaleStaffEditScreen(dailyId: dailyId);
            },
          ),
          GoRoute(
            path: RouteNames.reportSaleAdminEdit,
            builder: (context, state) {
              final dailyId = state.extra as int;
              return SaleAdminEditScreen(dailyId: dailyId);
            },
          ),
        ],
      ),

      //---(Favorites)---//
      GoRoute(
        path: RouteNames.favorites,
        builder: (context, state) => const FavoritesAddingScreen(),
      ),

      //---(RegGeneral)---//
      GoRoute(
        path: RouteNames.reggeneral,
        builder: (context, state) => const RegGeneralScreen(),
      ),

      //---(MeetingRoom)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<MeetingRoomBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.meetingRoom,
            builder: (context, state) => const MeetingRoomScreen(),
          ),
          GoRoute(
            path: RouteNames.meetingRoomAdd,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              final startTime = extra['startTime'] as DateTime?;
              return MeetingRoomAddScreen(
                startTime: startTime ?? DateTime.now(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.meetingRoomEdit,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              final roomId = extra['roomId'] as int;
              final startTime = extra['startTime'] as DateTime?;
              final endTime = extra['endTime'] as DateTime?;
              final safeStart = startTime ?? DateTime.now();
              final safeEnd =
                  endTime ?? safeStart.add(const Duration(hours: 2));
              return MeetingRoomEditScreen(
                roomId: roomId,
                startTime: safeStart,
                endTime: safeEnd,
              );
            },
          ),
        ],
      ),

      //---(BookingVehicle)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<BookingVehicleBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.bookingVehicle,
            builder: (context, state) => const BookingVehicleScreen(),
          ),
          GoRoute(
            path: RouteNames.bookingVehicleAdd,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;
              return BookingVehicleAddScreen(
                copiedItemId: extra?['_copied_item_id'] as int?,
                copiedBookingTypeGroup:
                    extra?['_copied_booking_type_group'] as int?,
                copiedData: extra,
              );
            },
          ),
          GoRoute(
            path: RouteNames.bookingVehicleEdit,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is BookingVehicleItem) {
                return BookingVehicleEditScreen(item: extra);
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Sửa đặt xe')),
                body: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'Không có dữ liệu. Vui lòng mở từ chi tiết yêu cầu.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: RouteNames.bookingVehicleDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is BookingVehicleItem) {
                return BookingVehicleDetailScreen(item: extra);
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Chi tiết yêu cầu')),
                body: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'Không có dữ liệu yêu cầu. Vui lòng mở từ danh sách đặt xe.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      //---(WorkCategory)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<WorkCategoryBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.workCategory,
            builder: (context, state) => const WorkCategoryScreen(),
          ),
          GoRoute(
            path: RouteNames.workCategoryAdd,
            builder: (context, state) => const WorkCategoryAddScreen(),
          ),
          GoRoute(
            path: RouteNames.workCategoryDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is WorkCategoryItem) {
                return WorkCategoryDetailScreen(item: extra);
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Chi tiết hạng mục')),
                body: const Center(
                  child: Text('Không có dữ liệu hạng mục. Vui lòng thử lại.'),
                ),
              );
            },
          ),
        ],
      ),

      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<WorkCategoryBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.workCategory,
            builder: (context, state) => const WorkCategoryScreen(),
          ),

          GoRoute(
            path: RouteNames.workCategoryAdd,
            builder: (context, state) => const WorkCategoryAddScreen(),
          ),

          GoRoute(
            path: RouteNames.workCategoryDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is WorkCategoryItem) {
                return WorkCategoryDetailScreen(item: extra);
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Chi tiết hạng mục')),
                body: const Center(
                  child: Text('Không có dữ liệu hạng mục. Vui lòng thử lại.'),
                ),
              );
            },
          ),
        ],
      ),

      //---(Notification Settings)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<NotificationBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.notificationSettings,
            builder: (context, state) => const NotificationSettingsScreen(),
          ),
        ],
      ),

      //---(Personal Asset)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<PersonalAssetBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.personalAsset,
            builder: (context, state) => const PersonalAssetScreen(),
          ),
          GoRoute(
            path: RouteNames.personalAssetDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is PersonalAssetItem) {
                return PersonalAssetDetailScreen(item: extra);
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Chi tiết tài sản')),
                body: const Center(child: Text('Không có dữ liệu tài sản.')),
              );
            },
          ),
          GoRoute(
            path: RouteNames.personalPropertyDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is PersonalPropertyItem) {
                return PersonalPropertyDetailScreen(item: extra);
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Chi tiết biên bản')),
                body: const Center(child: Text('Không có dữ liệu biên bản.')),
              );
            },
          ),
        ],
      ),

      //---(Stationery)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<StationeryBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.stationery,
            builder: (context, state) => const StationeryScreen(),
          ),
          GoRoute(
            path: RouteNames.stationeryDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is StationeryItem) {
                return StationeryDetailScreen(item: extra);
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Chi tiết VPP')),
                body: const Center(child: Text('Không có dữ liệu VPP.')),
              );
            },
          ),
          GoRoute(
            path: RouteNames.stationeryAdd,
            builder: (context, state) => const StationeryAddScreen(),
          ),
          GoRoute(
            path: RouteNames.stationeryEdit,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is StationeryEditRouteArgs) {
                return StationeryEditScreen(
                  item: extra.item,
                  details: extra.details,
                );
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Sửa đăng ký VPP')),
                body: const Center(child: Text('Không có dữ liệu VPP.')),
              );
            },
          ),
        ],
      ),

      //---(ContractRegistration)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<ContractRegistrationBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.contractRegistration,
            builder: (context, state) => const ContractRegistrationScreen(),
          ),
          GoRoute(
            path: RouteNames.contractRegistrationAdd,
            builder: (context, state) => const ContractRegistrationAddScreen(),
          ),
          GoRoute(
            path: RouteNames.contractRegistrationDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is ContractResponseItem) {
                return ContractRegistrationDetailScreen(item: extra);
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Chi tiết hợp đồng')),
                body: const Center(
                  child: Text('Không có dữ liệu. Vui lòng mở từ danh sách.'),
                ),
              );
            },
          ),
        ],
      ),

      //---(WorkRequirement)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<WorkRequirementBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.workRequirement,
            builder: (context, state) => const WorkRequirementScreen(),
          ),
          GoRoute(
            path: RouteNames.workRequirementAdd,
            builder: (context, state) => const WorkRequirementAddScreen(),
          ),
          GoRoute(
            path: RouteNames.workRequirementDetail,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is WorkRequirementItem) {
                return WorkRequirementDetailScreen(item: extra);
              }
              return const WorkRequirementDetailScreen(itemId: 0);
            },
          ),
          GoRoute(
            path: RouteNames.workRequirementEdit,
            builder: (context, state) {
              final extra = state.extra;
              if (extra is WorkRequirementItem) {
                return WorkRequirementEditScreen(item: extra);
              }
              return const WorkRequirementEditScreen(itemId: 0);
            },
          ),
        ],
      ),

      //---(IdeaRegistration)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<IdeaRegistrationBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.ideaRegistration,
            builder: (context, state) => const IdeaRegistrationScreen(),
          ),
          GoRoute(
            path: RouteNames.ideaRegistrationAdd,
            builder: (context, state) => const IdeaRegistrationAddScreen(),
          ),
          GoRoute(
            path: RouteNames.ideaRegistrationEdit,
            builder: (context, state) {
              final item = state.extra as IdeaItem?;
              return IdeaRegistrationEditScreen(
                id: item?.id ?? 0,
                item: item ?? const IdeaItem(),
              );
            },
          ),
        ],
      ),

      //---(Week Plan)---//
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: getIt<WeekPlanBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.weekplanMenu,
            builder: (context, state) => const WeekPlanMenuScreen(),
          ),
          GoRoute(
            path: RouteNames.weekplanMyTask,
            builder: (context, state) => const WeekPlanMyTaskScreen(),
          ),
          GoRoute(
            path: RouteNames.weekplanRelated,
            builder: (context, state) => const WeekPlanRelatedScreen(),
          ),
          GoRoute(
            path: RouteNames.weekplanAssigned,
            builder: (context, state) => const WeekPlanAssignedScreen(),
          ),
          GoRoute(
            path: RouteNames.weekplanAll,
            builder: (context, state) => const WeekPlanAllScreen(),
          ),
          GoRoute(
            path: RouteNames.weekplanAdd,
            builder: (context, state) => WeekPlanAddScreen(
              extra: state.extra,
            ),
          ),
          GoRoute(
            path: RouteNames.weekplanDetail,
            builder: (context, state) {
              final extra = state.extra;
              int taskId = 0;
              Object? addExtra;
              if (extra is Map) {
                taskId = extra['taskId'] as int? ?? 0;
                addExtra = extra['addExtra'];
              } else if (extra is int) {
                taskId = extra;
              }
              return WeekPlanDetailScreen(
                taskId: taskId,
                extra: addExtra,
              );
            },
          ),
          // Legacy route - redirect to menu
          GoRoute(
            path: RouteNames.weekplan,
            builder: (context, state) => const WeekPlanMenuScreen(),
          ),
        ],
      ),
    ],
  );
}
