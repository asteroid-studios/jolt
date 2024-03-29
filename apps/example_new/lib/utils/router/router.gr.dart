// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:example_new/app/404/not_found_page.dart' as _i2;
import 'package:example_new/app/app_page.dart' as _i1;
import 'package:example_new/app/widgets/widgets_page.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppPage(),
      );
    },
    NotFoundRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.NotFoundPage(),
      );
    },
    WidgetsRoute.name: (routeData) {
      return _i4.AutoRoutePage<bool>(
        routeData: routeData,
        child: const _i3.WidgetsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppPage]
class AppRoute extends _i4.PageRouteInfo<void> {
  const AppRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.NotFoundPage]
class NotFoundRoute extends _i4.PageRouteInfo<void> {
  const NotFoundRoute({List<_i4.PageRouteInfo>? children})
      : super(
          NotFoundRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.WidgetsPage]
class WidgetsRoute extends _i4.PageRouteInfo<void> {
  const WidgetsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          WidgetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WidgetsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
