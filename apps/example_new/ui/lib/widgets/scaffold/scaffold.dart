import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:ui/ui.dart';

// TODOuse a better implementation using CustomMultiChildLayout
// https://api.flutter.dev/flutter/widgets/CustomMultiChildLayout-class.html
///
class Scaffold extends StatefulWidget {
  ///
  const Scaffold({
    required this.content,
    this.bottomBar,
    this.sidebarLeft,
    this.sidebarRight,
    this.safeAreaTop = true,
    this.safeAreaBottom = false,
    this.background,
    this.backgroundStatusBar,
    super.key,
  });

  ///
  final Widget content;

  ///
  final Widget? sidebarLeft;

  ///
  final Widget? sidebarRight;

  ///
  final Widget? bottomBar;

  ///
  final Color? background;

  /// Set the background color for the status bar area
  ///
  /// Useful if you want to match the status bar with your app bar
  final Color? backgroundStatusBar;

  ///
  final bool safeAreaTop;

  ///
  final bool safeAreaBottom;

  @override
  State<Scaffold> createState() => ScaffoldState();

  ///
  static ScaffoldState of(BuildContext context) {
    final scaffoldScope =
        context.dependOnInheritedWidgetOfExactType<_ScaffoldScope>();
    if (scaffoldScope == null) {
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary(
            'Scaffold.of() called with a context that does not contain a Scaffold.',
          ),
          ErrorDescription(
            'This usually happens when the context provided is from the same StatefulWidget as that '
            'whose build function actually creates the Scaffold widget being sought.',
          ),
          ErrorHint(
            'There are several ways to avoid this problem. The simplest is to use a Builder to get a '
            'context that is "under" the Scaffold. For an example of this, please see the '
            'documentation for Scaffold.of():\n'
            '  https://api.flutter.dev/flutter/material/Scaffold/of.html',
          ),
          ErrorHint(
            'A more efficient solution is to split your build function into several widgets. This '
            'introduces a new context from which you can obtain the Scaffold. In this solution, '
            'you would have an outer widget that creates the Scaffold populated by instances of '
            'your new inner widgets, and then in these inner widgets you would use Scaffold.geometryOf().',
          ),
          context.describeElement('The context used was'),
        ],
      );
    }
    return scaffoldScope.state;
  }
}

///
class ScaffoldState extends State<Scaffold> with ThemeValues {
  ///
  ScrollDirection scrollDirection = ScrollDirection.idle;

  ///
  void scrollToTop() {
    setState(() => scrollDirection = ScrollDirection.forward);
    PrimaryScrollController.maybeOf(context)?.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final background = widget.background ?? color.background;
    final backgroundBrightness =
        background.isDark ? Brightness.dark : Brightness.light;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: backgroundBrightness,
        statusBarIconBrightness: backgroundBrightness,
      ),
      child: AnimatedContainer(
        padding: EdgeInsets.only(
          bottom: widget.safeAreaBottom ? context.mediaQuery.padding.bottom : 0,
        ),
        duration: surfaceDuration,
        color: background,
        child: Column(
          children: [
            if (widget.safeAreaTop)
              GestureDetector(
                onTap: scrollToTop,
                child: AnimatedContainer(
                  duration: surfaceDuration,
                  color: widget.backgroundStatusBar ?? background,
                  height: context.mediaQuery.padding.top,
                ),
              ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: widget.safeAreaTop,
                removeBottom: widget.safeAreaBottom,
                child: NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final direction = notification.direction;
                    if (direction == ScrollDirection.idle ||
                        direction == scrollDirection) {
                      return true;
                    }
                    final pixels = notification.metrics.pixels;
                    if (direction == ScrollDirection.reverse && pixels < -50) {
                      return true;
                    }
                    setState(() => scrollDirection = direction);
                    return true;
                  },
                  child: _ScaffoldScope(
                    state: this,
                    child: Row(
                      children: [
                        if (widget.sidebarLeft != null) widget.sidebarLeft!,
                        Expanded(
                          child: Stack(
                            children: [
                              ScrollAreaCaps(
                                end: const [
                                  Gap(80),
                                ],
                                child: widget.content,
                              ),
                              if (widget.bottomBar != null)
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: widget.bottomBar,
                                ),
                            ],
                          ),
                        ),
                        if (widget.sidebarRight != null) widget.sidebarRight!,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScaffoldScope extends InheritedWidget {
  const _ScaffoldScope({
    required this.state,
    required super.child,
  });

  final ScaffoldState state;

  @override
  bool updateShouldNotify(_ScaffoldScope oldWidget) => true;
}
