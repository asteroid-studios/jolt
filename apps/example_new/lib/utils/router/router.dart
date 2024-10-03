import 'package:example_new/app/app_page.dart';
import 'package:example_new/app/change_log_page.dart';
import 'package:example_new/app/contact_page.dart';
import 'package:example_new/app/docs_page.dart';
import 'package:example_new/app/home_page.dart';
import 'package:example_new/app/settings_page.dart';
import 'package:example_new/app/widgets/buttons_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(path: 'buttons', builder: (context, state) => const ButtonsPage()),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/docs', builder: (context, state) => const DocsPage()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/settings', builder: (context, state) => const SettingsPage()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/change-log', builder: (context, state) => const ChangeLogPage()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/contact', builder: (context, state) => const ContactPage()),
          ],
        ),
      ],
    ),
  ],
);
