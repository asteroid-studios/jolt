import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

///
enum SliverHeaderBehavior {
  ///
  pinned,

  ///
  floating,
}

///
class SliverDynamicPersistentHeader extends SingleChildRenderObjectWidget {
  ///
  const SliverDynamicPersistentHeader({
    required super.child,
    this.scrollBehavior = SliverHeaderBehavior.floating,
    super.key,
  });

  ///
  final SliverHeaderBehavior scrollBehavior;

  @override
  RenderObject createRenderObject(BuildContext context) {
    switch (scrollBehavior) {
      case SliverHeaderBehavior.pinned:
        return _RenderSliverPinnedPersistentHeader();
      case SliverHeaderBehavior.floating:
        return _RenderSliverFloatingPersistentHeader(
          showOnScreenConfiguration:
              const PersistentHeaderShowOnScreenConfiguration(),
        );
    }
  }
}

class _RenderSliverPinnedPersistentHeader
    extends RenderSliverPinnedPersistentHeader {
  @override
  double get maxExtent =>
      child!.getMaxIntrinsicHeight(constraints.crossAxisExtent);

  @override
  double get minExtent => maxExtent;
}

class _RenderSliverFloatingPersistentHeader
    extends RenderSliverFloatingPersistentHeader {
  _RenderSliverFloatingPersistentHeader({
    required super.showOnScreenConfiguration,
  });

  @override
  double get maxExtent =>
      child!.getMaxIntrinsicHeight(constraints.crossAxisExtent);

  @override
  double get minExtent => maxExtent;
}
