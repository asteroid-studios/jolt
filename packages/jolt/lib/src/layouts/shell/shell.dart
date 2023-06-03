import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:jolt/jolt.dart';

///
class Shell extends StatelessWidget {
  ///
  const Shell({
    required this.child,
    this.desktopTopBar,
    this.topBar,
    this.sideBarLeft,
    this.sideBarRight,
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
  final Widget? sideBarLeft;

  ///
  final Widget? sideBarRight;

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
        if (sideBarLeft != null) sideBarLeft!,
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
                      bottomBar: bottomBar,
                      child: child,
                    ),
                  ),
                ),
                if (footer != null && footerType == FooterType.pinned) footer!,
              ],
            ),
          ),
        ),
        if (sideBarRight != null) sideBarRight!,
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
    this.bottomBar,
  });

  ///
  final Widget? topBar;

  ///
  final Widget? footer;

  ///
  final Widget? bottomBar;

  @override
  bool updateShouldNotify(InheritedShell oldWidget) {
    return topBar != oldWidget.topBar ||
        footer != oldWidget.footer ||
        bottomBar != oldWidget.bottomBar;
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
