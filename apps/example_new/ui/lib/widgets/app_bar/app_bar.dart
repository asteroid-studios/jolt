import 'package:ui/ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

///
class AppBar extends StatefulWidget {
  ///
  const AppBar({
    this.title,
    this.titleStyle,
    this.pinned = false,
    this.floating = false,
    this.fullWidth = false,
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
  final bool fullWidth;

  ///
  final bool floating;

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  bool visible = true;

  /// Scroll to the top of the scrollable widget
  void scrollToTop() {
    // TODOissue is that you cannot receive taps if the view is already scrolling
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
    final background = widget.background ?? Colors.background;
    final appBar = GestureDetector(
      onTap: scrollToTop,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + Spacing.sm,
          bottom: Spacing.sm,
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
                  if (showBack) const Gap.sm(),
                  Hero(
                    tag: '',
                    // tag: visible ? 'AppBarBack' : null,
                    flightShuttleBuilder: showBack ? null : flightShuttleFadeBuilder,
                    child: SizedBox(
                      height: 40,
                      child: showBack
                          ? Button.ghost(
                              // padding: Spacing.xs,
                              onTap: () => Navigator.of(context).maybePop(),
                              icon: Icon(
                                IconsBold.caretLeft,
                                size: Fonts.heading.sm.fontSize,
                              ),
                            )
                          : null,
                    ),
                  ),
                  if (showBack) const Gap.sm() else const Gap.lg(),
                  if (widget.title != null)
                    Expanded(
                      child: Hero(
                        tag: '',
                        // tag: visible ? 'AppBarTitle' : null,
                        child: Text(
                          widget.title!,
                          style: widget.titleStyle ?? Fonts.heading,
                        ),
                      ),
                    ),
                  Hero(
                    tag: '',
                    // tag: visible ? 'AppBarActions' : null,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        // TODOcome up with a better way to handle jumping when icon vs no icon
                        constraints: const BoxConstraints(minHeight: 40),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.actions,
                        ),
                      ),
                    ),
                  ),
                  const Gap.sm(),
                ],
              ),
              if (widget.bottom != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
                  child: widget.bottom,
                ),
            ],
          ),
        ),
      ),
    );

    // TODOI should be able to support an app bar that has a min and max varient by using
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

    return Section(
      blur: 5,
      fullWidth: widget.fullWidth,
      decoration: BoxDecoration(
        color: background.withOpacity(0.9),
        border: Border(
          bottom: BorderSide(
            color: Colors.outline,
          ),
        ),
      ),
      horizontalPadding: 0,
      floating: widget.floating,
      pinned: widget.pinned,
      child: appBar,
    );
  }
}

///
class TempAppBar extends StatelessWidget {
  ///
  const TempAppBar({this.title, this.showBack = true, this.trailing, super.key});

  ///
  final String? title;

  ///
  final bool showBack;

  ///
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Surface(
      padding: EdgeInsets.symmetric(vertical: Spacing.xs),
      style: (context, widget) => SurfaceStyle(
        color: Colors.background.withOpacity(0.9),
        borderRadius: BorderRadius.circular(0),
        blur: 5,
      ),
      child: Row(
        children: [
          if (showBack)
            Button.ghost(
              icon: IconsBold.caretLeft.icon,
              onTap: () => Navigator.of(context).maybePop(),
            )
          else
            const Gap.sm(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Spacing.xs),
              child: Text(
                title ?? '',
                style: Fonts.heading,
              ),
            ),
          ),
          if (trailing != null) trailing!,
          const Gap.sm(),
        ],
      ),
    );
  }
}
