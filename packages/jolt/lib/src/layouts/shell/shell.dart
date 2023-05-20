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
    this.options = const ShellOptions(),
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
  final ShellOptions options;

  ///
  static InheritedShell? of(BuildContext context) {
    final inheritedShell =
        context.dependOnInheritedWidgetOfExactType<InheritedShell>();

    return inheritedShell;
  }

  @override
  Widget build(BuildContext context) {
    final topBarType = options.topBarType;
    final footerType = options.footerType;

    final inside = Row(
      children: [
        if (sidebarLeft != null) sidebarLeft!,
        Expanded(
          child: OverlayStack(
            child: Column(
              children: [
                if (topBar != null && topBarType == TopBarType.pinned) topBar!,
                Expanded(
                  child: ClipRect(
                    child: InheritedShell._(
                      topBar: topBarType == TopBarType.floating ? topBar : null,
                      footer: footerType == FooterType.floating ? footer : null,
                      child: child,
                    ),
                  ),
                ),
                if (footer != null && footerType == FooterType.pinned) footer!,
              ],
            ),
          ),
        ),
        if (sidebarRight != null) sidebarRight!,
      ],
    );

    return Column(
      children: [
        if (Platform.isDesktop) desktopTopBar ?? _DefaultDesktopTopBar(),
        if (topBar != null && topBarType == TopBarType.fullWidth) topBar!,
        Expanded(child: inside),
      ],
    );
  }
}

///
class ShellOptions {
  ///
  const ShellOptions({
    this.topBarType = TopBarType.fullWidth,
    this.footerType = FooterType.floating,
  });

  ///
  final TopBarType topBarType;

  ///
  final FooterType footerType;
}

///
enum TopBarType {
  ///
  fullWidth,

  ///
  pinned,

  ///
  floating,
}

///
enum FooterType {
  ///
  pinned,

  ///
  floating,
}

///
class InheritedShell extends InheritedWidget {
  ///
  const InheritedShell._({
    required super.child,
    this.topBar,
    this.footer,
  });

  ///
  final Widget? topBar;

  ///
  final Widget? footer;

  @override
  bool updateShouldNotify(InheritedShell oldWidget) {
    return topBar != oldWidget.topBar || footer != oldWidget.footer;
  }
}

class _DefaultDesktopTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: MoveWindow(
        child: Container(color: context.color.background),
      ),
    );
  }
}
