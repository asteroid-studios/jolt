// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'theme.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<JoltTextThemeData> {
  @override
  ThemeExtension<JoltTextThemeData> copyWith({
    TextStyle? defaultTextStyle,
  }) {
    final object = this as JoltTextThemeData;

    return JoltTextThemeData(
      defaultTextStyle: defaultTextStyle ?? object.defaultTextStyle,
    );
  }

  @override
  ThemeExtension<JoltTextThemeData> lerp(
    ThemeExtension<JoltTextThemeData>? other,
    double t,
  ) {
    final otherValue = other;

    if (otherValue is! JoltTextThemeData) {
      return this;
    }

    final value = this as JoltTextThemeData;

    return JoltTextThemeData(
      defaultTextStyle: TextStyle.lerp(
        value.defaultTextStyle,
        otherValue.defaultTextStyle,
        t,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    final value = this as JoltTextThemeData;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JoltTextThemeData &&
            identical(value.defaultTextStyle, other.defaultTextStyle));
  }

  @override
  int get hashCode {
    final value = this as JoltTextThemeData;

    return Object.hash(
      runtimeType,
      value.defaultTextStyle,
    );
  }
}

extension JoltTextThemeDataBuildContext on BuildContext {
  JoltTextThemeData get joltTextThemeData =>
      Theme.of(this).extension<JoltTextThemeData>()!;
}
