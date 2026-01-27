import 'package:go_router/go_router.dart';
import 'package:rtc_erp/features/workplace/app/attendance/view/pages/attendance_screen_page.dart';
import 'package:rtc_erp/features/workplace/app/favorites/view/pages/favorites_adding_screen_page.dart';
import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/reg_work_screen_page.dart';

import '../features/auth/view/pages/login_screen_page.dart';
import '../features/dashboard/view/dashboard_screen_page.dart';
import '../features/splash/view/splash_screen_page.dart';

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
        path: '/favorites',
        builder: (context, state) => const FavoritesAddingScreen(),
      ),
    ],
  );
}
