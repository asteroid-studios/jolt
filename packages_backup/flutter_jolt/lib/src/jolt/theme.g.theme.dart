// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'theme.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<JoltThemeData> {
  @override
  ThemeExtension<JoltThemeData> copyWith({
    double? borderRadius,
  }) {
    final object = this as JoltThemeData;

    return JoltThemeData(
      borderRadius: borderRadius ?? object.borderRadius,
    );
  }

  @override
  ThemeExtension<JoltThemeData> lerp(
    ThemeExtension<JoltThemeData>? other,
    double t,
  ) {
    final otherValue = other;

    if (otherValue is! JoltThemeData) {
      return this;
    }

    final value = this as JoltThemeData;

    return JoltThemeData(
      borderRadius: otherValue.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    final value = this as JoltThemeData;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JoltThemeData &&
            identical(value.borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    final value = this as JoltThemeData;

    return Object.hash(
      runtimeType,
      value.borderRadius,
    );
  }
}

extension JoltThemeDataBuildContext on BuildContext {
  JoltThemeData get joltThemeData => Theme.of(this).extension<JoltThemeData>()!;
}
