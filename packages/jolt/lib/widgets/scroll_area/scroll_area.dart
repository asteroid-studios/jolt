import 'package:flutter/rendering.dart';
import 'package:jolt/jolt.dart';

/// A version of CustomScrollView that will take a list of any kind of widget
///
/// If a passed widget is not a sliver, it will be wrapped in a sliver.
class ScrollArea extends CustomScrollView {
  /// Create a new ScrollView
  const ScrollArea({
    required List<Widget> children,
    super.key,
    super.controller,
    super.scrollDirection,
    super.physics,
    super.primary = true,
    super.anchor,
    super.cacheExtent,
    super.center,
    super.clipBehavior,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.reverse,
    super.scrollBehavior,
    super.semanticChildCount,
    super.shrinkWrap,
  }) : super(slivers: children);

  @override
  List<Widget> buildSlivers(BuildContext context) {
    final padding = ScrollAreaPadding.of(context);
    return [
      if (padding.top > 0)
        SliverToBoxAdapter(child: SizedBox(height: padding.top)),
      ...super.buildSlivers(context).map((child) => _Sliver(child: child)),
      if (padding.bottom > 0)
        SliverToBoxAdapter(child: SizedBox(height: padding.bottom)),
    ];
  }
}

class _Sliver extends SingleChildRenderObjectWidget {
  const _Sliver({
    required super.child,
  });

  @override
  _RenderProxySliver createRenderObject(BuildContext context) {
    return _RenderProxySliver();
  }

  @override
  SingleChildRenderObjectElement createElement() {
    return _SingleChildRenderObjectElement(this);
  }
}

class _RenderProxySliver extends RenderProxySliver {}

class _SingleChildRenderObjectElement extends SingleChildRenderObjectElement {
  _SingleChildRenderObjectElement(super.widget);

  RenderSliverToBoxAdapter? _adapter;

  @override
  void insertRenderObjectChild(RenderObject child, Object? slot) {
    final renderObject =
        this.renderObject as RenderObjectWithChildMixin<RenderObject>;
    assert(slot == null, 'Slivers do not support having children with slots.');
    final RenderObject proxyChild;
    if (child is RenderBox) {
      _adapter ??= RenderSliverToBoxAdapter();
      _adapter!.child = child;
      proxyChild = _adapter!;
    } else {
      proxyChild = child;
      assert(
          renderObject.debugValidateChild(child),
          'Invalid child for '
          '$renderObject:\n$child\n'
          'Only RenderBox objects are allowed as children of slivers.');
    }
    super.insertRenderObjectChild(proxyChild, slot);
  }

  @override
  void removeRenderObjectChild(RenderObject child, Object? slot) {
    final renderObject =
        this.renderObject as RenderObjectWithChildMixin<RenderObject>;
    assert(slot == null, 'Slivers do not support having children with slots.');
    assert(() {
      final RenderObject proxyChild;
      if (child is RenderBox) {
        assert(
          _adapter != null,
          'RenderBox child must have a non-null adapter.',
        );
        proxyChild = _adapter!;
      } else {
        proxyChild = child;
      }
      return renderObject.child == proxyChild;
    }(), 'Child render object does not match expected render object.');
    renderObject.child = null;
    assert(
        renderObject == this.renderObject,
        'RenderObjects cannot change '
        'their parent or slot assignment after they have been inserted.');
  }

  @override
  void unmount() {
    _adapter?.dispose();
    _adapter = null;
    super.unmount();
  }
}

///
class ScrollAreaPadding extends InheritedWidget {
  ///
  const ScrollAreaPadding({
    required this.padding,
    required super.child,
    super.key,
  });

  ///
  final VerticalInsets padding;

  ///
  static VerticalInsets of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<ScrollAreaPadding>()
            ?.padding ??
        const VerticalInsets();
  }

  @override
  bool updateShouldNotify(ScrollAreaPadding oldWidget) =>
      padding != oldWidget.padding;
}

///
@immutable
class VerticalInsets {
  ///
  const VerticalInsets({
    this.top = 0,
    this.bottom = 0,
  });

  ///
  final double top;

  ///
  final double bottom;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VerticalInsets &&
        other.top == top &&
        other.bottom == bottom;
  }

  @override
  int get hashCode => top.hashCode ^ bottom.hashCode;
}
