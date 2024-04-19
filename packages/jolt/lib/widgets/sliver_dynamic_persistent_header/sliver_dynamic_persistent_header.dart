import 'package:flutter/rendering.dart';
import 'package:jolt/jolt.dart';
import 'package:jolt/widgets/sliver_dynamic_persistent_header/sliver_persistent_header.dart';
import 'package:sliver_tools/sliver_tools.dart';

///
class SliverDynamicPersistentHeader extends StatefulWidget {
  ///
  const SliverDynamicPersistentHeader({
    required this.child,
    this.expandedChild,
    this.pinned = false,
    this.floating = false,
    super.key,
  });

  ///
  final bool pinned;

  ///
  final bool floating;

  ///
  final Widget child;

  ///
  final Widget? expandedChild;

  @override
  State<SliverDynamicPersistentHeader> createState() =>
      _SliverDynamicPersistentHeaderState();
}

class _SliverDynamicPersistentHeaderState
    extends State<SliverDynamicPersistentHeader> {
  late Size size = Size.zero;
  Size? expandedSize;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverPersistentHeader(
          pinned: widget.pinned,
          floating: widget.floating,
          delegate: _SliverAppBarDelegate(
            child: widget.child,
            expandedChild: widget.expandedChild,
            minHeight: size.height,
            maxHeight: expandedSize?.height ?? size.height,
          ),
        ),
        SliverOffstage(
          sliver: SliverToBoxAdapter(
            child: IgnoreHeroScope(
              child: MeasurableWidget(
                onChange: (newSize) => setState(() => size = newSize),
                child: widget.child,
              ),
            ),
          ),
        ),
        if (widget.expandedChild != null)
          SliverOffstage(
            sliver: SliverToBoxAdapter(
              child: IgnoreHeroScope(
                child: MeasurableWidget(
                  onChange: (newSize) => setState(() => expandedSize = newSize),
                  child: widget.expandedChild,
                ),
              ),
            ),
          ),
        if (size == Size.zero)
          SliverToBoxAdapter(
            child: IgnoreHeroScope(
              child: widget.expandedChild ?? widget.child,
            ),
          ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
    this.expandedChild,
  });

  final Widget child;
  final Widget? expandedChild;

  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // When shrinkOffset is 0, the expandedChild is shown
    // When shrinkOffset is maxExtent, the child is shown
    // return SizedBox.expand(child: child);
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

///
class MeasureSizeRenderObject extends RenderProxyBox {
  ///
  MeasureSizeRenderObject(this.onChange);

  ///
  void Function(Size size) onChange;

  Size _prevSize = Size.zero;

  @override
  void performLayout() {
    super.performLayout();
    final newSize = child!.size;
    if (_prevSize == newSize) return;
    _prevSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) => onChange(newSize));
  }
}

///
class MeasurableWidget extends SingleChildRenderObjectWidget {
  ///
  const MeasurableWidget({
    required this.onChange,
    super.key,
    super.child,
  });

  ///
  final void Function(Size size) onChange;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      MeasureSizeRenderObject(onChange);
}
