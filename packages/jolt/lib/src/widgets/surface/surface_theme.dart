import 'package:jolt/jolt.dart';

/// SurfaceTheme is a class that defines the theme of a [Surface].
class SurfaceTheme {
  /// SurfaceTheme is a class that defines the theme of a [Surface].
  const SurfaceTheme({
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.background,
    this.backgroundOnFocus,
    this.backgroundOnHover,
    this.borderColor,
    this.borderColorOnFocus,
  });

  /// The border radius of the surface.
  /// Defaults to medium.
  final BorderRadius? borderRadius;

  ///
  final double? horizontalPadding;

  ///
  final double? verticalPadding;

  ///
  final Color? background;

  ///
  final Color? backgroundOnFocus;

  ///
  final Color? backgroundOnHover;

  ///
  final Color? borderColor;

  ///
  final Color? borderColorOnFocus;
}
