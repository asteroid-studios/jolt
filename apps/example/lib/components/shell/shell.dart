import 'package:jolt/jolt.dart';

import 'package:example/components/shell/desktop_topbar/desktop_topbar.dart';
import 'package:example/components/shell/footer/footer.dart';
import 'package:example/components/shell/sidebar_left/sidebar_left.dart';
import 'package:example/components/shell/sidebar_right/sidebar_right.dart';
import 'package:example/components/shell/top_bar/top_bar.dart';

///
class AppShell extends StatelessWidget {
  ///
  const AppShell({required this.navigator, super.key});

  ///
  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return Shell(
      desktopTopBar: const DesktopTopbar(),
      sidebarLeft: const SidebarLeft(),
      sidebarRight: const SidebarRight(),
      topBar: const TopBar(),
      footer: const Footer(),
      child: navigator,
    );
  }
}
