import 'package:auto_route/auto_route.dart';
import 'package:example_new/utils/router/bottom_sheet_route.dart';

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
  @override
  List<AutoRoute> get routes {
    return [
      // Auth Routes
      AutoRoute(path: '/', page: AppRoute.page),
      AutoRouteBottomSheetRoute(path: '/widgets', page: WidgetsRoute.page),
      // Show page not found for any other url
      AutoRoute(path: '*', page: NotFoundRoute.page),
    ];
  }
}
