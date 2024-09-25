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
  final BoxBorder? border;

  ///
  final List<BoxShadow>? boxShadow;

  ///
  final BoxShape? shape;

  ///
  final EdgeInsetsGeometry? padding;

  /// Default style for all surfaces
  static SurfaceStyle defaultStyle(BuildContext context, Surface surface) {
    // final darkMode = context.theme.isDark;
    return SurfaceStyle(
      color: Colors.surface,
      borderRadius: BorderRadius.circular(8),
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
