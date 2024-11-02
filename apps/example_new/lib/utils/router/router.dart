import 'package:example_new/app/app_page.dart';
import 'package:example_new/app/change_log_page.dart';
import 'package:example_new/app/contact_page.dart';
import 'package:example_new/app/home_page.dart';
import 'package:example_new/app/home_shell.dart';
import 'package:example_new/app/settings_page.dart';
import 'package:example_new/app/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/home',
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
                      path: ButtonPage.path,
                      name: ButtonPage.name,
                      builder: ButtonPage.builder,
                    ),
                    GoRoute(
                      path: CardPage.path,
                      name: CardPage.name,
                      builder: CardPage.builder,
                    ),
                    GoRoute(
                      path: DividerPage.path,
                      name: DividerPage.name,
                      builder: DividerPage.builder,
                    ),
                    GoRoute(
                      path: FormPage.path,
                      name: FormPage.name,
                      builder: FormPage.builder,
                    ),
                    GoRoute(
                      path: TogglePage.path,
                      name: TogglePage.name,
                      builder: TogglePage.builder,
                    ),
                    GoRoute(
                      path: InputPage.path,
                      name: InputPage.name,
                      builder: InputPage.builder,
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
