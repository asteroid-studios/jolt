import 'dart:math';

import 'package:ui/ui.dart';

///
class Section extends StatelessWidget {
  ///
  const Section({
    required this.child,
    this.pinned = false,
    this.floating = false,
    this.fillRemaining = false,
    this.fillMainAxis = false,
    this.fullWidth = false,
    this.fillMainAxisFraction = 1.0,
    this.maxContentWidth,
    this.background,
    this.decoration,
    this.blur = 0.0,
    super.key,
  })  : assert(
          !((fillMainAxis || fillRemaining || pinned || floating) &&
              child is SliverMultiBoxAdaptorWidget),
          '\n\nCannot combine fillMainAxis / fillRemaining / pinned / floating with any kind of SliverMultiBoxAdaptorWidget (SliverList etc)\n',
        ),
        assert(
          !(fillRemaining && fillMainAxis),
          '\n\nCannot combine fillRemaining / fillMainAxis\n',
        ),
        assert(
          !((fillMainAxis || fillRemaining) && (pinned || floating)),
          '\n\nCannot combine fillMainAxis / fillRemaining with pinned/floating\n',
        );

  ///
  final bool pinned;

  ///
  final bool floating;

  ///
  final bool fillRemaining;

  ///
  final bool fillMainAxis;

  ///
  final double fillMainAxisFraction;

  ///
  final bool fullWidth;

  ///
  final double? maxContentWidth;

  ///
  final Widget child;

  // TODO still need to work out how to handle some kind of expanded child

  /// Blur is only relevant for pinned and floating sections
  final double blur;

  ///
  final Color? background;

  ///
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    final contentWidth = maxContentWidth ?? 1200.0;
    final remainingWidth = max(context.mediaQuery.size.width - contentWidth, 0);
    final horizontalPadding = remainingWidth / 2 + 24.0;

    var section = child;

    if (!pinned && !floating) {
      if (fillRemaining) {
        section = SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        );
      }

      if (fillMainAxis) {
        section = SliverFillViewport(
          padEnds: false,
          viewportFraction: fillMainAxisFraction,
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) => child,
          ),
        );
      }

      return AnimatedDecoratedSliver(
        duration: surfaceDuration,
        decoration: decoration ?? BoxDecoration(color: background),
        sliver: SliverPadding(
          padding: fullWidth
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
          sliver: fillMainAxis ? section : JoltSliver(child: section),
        ),
      );
    }

    section = AnimatedContainer(
      duration: surfaceDuration,
      decoration: decoration ?? BoxDecoration(color: background),
      child: Padding(
        padding: fullWidth
            ? EdgeInsets.zero
            : EdgeInsets.only(
                left: horizontalPadding + context.mediaQuery.padding.left,
                right: horizontalPadding + context.mediaQuery.padding.right,
              ),
        child: child,
      ),
    );

    if (blur > 0) {
      section = Blur(
        blur: blur,
        child: section,
      );
    }

    return SliverDynamicPersistentHeader(
      pinned: pinned,
      floating: floating,
      child: section,
    );
  }
}
