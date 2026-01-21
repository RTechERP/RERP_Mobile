import 'package:go_router/go_router.dart';

import '../features/auth/view/pages/login_page.dart';
import 'route_names.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.login,
        builder: (_, __) => const LoginPage(),
      ),
    ],
  );
}
