import 'package:ui/ui.dart';

import 'package:example/components/shell/bottom_bar/bottom_bar.dart';
import 'package:example/components/shell/nav_items/nav_items.dart';
import 'package:example/components/shell/sidebar_left/sidebar_left.dart';
import 'package:example/components/shell/sidebar_right/sidebar_right.dart';
import 'package:example/components/shell/top_bar/top_bar.dart';
import 'package:example/utils/router/router.dart';

///
@RoutePage()
class AppShell extends StatelessWidget {
  ///
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    Widget shell(Widget child, TabsRouter? tabsRouter) {
      return Themes(
        // TODO see if I still need Themes with AutoRoute
        child: Shell(
          // options: ShellOptions(),
          // desktopTopBar: const DesktopTopBar(),
          sideBarLeft: context.responsive(
            mobile: null,
            tabletLandscape: const SideBarLeft(),
          ),
          sideBarRight: context.responsive(
            mobile: null,
            tabletLandscape: const SideBarRight(),
          ),
          bottomBar: context.responsive(
            mobile: !Platform.isWeb && tabsRouter != null
                ? BottomBar(tabsRouter)
                : const SizedBox.shrink(),
            tabletLandscape: const SizedBox.shrink(),
          ),
          topBar: const TopBar(),
          // footer: const Footer(),
          child: child,
        ),
      );
    }

    // Don't use AutoTabsRouter on web
    if (Platform.isWeb) {
      return AutoRouter(
        builder: (context, child) {
          // we check for active route index by using
          // router.isRouteActive method
          var activeIndex = navBarItems.indexWhere(
            (d) => context.router.isRouteActive(d.route.routeName),
          );
          // there might be no active route until router is mounted
          // so we play safe
          if (activeIndex == -1) {
            activeIndex = 0;
          }
          return shell(child, null);
        },
      );
    }

    return AutoTabsRouter(
      routes: navRoutes,
      duration: Duration.zero,
      lazyLoad: false,
      builder: (context, child) {
        return shell(child, AutoTabsRouter.of(context));
      },
    );
  }
}

///
const navRoutes = [
  DashboardRoute(),
  WidgetsRoute(),
  ThemingTab(),
];
