import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:ui/ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

///
class AppBar extends StatefulWidget {
  ///
  const AppBar({
    this.title,
    this.titleStyle,
    this.pinned = true,
    this.floating = false,
    this.bottom,
    this.background,
    this.actions = const [],
    super.key,
  });

  ///
  final String? title;

  ///
  final TextStyle? titleStyle;

  ///
  final List<Widget> actions;

  /// The widget to display at the bottom of the app bar
  final Widget? bottom;

  ///
  final Color? background;

  ///
  final bool pinned;

  ///
  final bool floating;

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> with ThemeValues {
  bool visible = true;

  /// Scroll to the top of the scrollable widget
  void scrollToTop() {
    // TODO issue is that you cannot receive taps if the view is already scrolling
    // Because of this, the user has to tap twice to scroll to the top
    // https://github.com/flutter/flutter/issues/42588
    // https://github.com/flutter/flutter/issues/92119
    Scrollable.maybeOf(context)?.position.animateTo(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
  }

  @override
  Widget build(BuildContext context) {
    final showBack = !(ModalRoute.of(context)?.isFirst ?? false);
    final background = widget.background ?? color.background;
    final appBar = GestureDetector(
      onTap: scrollToTop,
      child: Blur(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top + Spacing.sm,
            left: Spacing.lg,
            right: Spacing.lg,
            bottom: Spacing.sm,
          ),
          decoration: BoxDecoration(
            color: background.withOpacity(0.9),
            border: Border(
              bottom: BorderSide(
                color: color.outline,
              ),
            ),
          ),
          child: VisibilityDetector(
            key: const Key('AppBar'),
            onVisibilityChanged: (visibilityInfo) {
              final isVisible = visibilityInfo.visibleFraction == 1;
              if (visible != isVisible && context.mounted) {
                setState(() => visible = isVisible);
              }
            },
            child: Column(
              children: [
                Row(
                  children: [
                    HeroOptional(
                      tag: visible ? 'AppBarBack' : null,
                      flightShuttleBuilder:
                          showBack ? null : flightShuttleFadeBuilder,
                      transitionOnUserGestures: true,
                      child: SizedBox(
                        height: 40,
                        child: showBack
                            ? GestureDetector(
                                onTap: () => Navigator.of(context).maybePop(),
                                child: Icon(
                                  IconsBold.caretLeft,
                                  size: text.heading.sm.fontSize,
                                ),
                              )
                            : null,
                      ),
                    ),
                    if (showBack) const Gap.sm(),
                    if (widget.title != null)
                      Expanded(
                        child: HeroOptional(
                          tag: visible ? 'AppBarTitle' : null,
                          child: Text(
                            widget.title!,
                            style: widget.titleStyle ?? text.heading,
                          ),
                        ),
                      ),
                    HeroOptional(
                      tag: visible ? 'AppBarActions' : null,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          // TODO come up with a better way to handle jumping when icon vs no icon
                          constraints: const BoxConstraints(minHeight: 40),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: widget.actions,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.bottom != null) widget.bottom!,
              ],
            ),
          ),
        ),
      ),
    );

    // TODO I should be able to support an app bar that has a min and max varient by using
    // Scrollable.of(context).position.pixels.
    // They can set a min and max height, then I can animate between the two
    // Using current value of pixels.

    // Mainly need to work out what kind of animations people would want to support
    // Maybe it should be a totally separate app bar with a builder method,
    // Instead of trying to support all the different use cases in one widget

    // So AppBar.builder(
    //  builder: (context, expanded) {
    //   return expanded ? ExpandedOption() : Collapsed();
    //  }
    // ),

    if (widget.floating) {
      final scrollDirection = Scaffold.of(context).scrollDirection;
      final hideAppBar = scrollDirection == ScrollDirection.reverse;

      return SliverDynamicPersistentHeader(
        // scrollBehavior: SliverHeaderBehavior.floating,
        child: appBar,
      );
    }

    if (widget.pinned) return SliverDynamicPersistentHeader(child: appBar);

    return appBar;
  }
}

///
class Floating extends StatefulWidget {
  ///
  const Floating({
    required this.child,
    super.key,
  });

  ///
  final Widget child;

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Scrollable.of(context).position,
      builder: (context, child) {
        final position = Scrollable.of(context).position;
        return Collapsible(
          alignment: Alignment.bottomCenter,
          collapsedSizeOffset: position.pixels,
          collapsed: true,
          child: widget.child,
        );
      },
    );
  }
}
