import 'dart:ui';

import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:jolt/jolt.dart';

///
class Shell extends StatelessWidget {
  ///
  const Shell({
    required this.child,
    this.topBar,
    this.sidebarLeft,
    this.sidebarRight,
    this.footer,
    this.desktopTopBar,
    this.topBarOptions = const TopBarOptions(),
    this.footerOptions = const FooterOptions(),
    super.key,
  });

  ///
  final Widget child;

  ///
  final Widget? topBar;

  ///
  final Widget? sidebarLeft;

  ///
  final Widget? sidebarRight;

  ///
  final Widget? footer;

  ///
  final TopBarOptions topBarOptions;

  ///
  final FooterOptions footerOptions;

  final Widget? desktopTopBar;

  ///
  static InheritedShell of(BuildContext context) {
    final inheritedShell =
        context.dependOnInheritedWidgetOfExactType<InheritedShell>();

    if (inheritedShell == null) {
      throw Exception('No shell found in the current context');
    }

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
        if (sidebarRight != null && !mobile) sidebarRight!,
      ],
    );

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            if (Platform.isDesktop)
              desktopTopBar ??
                  WindowTitleBarBox(
                    child: MoveWindow(
                        child: Container(color: context.color.background)),
                  ),
            if (topBar != null && topBarOptions.topBarFullWidth && !mobile)
              topBar!,
            Expanded(child: inside),
          ],
        ),
        if (Platform.isMobile &&
            context.mediaQuery.orientation == Orientation.portrait)
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                color: context.color.background.withOpacity(
                  context.color.brightness == Brightness.dark ? 0.7 : 0.3,
                ),
                height: context.mediaQuery.padding.top,
                width: double.infinity,
              ),
            ),
          ),
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
