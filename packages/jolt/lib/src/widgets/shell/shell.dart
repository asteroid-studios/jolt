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
    final mobile = context.mediaQuery.size.width < 600;

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

    return Column(
      children: [
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
