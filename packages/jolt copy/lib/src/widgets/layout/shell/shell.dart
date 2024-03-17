import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:jolt_copy/jolt.dart';

///
class Shell extends StatefulWidget {
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
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  double bottomBarHeight = 0;

  @override
  Widget build(BuildContext context) {
    final topBarType = widget.options.topBarType;
    final footerType = widget.options.footerType;

    final inside = Row(
      children: [
        if (widget.sideBarLeft != null) widget.sideBarLeft!,
        Expanded(
          child: OverlayStack(
            child: Column(
              children: [
                if (widget.topBar != null && topBarType == TopBarType.pinned)
                  widget.topBar!,
                Expanded(
                  child: ClipRect(
                    child: InheritedShell._(
                      topBar: topBarType == TopBarType.floating
                          ? widget.topBar
                          : null,
                      footer: footerType == FooterType.floating
                          ? widget.footer
                          : null,
                      bottomBarHeight: bottomBarHeight,
                      child: widget.child,
                    ),
                  ),
                ),
                if (widget.footer != null && footerType == FooterType.pinned)
                  widget.footer!,
              ],
            ),
          ),
        ),
        if (widget.sideBarRight != null) widget.sideBarRight!,
      ],
    );

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            if (Platform.isDesktop)
              widget.desktopTopBar ?? _DefaultDesktopTopBar(),
            if (widget.topBar != null && topBarType == TopBarType.fullWidth)
              widget.topBar!,
            Expanded(child: inside),
          ],
        ),
        if (widget.bottomBar != null)
          SizeReportingWidget(
            onSizeChange: (size) =>
                setState(() => bottomBarHeight = size.height),
            child: widget.bottomBar!,
          ),
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
    required this.bottomBarHeight,
    this.topBar,
    this.footer,
  });

  ///
  final Widget? topBar;

  ///
  final Widget? footer;

  ///
  final double bottomBarHeight;

  @override
  bool updateShouldNotify(InheritedShell oldWidget) {
    return topBar != oldWidget.topBar ||
        footer != oldWidget.footer ||
        bottomBarHeight != oldWidget.bottomBarHeight;
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
