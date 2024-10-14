import 'package:jolt/jolt.dart';

/// A version of CustomScrollView that will take a list of any kind of widget
///
/// If a passed widget is not a sliver, it will be wrapped in a sliver.
class ScrollArea extends StatelessWidget {
  /// Create a new ScrollView
  const ScrollArea({
    required this.children,
    this.physics,
    this.scrollDirection = Axis.vertical,
    // super.controller,
    // super.scrollDirection,
    // super.physics,
    // super.primary = true,
    // super.anchor,
    // super.cacheExtent,
    // super.center,
    // super.clipBehavior,
    // super.dragStartBehavior,
    // super.keyboardDismissBehavior,
    // super.restorationId,
    // super.reverse,
    // super.scrollBehavior,
    // super.semanticChildCount,
    // super.shrinkWrap,
    this.ignoreEndPadding = false,
    super.key,
  });

  ///
  factory ScrollArea.fill({
    required Widget child,
    Axis? scrollDirection,
    ScrollPhysics? physics,
    Key? key,
  }) {
    return ScrollArea(
      key: key,
      scrollDirection: scrollDirection ?? Axis.vertical,
      ignoreEndPadding: true,
      physics: physics,
      children: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Builder(
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(bottom: ScrollPadding.of(context).end),
                child: child,
              );
            },
          ),
        ),
      ],
    );
  }

  /// The children to display in the scroll view
  final List<Widget> children;

  /// If true, the end padding will be ignored
  ///
  /// Useful if you are using a fillRemaining at the end of the view
  final bool ignoreEndPadding;

  ///
  final ScrollPhysics? physics;

  ///
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    final physics = this.physics ??
        ScrollConfiguration.of(context).getScrollPhysics(context);
    final padding = ScrollPadding.of(context);
    final slivers = children;

    return CustomScrollView(
      physics: physics,
      scrollDirection: scrollDirection,
      slivers: [
        // Persistent header used here because if the scroll view
        // has its own pinned headers,
        // then they should sit underneath the scroll stack ends
        if (padding.start > 0)
          SliverPersistentHeader(
            pinned: true,
            delegate: _FixedExtentDelegate(padding.start),
          ),
        ...slivers.map((child) => JoltSliver(child: child)),
        if (padding.end > 0 && !ignoreEndPadding)
          SliverPersistentHeader(
            delegate: _FixedExtentDelegate(padding.end),
          ),
      ],
    );
  }
}

class _FixedExtentDelegate extends SliverPersistentHeaderDelegate {
  _FixedExtentDelegate(this.extent);

  final double extent;

  @override
  double get minExtent => extent;

  @override
  double get maxExtent => extent;

  @override
  Widget build(_, __, ___) {
    final direction = Scrollable.of(_).axisDirection;
    if (direction == AxisDirection.left || direction == AxisDirection.right) {
      return SizedBox(width: extent);
    }
    return SizedBox(height: extent);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent ||
        minExtent != oldDelegate.minExtent;
  }
}
