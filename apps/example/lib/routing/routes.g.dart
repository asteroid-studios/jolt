// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRouteData,
    ];

RouteBase get $appShellRouteData => ShellRouteData.$route(
      factory: $AppShellRouteDataExtension._fromState,
      navigatorKey: AppShellRouteData.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $DashboardRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/users',
          factory: $UsersRouteDataExtension._fromState,
        ),
      ],
    );

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      AppShellRouteData();
}

extension $DashboardRouteDataExtension on DashboardRouteData {
  static DashboardRouteData _fromState(GoRouterState state) =>
      DashboardRouteData();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $UsersRouteDataExtension on UsersRouteData {
  static UsersRouteData _fromState(GoRouterState state) => UsersRouteData();

  String get location => GoRouteData.$location(
        '/users',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
