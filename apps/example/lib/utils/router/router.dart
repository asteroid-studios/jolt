// ignore_for_file: use_key_in_widget_constructors

import 'package:auto_route/auto_route.dart';

import 'package:example/utils/router/router.gr.dart';

export 'package:auto_route/auto_route.dart';
export 'package:example/utils/router/router.gr.dart';

///
class RouteMeta {
  ///
  static const String showBottomNav = 'showBottomNav';
}

///
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  AppRouter._();

  ///
  static final instance = AppRouter._();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: AppShell.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'dashboard'),
            AutoRoute(
              page: DashboardTab.page,
              path: 'dashboard',
              children: [
                AutoRoute(page: DashboardRoute.page, path: ''),
              ],
            ),
            AutoRoute(
              page: WidgetsTab.page,
              path: 'widgets',
              children: [
                AutoRoute(page: WidgetsRoute.page, path: ''),
              ],
            ),
            AutoRoute(
              page: ThemingTab.page,
              path: 'theming',
              children: [
                AutoRoute(page: ThemingRoute.page, path: ''),
                AutoRoute(
                  page: BreakpointsRoute.page,
                  path: 'breakpoints',
                ),
                AutoRoute(
                  page: TypographyRoute.page,
                  path: 'typography',
                ),
              ],
            ),
          ],
        ),
        // AutoRoute(
        //   path: '/login',
        //   page: LoginRoute.page,
        // ),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}

///
@RoutePage(name: 'DashboardTab')
class DashboardTabPage extends AutoRouter {}

///
@RoutePage(name: 'WidgetsTab')
class WidgetsTabPage extends AutoRouter {}

///
@RoutePage(name: 'ThemingTab')
class ThemingTabPage extends AutoRouter {}
