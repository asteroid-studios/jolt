// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'jolt_button_theme_data.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class JoltButtonThemeData extends ThemeExtension<JoltButtonThemeData> {
  const JoltButtonThemeData({
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;

  @override
  JoltButtonThemeData copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
  }) {
    return JoltButtonThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  JoltButtonThemeData lerp(
      ThemeExtension<JoltButtonThemeData>? other, double t) {
    if (other is! JoltButtonThemeData) return this;
    return JoltButtonThemeData(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JoltButtonThemeData &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(foregroundColor, other.foregroundColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(backgroundColor),
        const DeepCollectionEquality().hash(foregroundColor),
        const DeepCollectionEquality().hash(borderRadius));
  }
}
