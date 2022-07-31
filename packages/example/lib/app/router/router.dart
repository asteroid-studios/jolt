import 'package:example/app/components/auth_required_state.dart';
import 'package:example/app/components/auth_state.dart';
import 'package:example/pages/login/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../pages/account/account_page.dart';
import '../../pages/home/home_page.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: homeRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const AuthRequiredWrapper(HomePage()),
      routes: [
        GoRoute(
          path: accountRoute.replaceAll('/', ''),
          builder: (BuildContext context, GoRouterState state) =>
              const AuthRequiredWrapper(AccountPage()),
        ),
      ],
    ),
    GoRoute(
      path: loginRoute,
      builder: (BuildContext context, GoRouterState state) =>
          const AuthWrapper(LoginPage()),
    ),
  ],
);
