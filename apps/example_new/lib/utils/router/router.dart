import 'package:auto_route/auto_route.dart';
// ignore: unused_import
import 'package:example_new/utils/router/dialog_routes/dialog_routes.dart';
import 'package:example_new/utils/router/router.gr.dart';
import 'package:ui/ui.dart';

export 'package:auto_route/auto_route.dart';
export 'package:example_new/utils/router/router.gr.dart';

extension ConfigX on AppRouter {
  RouterConfig<UrlState> get routerConfig {
    return config(
      includePrefixMatches: true,
    );
  }
}

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes {
    return [
      // Auth Routes
      AutoRoute(path: '/', page: AppRoute.page),
      AutoRoute(path: '/widgets', page: WidgetsRoute.page),
      AutoRoute(path: '/widgets/button', page: ButtonRoute.page),
      // Show page not found for any other url
      AutoRoute(path: '*', page: NotFoundRoute.page),
    ];
  }

  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  RouteType get defaultRouteType => Platform.isWeb || Platform.isDesktop
      ? RouteType.custom(
          durationInMilliseconds: transitionDuration.inMilliseconds,
          reverseDurationInMilliseconds: transitionDuration.inMilliseconds,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        )
      : const RouteType.adaptive();
}
