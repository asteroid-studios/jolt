// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:example/components/shell/shell.dart' as _i5;
import 'package:example/features/dashboard/pages/dashboard_page.dart' as _i1;
import 'package:example/features/theming/pages/theming/theming_page.dart'
    as _i2;
import 'package:example/features/theming/pages/typography/typography_page.dart'
    as _i6;
import 'package:example/features/widgets/pages/widgets/widgets_page.dart'
    as _i3;
import 'package:example/utils/router/router.dart' as _i4;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    ThemingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ThemingPage(),
      );
    },
    WidgetsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WidgetsPage(),
      );
    },
    DashboardTab.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DashboardTabPage(),
      );
    },
    WidgetsTab.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WidgetsTabPage(),
      );
    },
    ThemingTab.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ThemingTabPage(),
      );
    },
    AppShell.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AppShell(),
      );
    },
    TypographyRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TypographyPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ThemingPage]
class ThemingRoute extends _i7.PageRouteInfo<void> {
  const ThemingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ThemingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.WidgetsPage]
class WidgetsRoute extends _i7.PageRouteInfo<void> {
  const WidgetsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          WidgetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WidgetsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DashboardTabPage]
class DashboardTab extends _i7.PageRouteInfo<void> {
  const DashboardTab({List<_i7.PageRouteInfo>? children})
      : super(
          DashboardTab.name,
          initialChildren: children,
        );

  static const String name = 'DashboardTab';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WidgetsTabPage]
class WidgetsTab extends _i7.PageRouteInfo<void> {
  const WidgetsTab({List<_i7.PageRouteInfo>? children})
      : super(
          WidgetsTab.name,
          initialChildren: children,
        );

  static const String name = 'WidgetsTab';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ThemingTabPage]
class ThemingTab extends _i7.PageRouteInfo<void> {
  const ThemingTab({List<_i7.PageRouteInfo>? children})
      : super(
          ThemingTab.name,
          initialChildren: children,
        );

  static const String name = 'ThemingTab';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AppShell]
class AppShell extends _i7.PageRouteInfo<void> {
  const AppShell({List<_i7.PageRouteInfo>? children})
      : super(
          AppShell.name,
          initialChildren: children,
        );

  static const String name = 'AppShell';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TypographyPage]
class TypographyRoute extends _i7.PageRouteInfo<void> {
  const TypographyRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TypographyRoute.name,
          initialChildren: children,
        );

  static const String name = 'TypographyRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
