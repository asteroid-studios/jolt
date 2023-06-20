import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

const navBarItems = [
  NavItem(
    label: 'Dashboard',
    icon: Icons.house,
    selectedIcon: IconsFill.houseLine,
    route: DashboardTab(),
  ),
  NavItem(
    label: 'Widgets',
    icon: Icons.stackSimple,
    selectedIcon: IconsFill.stackSimple,
    route: WidgetsTab(),
  ),
  NavItem(
    label: 'Theming',
    icon: Icons.paintBrush,
    selectedIcon: IconsFill.paintBrush,
    route: ThemingTab(),
  ),
];

class NavItem {
  const NavItem({
    required this.route,
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final PageRouteInfo route;
  final IconData icon;
  final IconData selectedIcon;
  final String label;
}
