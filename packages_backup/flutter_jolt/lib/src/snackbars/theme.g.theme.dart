// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'theme.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<JoltSnackbarThemeData> {
  @override
  ThemeExtension<JoltSnackbarThemeData> copyWith({
    IconData? iconSuccess,
    IconData? iconInfo,
    IconData? iconWarning,
    IconData? iconError,
  }) {
    final object = this as JoltSnackbarThemeData;

    return JoltSnackbarThemeData(
      iconSuccess: iconSuccess ?? object.iconSuccess,
      iconInfo: iconInfo ?? object.iconInfo,
      iconWarning: iconWarning ?? object.iconWarning,
      iconError: iconError ?? object.iconError,
    );
  }

  @override
  ThemeExtension<JoltSnackbarThemeData> lerp(
    ThemeExtension<JoltSnackbarThemeData>? other,
    double t,
  ) {
    final otherValue = other;

    if (otherValue is! JoltSnackbarThemeData) {
      return this;
    }

    final value = this as JoltSnackbarThemeData;

    return JoltSnackbarThemeData(
      iconSuccess: otherValue.iconSuccess,
      iconInfo: otherValue.iconInfo,
      iconWarning: otherValue.iconWarning,
      iconError: otherValue.iconError,
    );
  }

  @override
  bool operator ==(Object other) {
    final value = this as JoltSnackbarThemeData;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JoltSnackbarThemeData &&
            identical(value.iconSuccess, other.iconSuccess) &&
            identical(value.iconInfo, other.iconInfo) &&
            identical(value.iconWarning, other.iconWarning) &&
            identical(value.iconError, other.iconError));
  }

  @override
  int get hashCode {
    final value = this as JoltSnackbarThemeData;

    return Object.hash(
      runtimeType,
      value.iconSuccess,
      value.iconInfo,
      value.iconWarning,
      value.iconError,
    );
  }
}

extension JoltSnackbarThemeDataBuildContext on BuildContext {
  JoltSnackbarThemeData get joltSnackbarThemeData =>
      Theme.of(this).extension<JoltSnackbarThemeData>()!;
}
