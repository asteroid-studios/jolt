import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

///
const navBarItems = [
  NavItem(
    label: 'Dashboard',
    icon: IconsBold.house,
    selectedIcon: IconsFill.house,
    route: DashboardRoute(),
  ),
  NavItem(
    label: 'Widgets',
    icon: IconsBold.stackSimple,
    selectedIcon: IconsFill.stackSimple,
    route: WidgetsRoute(),
    children: [
      NavItem(
        label: 'Layouts',
        icon: IconsBold.gridFour,
        selectedIcon: IconsFill.gridFour,
        route: LayoutsRoute(),
      ),
    ],
  ),
  NavItem(
    label: 'Theming',
    icon: IconsBold.swatches,
    selectedIcon: IconsFill.swatches,
    route: ThemingRoute(),
    children: [
      NavItem(
        label: 'Typography',
        icon: IconsBold.textAUnderline,
        selectedIcon: IconsFill.textAUnderline,
        route: TypographyRoute(),
      ),
      NavItem(
        label: 'Breakpoints',
        icon: IconsBold.gridFour,
        selectedIcon: IconsFill.gridFour,
        route: BreakpointsRoute(),
      ),
    ],
  ),
];

///
class NavItem {
  ///
  const NavItem({
    required this.route,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    this.children = const [],
  });

  ///
  final PageRouteInfo route;

  ///
  final IconData icon;

  ///
  final IconData selectedIcon;

  ///
  final String label;

  ///
  final List<NavItem> children;
}
