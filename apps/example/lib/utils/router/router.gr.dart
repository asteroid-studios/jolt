// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:example/components/shell/shell.dart' as _i7;
import 'package:example/features/dashboard/pages/dashboard_page.dart' as _i1;
import 'package:example/features/theming/pages/breakpoints/breakpoints_page.dart'
    as _i4;
import 'package:example/features/theming/pages/theming/theming_page.dart'
    as _i2;
import 'package:example/features/theming/pages/typography/typography_page.dart'
    as _i3;
import 'package:example/features/widgets/pages/layouts/layouts_page.dart'
    as _i8;
import 'package:example/features/widgets/pages/widgets/widgets_page.dart'
    as _i5;
import 'package:example/utils/router/router.dart' as _i6;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    ThemingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ThemingPage(),
      );
    },
    TypographyRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TypographyPage(),
      );
    },
    BreakpointsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BreakpointsPage(),
      );
    },
    WidgetsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.WidgetsPage(),
      );
    },
    DashboardTab.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DashboardTabPage(),
      );
    },
    WidgetsTab.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.WidgetsTabPage(),
      );
    },
    ThemingTab.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ThemingTabPage(),
      );
    },
    AppShell.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AppShell(),
      );
    },
    LayoutsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LayoutsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ThemingPage]
class ThemingRoute extends _i9.PageRouteInfo<void> {
  const ThemingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ThemingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TypographyPage]
class TypographyRoute extends _i9.PageRouteInfo<void> {
  const TypographyRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TypographyRoute.name,
          initialChildren: children,
        );

  static const String name = 'TypographyRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BreakpointsPage]
class BreakpointsRoute extends _i9.PageRouteInfo<void> {
  const BreakpointsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          BreakpointsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BreakpointsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.WidgetsPage]
class WidgetsRoute extends _i9.PageRouteInfo<void> {
  const WidgetsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          WidgetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WidgetsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DashboardTabPage]
class DashboardTab extends _i9.PageRouteInfo<void> {
  const DashboardTab({List<_i9.PageRouteInfo>? children})
      : super(
          DashboardTab.name,
          initialChildren: children,
        );

  static const String name = 'DashboardTab';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.WidgetsTabPage]
class WidgetsTab extends _i9.PageRouteInfo<void> {
  const WidgetsTab({List<_i9.PageRouteInfo>? children})
      : super(
          WidgetsTab.name,
          initialChildren: children,
        );

  static const String name = 'WidgetsTab';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ThemingTabPage]
class ThemingTab extends _i9.PageRouteInfo<void> {
  const ThemingTab({List<_i9.PageRouteInfo>? children})
      : super(
          ThemingTab.name,
          initialChildren: children,
        );

  static const String name = 'ThemingTab';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AppShell]
class AppShell extends _i9.PageRouteInfo<void> {
  const AppShell({List<_i9.PageRouteInfo>? children})
      : super(
          AppShell.name,
          initialChildren: children,
        );

  static const String name = 'AppShell';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LayoutsPage]
class LayoutsRoute extends _i9.PageRouteInfo<void> {
  const LayoutsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LayoutsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LayoutsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
