import 'package:go_router/go_router.dart';
import 'package:jolt/jolt.dart';

import 'package:example/components/router/routes/routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

///
final router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/',
  navigatorKey: rootNavigatorKey,
);
