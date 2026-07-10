// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthScreen]
class AuthScreenRoute extends PageRouteInfo<AuthScreenRouteArgs> {
  AuthScreenRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        AuthScreenRoute.name,
        args: AuthScreenRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'AuthScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthScreenRouteArgs>(
        orElse: () => const AuthScreenRouteArgs(),
      );
      return AuthScreen(key: args.key);
    },
  );
}

class AuthScreenRouteArgs {
  const AuthScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthScreenRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthScreenRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [HomeRoot]
class HomeRootRoute extends PageRouteInfo<void> {
  const HomeRootRoute({List<PageRouteInfo>? children})
    : super(HomeRootRoute.name, initialChildren: children);

  static const String name = 'HomeRootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeRoot();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileScreenRoute extends PageRouteInfo<void> {
  const ProfileScreenRoute({List<PageRouteInfo>? children})
    : super(ProfileScreenRoute.name, initialChildren: children);

  static const String name = 'ProfileScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}
