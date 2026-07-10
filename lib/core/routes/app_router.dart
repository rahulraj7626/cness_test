import 'package:auto_route/auto_route.dart';
import 'package:cness_test/features/home/presentation/pages/home_root.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/auth_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';

part 'app_router.gr.dart';

///Approuter
///Define all routes here
///Can update navigation transitions , intitial route and more
///Visit autoroute documentation for more

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRootRoute.page, initial: true),
    AutoRoute(page: AuthScreenRoute.page, initial: false),
    AutoRoute(page: ProfileScreenRoute.page, initial: false),
  ];
}
