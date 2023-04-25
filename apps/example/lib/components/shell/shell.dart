import 'package:jolt/jolt.dart';

import 'package:example/components/shell/footer/footer.dart';
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
      sidebarLeft: Container(
        color: context.color.surface.withOpacity(0.5),
        width: 280,
      ),
      sidebarRight: const SidebarRight(),
      topBar: const TopBar(),
      footer: const Footer(),
      child: navigator,
    );
  }
}
