import 'package:flutter/rendering.dart';
import 'package:jolt/jolt.dart';

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
