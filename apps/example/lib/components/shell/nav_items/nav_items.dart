import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

///
const navBarItems = [
  NavItem(
    label: 'Dashboard',
    icon: Icons.house,
    selectedIcon: IconsFill.houseLine,
    route: DashboardRoute(),
  ),
  NavItem(
    label: 'Widgets',
    icon: Icons.stackSimple,
    selectedIcon: IconsFill.stackSimple,
    route: WidgetsRoute(),
  ),
  NavItem(
    label: 'Theming',
    icon: Icons.paintBrush,
    selectedIcon: IconsFill.paintBrush,
    route: ThemingRoute(),
    children: [
      NavItem(
        label: 'Typography',
        icon: Icons.textAUnderline,
        selectedIcon: IconsFill.textAUnderline,
        route: TypographyRoute(),
      ),
      NavItem(
        label: 'Breakpoints',
        icon: Icons.gridFour,
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
