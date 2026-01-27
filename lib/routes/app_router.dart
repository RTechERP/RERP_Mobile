import 'package:go_router/go_router.dart';
import 'package:rtc_erp/features/workplace/app/attendance/view/pages/attendance_screen_page.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/favorites_adding_screen_page.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/lunch/lunch_add_screen_page.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/lunch/lunch_detail_screen_page.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/reg_work_screen_page.dart';

import '../features/auth/view/pages/login_screen_page.dart';
import '../features/dashboard/view/dashboard_screen_page.dart';
import '../features/splash/view/splash_screen_page.dart';
import '../features/workplace/app/reg_work/view/pages/lunch/lunch_screen_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreenPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreenPage(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreenPage(),
      ),
      GoRoute(
        path: '/attendance',
        builder: (context, state) => const AttendanceScreenPage(),
      ),

      GoRoute(
        path: '/regwork',
        builder: (context, state) => const RegWorkScreenPage(),
      ),

      GoRoute(
        path:'/regwork/lunch',
        builder: (context, state) => const LunchScreenPage(),
      ),

      GoRoute(
        path: '/regwork/lunch/detail',
        builder: (context, state) => const LunchDetailScreenPage(),
      ),

      GoRoute(
        path: '/regwork/lunch/add',
        builder: (context, state) => const LunchAddScreen(),
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const FavoritesAddingScreen(),
      ),
    ],
  );
}
