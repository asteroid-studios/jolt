import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:jolt/jolt.dart';

///
class Shell extends StatelessWidget {
  ///
  const Shell({
    required this.child,
    this.desktopTopBar,
    this.topBar,
    this.sidebarLeft,
    this.sidebarRight,
    this.bottomBar,
    this.footer,
    this.topBarOptions = const TopBarOptions(),
    this.footerOptions = const FooterOptions(),
    super.key,
  });

  ///
  final Widget child;

  ///
  final Widget? desktopTopBar;

  ///
  final Widget? topBar;

  ///
  final Widget? sidebarLeft;

  ///
  final Widget? sidebarRight;

  ///
  final Widget? bottomBar;

  ///
  final Widget? footer;

  ///
  final TopBarOptions topBarOptions;

  ///
  final FooterOptions footerOptions;

  ///
  static InheritedShell? of(BuildContext context) {
    final inheritedShell =
        context.dependOnInheritedWidgetOfExactType<InheritedShell>();

    return inheritedShell;
  }

  @override
  Widget build(BuildContext context) {
    final mobile = context.mediaQuery.size.width < 900;

    // TODO proper breakpoints
    // TODO safe area

    final inside = Row(
      children: [
        if (sidebarLeft != null && !mobile) sidebarLeft!,
        Expanded(
          child: OverlayStack(
            child: Column(
              children: [
                if (topBar != null && !topBarOptions.topBarFullWidth && !mobile)
                  topBar!,
                Expanded(
                  child: ClipRect(
                    child: InheritedShell._(
                      topBar: mobile ? topBar : null,
                      footer: !footerOptions.pinned ? footer : null,
                      topBarOptions: topBarOptions,
                      footerOptions: footerOptions,
                      child: child,
                    ),
                  ),
                ),
                if (footer != null && footerOptions.pinned) footer!,
              ],
            ),
          ),
        ),
        if (sidebarRight != null && !mobile) sidebarRight!,
      ],
    );

    return Column(
      children: [
        if (Platform.isDesktop)
          desktopTopBar ??
              WindowTitleBarBox(
                child: MoveWindow(
                    child: Container(color: context.color.background)),
              ),
        if (topBar != null && topBarOptions.topBarFullWidth && !mobile) topBar!,
        Expanded(child: inside),
      ],
    );
  }
}

///
class TopBarOptions {
  ///
  const TopBarOptions({
    this.topBarFullWidth = true,
  });

  ///
  final bool topBarFullWidth;
}

///
class FooterOptions {
  ///
  const FooterOptions({
    this.pinned = false,
  });

  ///
  final bool pinned;
}

///
class InheritedShell extends InheritedWidget {
  ///
  const InheritedShell._({
    required super.child,
    required this.topBarOptions,
    required this.footerOptions,
    this.topBar,
    this.footer,
  });

  ///
  final Widget? topBar;

  ///
  final Widget? footer;

  ///
  final TopBarOptions topBarOptions;

  ///
  final FooterOptions footerOptions;

  @override
  bool updateShouldNotify(InheritedShell oldWidget) {
    return topBar != oldWidget.topBar || footer != oldWidget.footer;
  }
}
