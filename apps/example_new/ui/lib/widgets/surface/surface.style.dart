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
  final BorderRadiusGeometry? borderRadius;

  ///
  final List<SurfaceBorder>? border;

  ///
  final List<BoxShadow>? boxShadow;

  ///
  final BoxShape? shape;

  ///
  final EdgeInsetsGeometry? padding;

  // TODO work out a way for these to merge instead of replace
  // Maybe a list of functions that can be called in order
  // TODO maybe I should generate this with macro
  // I could also have these resolvers built into the resolve method, so it's not an extra call.
  ///
  final SurfaceStyle? Function(SurfaceStyle? style)? resolver;

  /// Default style for all surfaces
  static SurfaceStyle defaultStyle(BuildContext context, Surface surface) {
    // final darkMode = context.theme.isDark;
    return SurfaceStyle(
      color: Colors.surface,
      borderRadius: BorderRadius.circular(8),
      border: [],
      // color: darkMode ? Colors.surface : Colors.background,
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
}
