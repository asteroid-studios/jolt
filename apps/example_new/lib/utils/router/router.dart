import 'package:example_new/app/app_page.dart';
import 'package:example_new/app/change_log_page.dart';
import 'package:example_new/app/contact_page.dart';
import 'package:example_new/app/home_page.dart';
import 'package:example_new/app/home_shell.dart';
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
            ShellRoute(
              builder: (context, state, child) => HomeShell(state, child),
              routes: [
                GoRoute(
                  path: HomePage.path,
                  name: HomePage.routeName,
                  builder: (context, state) => const HomePage(),
                  routes: [
                    GoRoute(
                      path: ButtonsPage.path,
                      name: ButtonsPage.routeName,
                      builder: (context, state) => const ButtonsPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: SettingsPage.path,
              name: SettingsPage.routeName,
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ChangeLogPage.path,
              name: ChangeLogPage.routeName,
              builder: (context, state) => const ChangeLogPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ContactPage.path,
              name: ContactPage.routeName,
              builder: (context, state) => const ContactPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
