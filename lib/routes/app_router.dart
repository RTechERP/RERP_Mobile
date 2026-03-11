import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/favorites_adding_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/leave/leave_add_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/leave/leave_detail_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/leave/leave_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/lunch/lunch_add_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/lunch/lunch_detail_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/reg_work_screen.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/work_trip/work_trip_detail_screen.dart';
import 'package:rtc_erp/routes/route_names.dart';

import '../app_init_screen.dart';
import '../common/enums/index.dart';
import '../di/injection.dart';
import '../features/auth/view/bloc/auth_bloc.dart';
import '../features/auth/view/pages/login_screen.dart';
import '../features/dashboard/view/dashboard_screen.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/in_out_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/in_out_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/in_out/in_out_screen.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/lunch_screen.dart';
import '../features/workplace/app/reg_work/view/pages/missed/missed_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/missed/missed_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/missed/missed_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/overnight_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overnight/overnight_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/overtime_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/overtime_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/overtime/overtime_screen.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/wfh_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/wfh_detail_screen.dart';
import '../features/workplace/app/reg_work/view/pages/wfh/wfh_screen.dart';
import '../features/workplace/app/reg_work/view/pages/work_trip/work_trip_add_screen.dart';
import '../features/workplace/app/reg_work/view/pages/work_trip/work_trip_screen.dart';
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

import '../features/workplace/app/reports/view/sale/view/pages/sale_screen.dart';
import '../features/workplace/app/reports/view/sale/view/pages/sale_staff_add_screen.dart';
import '../features/workplace/app/reports/view/sale/view/pages/sale_staff_detail_screen.dart';
import '../features/workplace/app/reports/view/tech/view/bloc/tech_bloc.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_add_screen.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_detail_screen.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_edit_screen.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_screen.dart';
import '../features/workplace/view/bloc/workspace_bloc.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',

    routes: [
      GoRoute(path: '/', builder: (_, __) => const AppInitScreen()),

      GoRoute(
        path: RouteNames.login,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<AuthBloc>()..add(const AuthEvent.init()),
            child: const LoginScreen(),
          );
        },
      ),

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

      GoRoute(
        path: '/regwork',
        builder: (context, state) => const RegWorkScreen(),
      ),

      GoRoute(
        path: '/regwork/lunch',
        builder: (context, state) => const LunchScreen(),
      ),

      GoRoute(
        path: '/regwork/lunch/detail',
        builder: (context, state) => const LunchDetailScreen(),
      ),

      GoRoute(
        path: '/regwork/lunch/add',
        builder: (context, state) => const LunchAddScreen(),
      ),

      GoRoute(
        path: '/regwork/leave',
        builder: (context, state) => const LeaveScreenPage(),
      ),

      GoRoute(
        path: '/regwork/leave/detail',
        builder: (context, state) => const LeaveDetailScreenPage(),
      ),
      GoRoute(
        path: '/regwork/leave/add',
        builder: (context, state) => const LeaveAddScreenPage(),
      ),

      GoRoute(
        path: '/regwork/in_out',
        builder: (context, state) => const InOutScreenPage(),
      ),

      GoRoute(
        path: '/regwork/in_out/detail',
        builder: (context, state) => const InOutDetailScreenPage(),
      ),

      GoRoute(
        path: '/regwork/in_out/add',
        builder: (context, state) => const InOutAddScreenPage(),
      ),

      GoRoute(
        path: '/regwork/overtime',
        builder: (context, state) => const OvertimeScreenPage(),
      ),

      GoRoute(
        path: '/regwork/overtime/detail',
        builder: (context, state) => const OvertimeDetailScreenPage(),
      ),

      GoRoute(
        path: '/regwork/overtime/add',
        builder: (context, state) => const OvertimeAddScreenPage(),
      ),

      GoRoute(
        path: '/regwork/wfh',
        builder: (context, state) => const WfhScreen(),
      ),

      GoRoute(
        path: '/regwork/wfh/detail',
        builder: (context, state) => const WfhDetailScreen(),
      ),

      GoRoute(
        path: '/regwork/wfh/add',
        builder: (context, state) => const WfhAddScreen(),
      ),

      GoRoute(
        path: '/regwork/missed',
        builder: (context, state) => const MissedScreen(),
      ),

      GoRoute(
        path: '/regwork/missed/detail',
        builder: (context, state) => const MissedDetailScreen(),
      ),

      GoRoute(
        path: '/regwork/missed/add',
        builder: (context, state) => const MissedAddScreen(),
      ),

      GoRoute(
        path: '/regwork/work_trip',
        builder: (context, state) => const WorkTripScreen(),
      ),

      GoRoute(
        path: '/regwork/work_trip/add',
        builder: (context, state) => const WorkTripAddScreen(),
      ),

      GoRoute(
        path: '/regwork/work_trip/detail',
        builder: (context, state) => const WorkTripDetailScreen(),
      ),

      GoRoute(
        path: '/regwork/overnight',
        builder: (context, state) => const OvernightScreen(),
      ),

      GoRoute(
        path: '/regwork/overnight/detail',
        builder: (context, state) => const OvertimeDetailScreenPage(),
      ),

      GoRoute(
        path: '/regwork/overnight/add',
        builder: (context, state) => const OvernightAddScreen(),
      ),

      /// Report Route
      GoRoute(
        path: '/report',
        builder: (context, state) => const ReportScreen(),
      ),

      /// Tech Route
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
            builder: (context, state) => const TechAddScreen(),
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

      /// Hr Route
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

      /// Marketing Route
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

      /// Assembly - Project Implementation Route
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

      /// AGV Route
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

      /// Sale Route
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
        ],
      ),

      GoRoute(
        path: '/favorites',
        builder: (context, state) => const FavoritesAddingScreen(),
      ),
    ],
  );
}
