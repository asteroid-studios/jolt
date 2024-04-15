import 'package:flutter/rendering.dart';
import 'package:jolt/jolt.dart';

///
class JoltSliver extends SingleChildRenderObjectWidget {
  ///
  const JoltSliver({
    required super.child,
    super.key,
  });

  @override
  JoltRenderProxySliver createRenderObject(BuildContext context) {
    return JoltRenderProxySliver();
  }

  @override
  SingleChildRenderObjectElement createElement() {
    return _SingleChildRenderObjectElement(this);
  }
}

///
class JoltRenderProxySliver extends RenderProxySliver {}

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
