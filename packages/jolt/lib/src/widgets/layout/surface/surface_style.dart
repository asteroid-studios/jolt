import 'package:jolt/jolt.dart';

/// Defines the style of a surface
@immutable
class SurfaceStyle {
  /// Defines the style of a surface
  const SurfaceStyle({
    this.background,
    this.border,
    this.borderRadius,
    this.margin,
    this.padding,
    this.boxShadow,
  });

  /// The background of the surface
  final Color? background;

  /// The border of the surface
  final Border? border;

  /// The border radius of the surface.
  final BorderRadius? borderRadius;

  /// The margin of the surface
  final EdgeInsetsGeometry? margin;

  /// The padding of the surface
  final EdgeInsetsGeometry? padding;

  /// The box shadow of the surface
  ///
  /// You have access to the background of the surface to calculate the shadow
  final List<BoxShadow>? boxShadow;

  /// Merge two surface styles together.
  SurfaceStyle merge(SurfaceStyle? style) {
    // ignore: avoid_returning_this
    if (style == null) return this;

    var newBorder = style.border ?? border;
    if (newBorder != null && newBorder is BorderColor) {
      newBorder = (border ?? Border.all()).copyWithColor(newBorder.color);
    }
    return SurfaceStyle(
      background: style.background ?? background,
      border: newBorder,
      borderRadius: style.borderRadius ?? borderRadius,
      margin: style.margin ?? margin,
      padding: style.padding ?? padding,
      boxShadow: style.boxShadow ?? boxShadow,
    );
  }

  /// Copy with
  SurfaceStyle copyWith({
    Color? background,
    Border? border,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    List<BoxShadow>? boxShadow,
  }) {
    return SurfaceStyle(
      background: background ?? this.background,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      boxShadow: boxShadow ?? this.boxShadow,
    );
  }

  /// Equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is SurfaceStyle) {
      return other.background == background &&
          other.border == border &&
          other.borderRadius == borderRadius &&
          other.margin == margin &&
          other.padding == padding &&
          other.boxShadow == boxShadow;
    }
    return false;
  }

  /// To String Function
  @override
  String toString() {
    return '''
SurfaceStyle(
  background: $background,
  border: $border,
  borderRadius: $borderRadius,
  margin: $margin,
  padding: $padding, 
  boxShadow: $boxShadow
)''';
  }

  /// HashCode
  @override
  int get hashCode {
    return Object.hash(
      background,
      border,
      borderRadius,
      margin,
      padding,
      boxShadow,
    );
  }
}

///
class SurfaceColor {
  ///
  const SurfaceColor({
    required this.background,
    this.foreground,
    this.foregroundLight,
    this.border,
    this.shadow,
  }) : backgroundGradient = null;

  ///
  const SurfaceColor.gradient({
    required this.backgroundGradient,
    this.foreground,
    this.foregroundLight,
    this.border,
    this.shadow,
  }) : background = null;

  ///
  final Color? background;

  ///
  final Gradient? backgroundGradient;

  ///
  final Color? foreground;

  ///
  final Color? foregroundLight;

  ///
  final Color? border;

  ///
  final Color? shadow;

  // SurfaceColor fromColor(Color color, InteractionState? state ) {

  // }

  /// Merge
  SurfaceColor merge(SurfaceColor? style) {
    // ignore: avoid_returning_this
    if (style == null) return this;
    if (style.backgroundGradient != null) {
      return SurfaceColor.gradient(
        backgroundGradient: style.backgroundGradient ?? backgroundGradient,
        foreground: style.foreground ?? foreground,
        foregroundLight: style.foregroundLight ?? foregroundLight,
        border: style.border ?? border,
        shadow: style.shadow ?? shadow,
      );
    }
    return SurfaceColor(
      background: style.background ?? background,
      foreground: style.foreground ?? foreground,
      foregroundLight: style.foregroundLight ?? foregroundLight,
      border: style.border ?? border,
      shadow: style.shadow ?? shadow,
    );
  }
}

/// A class that defines a border color only
class BorderColor extends Border {
  /// Pass a BorderColor instead of a Border, to only override the color
  ///
  /// This is useful when you want to override the color of a border,
  /// but not the width or style
  ///
  /// This will only work when passing to widgets that use a Surface
  /// to define the border
  const BorderColor(this.color);

  /// The color of a border
  final Color? color;
}
