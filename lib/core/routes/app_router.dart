import 'package:auto_route/auto_route.dart';

import '../../features/auth/presentation/pages/auth_screen.dart';
import '../../features/auth/presentation/pages/login_tab.dart';
import '../../features/home/presentation/pages/home.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeScreenRoute.page, initial: false),
    AutoRoute(page: AuthScreenRoute.page),
    AutoRoute(page: ProfileScreenRoute.page, initial: true),
  ];
}
