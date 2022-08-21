import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

extension JoltButtonThemeExtension on ThemeData {
  JoltButtonThemeData? get joltButtonTheme => extension<JoltButtonThemeData>();
}

class JoltButtonThemeData extends ThemeExtension<JoltButtonThemeData> {
  const JoltButtonThemeData({
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.borderRadius,
    this.circularIconButtons = false,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final bool circularIconButtons;

  @override
  JoltButtonThemeData copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? textStyle,
    double? borderRadius,
    bool? circularIconButtons,
  }) {
    return JoltButtonThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      textStyle: textStyle ?? this.textStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      circularIconButtons: circularIconButtons ?? this.circularIconButtons,
    );
  }

  @override
  JoltButtonThemeData lerp(
      ThemeExtension<JoltButtonThemeData>? other, double t) {
    if (other is! JoltButtonThemeData) return this;
    return JoltButtonThemeData(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      circularIconButtons:
          t < 0.5 ? circularIconButtons : other.circularIconButtons,
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
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(circularIconButtons, other.circularIconButtons));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(backgroundColor),
        const DeepCollectionEquality().hash(foregroundColor),
        const DeepCollectionEquality().hash(textStyle),
        const DeepCollectionEquality().hash(borderRadius),
        const DeepCollectionEquality().hash(circularIconButtons));
  }
}

// part 'jolt_button_theme_data.tailor.dart';

// To re-run the generation use the line below:
// flutter pub run build_runner build --delete-conflicting-outputs
// After generating remove required from nullable fields
// Right now after generating I have to go in and fix the output,
// because there is no support for nullable options with Theme Tailor

// @TailorComponent(themes: [])
// class _$JoltButtonThemeData {
//   static List<Color?>? backgroundColor;
//   static List<Color?>? foregroundColor;
//   static List<TextStyle?>? textStyle;
//   static List<double?>? borderRadius;
//   static List<bool?>? circularIconButtons;
// }
