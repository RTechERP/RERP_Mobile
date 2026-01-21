import 'package:go_router/go_router.dart';

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
    ],
  );
}
