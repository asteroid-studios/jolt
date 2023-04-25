import 'package:flutter/material.dart';

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
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      material(state, const DashboardPage());
}

///
class UsersRouteData extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      material(state, const UsersPage());
}

///
Page<dynamic> fade(GoRouterState state, Widget screen) {
  return CustomTransitionPage(
    name: state.location,
    key: state.pageKey,
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Change the opacity of the screen using a Curve based on the the animation's
      // value
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}

///
Page<dynamic> material(GoRouterState state, Widget screen) {
  return MaterialPage(
    name: state.location,
    key: state.pageKey,
    child: screen,
  );
}
