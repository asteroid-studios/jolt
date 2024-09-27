import 'package:ui/ui.dart';

///
class SurfaceBorder {
  ///
  const SurfaceBorder({
    SurfaceBorderSide? top,
    SurfaceBorderSide? right,
    SurfaceBorderSide? bottom,
    SurfaceBorderSide? left,
    this.borderRadius,
  })  : top = top ?? _none,
        right = right ?? _none,
        bottom = bottom ?? _none,
        left = left ?? _none;

  ///
  factory SurfaceBorder.all({
    double? gap,
    Color? color,
    double? width,
    BorderStyle? style,
    BorderRadiusGeometry? borderRadius,
  }) {
    final side = SurfaceBorderSide(
      gap: gap,
      color: color,
      width: width ?? 1,
      style: style ?? BorderStyle.solid,
    );
    return SurfaceBorder(
      borderRadius: borderRadius,
      top: side,
      right: side,
      bottom: side,
      left: side,
    );
  }

  ///
  final SurfaceBorderSide top;

  ///
  final SurfaceBorderSide right;

  ///
  final SurfaceBorderSide bottom;

  ///
  final SurfaceBorderSide left;

  ///
  final BorderRadiusGeometry? borderRadius;

  static const SurfaceBorderSide _none = SurfaceBorderSide.none;
}

///
class SurfaceBorderSide {
  ///
  const SurfaceBorderSide({
    double? gap,
    this.color,
    this.borderRadius,
    this.width = 1,
    this.style = BorderStyle.solid,
  }) : gap = gap ?? 0;

  ///
  final double gap;

  ///
  final double? borderRadius;

  /// Defaults to Colors.outline
  final Color? color;

  ///
  final double width;

  ///
  final BorderStyle style;

  ///
  static const SurfaceBorderSide none = SurfaceBorderSide(color: Colors.transparent, width: 0, style: BorderStyle.none);
}
