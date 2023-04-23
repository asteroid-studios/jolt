import 'package:go_router/go_router.dart';
import 'package:jolt/jolt.dart';

import 'package:example/components/router/router.dart';
import 'package:example/components/shell/shell.dart';
import 'package:example/features/dashboard/pages/dashboard_page.dart';
import 'package:example/features/users/pages/users_page.dart';

part 'routes.g.dart';

@TypedShellRoute<AppShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<DashboardRouteData>(path: '/'),
    TypedGoRoute<UsersRouteData>(path: '/users'),
  ],
)

///
class AppShellRouteData extends ShellRouteData {
  ///
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) =>
      AppShell(navigator: navigator);
}

///
class DashboardRouteData extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardPage();
}

///
class UsersRouteData extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const UsersPage();
}
