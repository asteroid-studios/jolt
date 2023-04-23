import 'package:jolt/jolt.dart';

import 'package:example/components/shell/footer/footer.dart';
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
        color: context.color.surface,
        width: 280,
      ),
      // sidebarRight: Container(
      //   color: context.color.surface,
      //   width: 120,
      // ),
      topBar: const TopBar(),
      footer: const Footer(),
      footerOptions: const FooterOptions(pinned: false),
      child: navigator,
    );
  }
}
