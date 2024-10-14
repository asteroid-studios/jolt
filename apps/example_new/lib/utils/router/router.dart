import 'package:example_new/app/app_page.dart';
import 'package:example_new/app/change_log_page.dart';
import 'package:example_new/app/contact_page.dart';
import 'package:example_new/app/home_page.dart';
import 'package:example_new/app/home_shell.dart';
import 'package:example_new/app/settings_page.dart';
import 'package:example_new/app/widgets/buttons_page.dart';
import 'package:example_new/app/widgets/toggle_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute(
      navigatorContainerBuilder: (context, navigationShell, children) {
        return AppPage(
          navigationShell: navigationShell,
          children: children,
        );
      },
      builder: (context, state, navigationShell) => navigationShell,
      branches: [
        StatefulShellBranch(
          routes: [
            ShellRoute(
              builder: (context, state, child) => HomeShell(state, child),
              routes: [
                GoRoute(
                  path: HomePage.path,
                  name: HomePage.name,
                  builder: HomePage.builder,
                  routes: [
                    GoRoute(
                      path: ButtonsPage.path,
                      name: ButtonsPage.name,
                      builder: ButtonsPage.builder,
                    ),
                    GoRoute(
                      path: TogglePage.path,
                      name: TogglePage.name,
                      builder: TogglePage.builder,
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
              name: SettingsPage.name,
              builder: SettingsPage.builder,
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ChangeLogPage.path,
              name: ChangeLogPage.name,
              builder: ChangeLogPage.builder,
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ContactPage.path,
              name: ContactPage.name,
              builder: ContactPage.builder,
            ),
          ],
        ),
      ],
    ),
  ],
);
