import 'package:jolt/jolt.dart';

/// SurfaceTheme is a class that defines the theme of a [Surface].
class SurfaceTheme {
  /// SurfaceTheme is a class that defines the theme of a [Surface].
  const SurfaceTheme({
    this.borderRadius,
    this.borderWidth,
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

  /// The border width of the surface.
  final double? borderWidth;

  /// The horizontal padding of the surface.
  final double? horizontalPadding;

  /// The vertical padding of the surface.
  final double? verticalPadding;

  /// The background color of the surface.
  final Color? background;

  /// The background color of the surface when focused.
  final Color Function(Color background)? backgroundOnFocus;

  /// The background color of the surface when hovered.
  final Color Function(Color background)? backgroundOnHover;

  /// The border color of the surface.
  final Color Function(Color background)? borderColor;

  /// The border color of the surface when focused.
  final Color Function(Color background)? borderColorOnFocus;

  /// Merge two surface themes together.
  SurfaceTheme merge(SurfaceTheme? theme) {
    if (theme == null) return this; // ignore: avoid_returning_this
    return SurfaceTheme(
      borderRadius: theme.borderRadius ?? borderRadius,
      horizontalPadding: theme.horizontalPadding ?? horizontalPadding,
      verticalPadding: theme.verticalPadding ?? verticalPadding,
      background: theme.background ?? background,
      backgroundOnFocus: theme.backgroundOnFocus ?? backgroundOnFocus,
      backgroundOnHover: theme.backgroundOnHover ?? backgroundOnHover,
      borderColor: theme.borderColor ?? borderColor,
      borderWidth: theme.borderWidth ?? borderWidth,
      borderColorOnFocus: theme.borderColorOnFocus ?? borderColorOnFocus,
    );
  }

  /// Create a copy of the surface theme with the provided values.
  SurfaceTheme copyWith({
    BorderRadius? borderRadius,
    double? borderWidth,
    double? horizontalPadding,
    double? verticalPadding,
    Color? background,
    Color Function(Color background)? backgroundOnFocus,
    Color Function(Color background)? backgroundOnHover,
    Color Function(Color background)? borderColor,
    Color Function(Color background)? borderColorOnFocus,
  }) {
    return SurfaceTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      background: background ?? this.background,
      backgroundOnFocus: backgroundOnFocus ?? this.backgroundOnFocus,
      backgroundOnHover: backgroundOnHover ?? this.backgroundOnHover,
      borderColor: borderColor ?? this.borderColor,
      borderColorOnFocus: borderColorOnFocus ?? this.borderColorOnFocus,
    );
  }
}
