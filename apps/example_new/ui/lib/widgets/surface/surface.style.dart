import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

/// Style a Surface widget
@Style()
class SurfaceStyle {
  ///
  final Color? color;

  ///
  final Color? foregroundColor;

  ///
  final double? foregroundOpacity;

  ///
  final BorderRadiusGeometry? borderRadius;

  ///
  final List<SurfaceBorder>? border;

  ///
  final List<BoxShadow>? boxShadow;

  ///
  final BoxShape? shape;

  ///
  final EdgeInsetsGeometry? padding;

  /// Default style for all surfaces
  static SurfaceStyle defaultStyle(BuildContext context, Surface surface) {
    return SurfaceStyle(
      color: Colors.surface,
      borderRadius: BorderRadius.circular(6),
      border: [],
      // boxShadow: darkMode
      //     ? []
      //     : [
      //         BoxShadow(
      //           color: Colors.black.withValues(alpha: 0.1),
      //           blurRadius: 8,
      //         ),
      //       ],
    );
  }

  @override
  String toString() {
    return 'SurfaceStyle(\ncolor: $color,\nforegroundColor: $foregroundColor,\nborderRadius: $borderRadius,\n border: $border,\n boxShadow: $boxShadow,\n shape: $shape,\n padding: $padding\n)';
  }

  /// Comment for merge method
  SurfaceStyle mergeAlt(SurfaceStyle? style) {
    return SurfaceStyle(
      resolver: (resolvedStyle, context) {
        final originalStyle = resolver?.call(resolvedStyle, context);
        final newStyle = style?.resolver?.call(originalStyle, context);
        return newStyle;
      },
      color: style?.color ?? color,
      foregroundColor: style?.foregroundColor ?? foregroundColor,
      foregroundOpacity: style?.foregroundOpacity ?? foregroundOpacity,
      borderRadius: style?.borderRadius ?? borderRadius,
      border: style?.border ?? border,
      boxShadow: style?.boxShadow ?? boxShadow,
      shape: style?.shape ?? shape,
      padding: style?.padding ?? padding,
    );
  }

  /// Comment for resolve method
  SurfaceStyle resolveAlt(
    BuildContext context,
    SurfaceStyle? inlineStyle,
  ) {
    return mergeAlt(InheritedStyle.maybeOf<SurfaceStyle>(context)).mergeAlt(inlineStyle);
  }
}
