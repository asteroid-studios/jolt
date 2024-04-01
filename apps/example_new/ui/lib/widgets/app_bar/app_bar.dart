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
  void scrollToTop() =>
      Scrollable.maybeOf(context)?.widget.controller?.animateTo(
            0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );

  @override
  Widget build(BuildContext context) {
    final showBack = !(ModalRoute.of(context)?.isFirst ?? false);
    final background = widget.background ?? color.background;
    final appBar = Title(
      color: background,
      title: widget.title ?? '',
      child: GestureDetector(
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
              child: Row(
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
            ),
          ),
        ),
      ),
    );

    if (widget.floating) {
      final scrollDirection = Scaffold.of(context).scrollDirection;
      final hideAppBar = scrollDirection == ScrollDirection.reverse;

      return SliverDynamicPersistentHeader(
        child: AbsorbPointer(
          absorbing: hideAppBar,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: hideAppBar ? 0 : 1,
            child: appBar,
          ),
        ),
      );
    }

    if (widget.pinned) return SliverDynamicPersistentHeader(child: appBar);

    return appBar;
  }
}
