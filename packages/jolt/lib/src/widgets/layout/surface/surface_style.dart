import 'package:jolt/jolt.dart';

/// Defines the style of a surface
@immutable
class SurfaceStyle {
  /// Defines the style of a surface
  const SurfaceStyle({
    this.background,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.margin,
    this.padding,
    this.boxShadow,
  });

  /// The background of the surface
  final JoltColor? background;

  /// The border color of the surface
  final Color? borderColor;

  /// The border radius of the surface.
  final BorderRadius? borderRadius;

  /// The border width of the surface.
  final double? borderWidth;

  /// The margin of the surface
  final EdgeInsetsGeometry? margin;

  /// The padding of the surface
  final EdgeInsetsGeometry? padding;

  /// The box shadow of the surface
  ///
  /// You have access to the background of the surface to calculate the shadow
  final List<BoxShadow> Function(JoltColor background)? boxShadow;

  /// Merge two surface styles together.
  SurfaceStyle merge(SurfaceStyle? style) {
    // ignore: avoid_returning_this
    if (style == null) return this;
    return SurfaceStyle(
      background: style.background ?? background,
      borderColor: style.borderColor ?? borderColor,
      borderRadius: style.borderRadius ?? borderRadius,
      borderWidth: style.borderWidth ?? borderWidth,
      margin: style.margin ?? margin,
      padding: style.padding ?? padding,
      boxShadow: style.boxShadow ?? boxShadow,
    );
  }

  /// Copy with
  SurfaceStyle copyWith({
    JoltColor? background,
    Color? borderColor,
    BorderRadius? borderRadius,
    double? borderWidth,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    List<BoxShadow> Function(JoltColor background)? boxShadow,
  }) {
    return SurfaceStyle(
      background: background ?? this.background,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
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
          other.borderColor == borderColor &&
          other.borderRadius == borderRadius &&
          other.borderWidth == borderWidth &&
          other.margin == margin &&
          other.padding == padding &&
          other.boxShadow == boxShadow;
    }
    return false;
  }

  /// To String Function
  @override
  String toString() {
    return '''SurfaceStyle(
  background: $background,
  borderColor: $borderColor,
  borderRadius: $borderRadius,
  borderWidth: $borderWidth,
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
      borderColor,
      borderRadius,
      borderWidth,
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
  });

  ///
  final Color background;

  ///
  final Color? foreground;

  ///
  final Color? foregroundLight;

  ///
  final Color? border;

  ///
  final Color? shadow;
}
