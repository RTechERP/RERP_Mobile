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

import '../di/injection.dart';
import '../features/auth/view/pages/login_screen.dart';
import '../features/dashboard/view/dashboard_screen.dart';
import '../features/splash/view/splash_screen.dart';
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
import '../features/workplace/app/reports/view/report_screen.dart';
import '../features/workplace/app/reports/view/tech/view/bloc/tech_bloc.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_add_screen.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_detail_screen.dart';
import '../features/workplace/app/reports/view/tech/view/pages/tech_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
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

      GoRoute(
        path: '/report',
        builder: (context, state) => const ReportScreen(),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (_) => getIt<TechBloc>()..add(const TechEvent.init()),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/report/tech',
            builder: (context, state) => const TechScreen(),
          ),
          GoRoute(
            path: '/report/tech/add',
            builder: (context, state) => const TechAddScreen(),
          ),
          GoRoute(
            path: '/report/tech/detail',
            builder: (context, state) => const TechDetailScreen(),
          )
        ],
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const FavoritesAddingScreen(),
      ),
    ],
  );
}
