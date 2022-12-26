// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'theme.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<SemanticColorThemeData> {
  @override
  ThemeExtension<SemanticColorThemeData> copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
  }) {
    final object = this as SemanticColorThemeData;

    return SemanticColorThemeData(
      success: success ?? object.success,
      onSuccess: onSuccess ?? object.onSuccess,
      successContainer: successContainer ?? object.successContainer,
      onSuccessContainer: onSuccessContainer ?? object.onSuccessContainer,
      info: info ?? object.info,
      onInfo: onInfo ?? object.onInfo,
      infoContainer: infoContainer ?? object.infoContainer,
      onInfoContainer: onInfoContainer ?? object.onInfoContainer,
      warning: warning ?? object.warning,
      onWarning: onWarning ?? object.onWarning,
      warningContainer: warningContainer ?? object.warningContainer,
      onWarningContainer: onWarningContainer ?? object.onWarningContainer,
    );
  }

  @override
  ThemeExtension<SemanticColorThemeData> lerp(
    ThemeExtension<SemanticColorThemeData>? other,
    double t,
  ) {
    final otherValue = other;

    if (otherValue is! SemanticColorThemeData) {
      return this;
    }

    final value = this as SemanticColorThemeData;

    return SemanticColorThemeData(
      success: Color.lerp(
        value.success,
        otherValue.success,
        t,
      )!,
      onSuccess: Color.lerp(
        value.onSuccess,
        otherValue.onSuccess,
        t,
      )!,
      successContainer: Color.lerp(
        value.successContainer,
        otherValue.successContainer,
        t,
      )!,
      onSuccessContainer: Color.lerp(
        value.onSuccessContainer,
        otherValue.onSuccessContainer,
        t,
      )!,
      info: Color.lerp(
        value.info,
        otherValue.info,
        t,
      )!,
      onInfo: Color.lerp(
        value.onInfo,
        otherValue.onInfo,
        t,
      )!,
      infoContainer: Color.lerp(
        value.infoContainer,
        otherValue.infoContainer,
        t,
      )!,
      onInfoContainer: Color.lerp(
        value.onInfoContainer,
        otherValue.onInfoContainer,
        t,
      )!,
      warning: Color.lerp(
        value.warning,
        otherValue.warning,
        t,
      )!,
      onWarning: Color.lerp(
        value.onWarning,
        otherValue.onWarning,
        t,
      )!,
      warningContainer: Color.lerp(
        value.warningContainer,
        otherValue.warningContainer,
        t,
      )!,
      onWarningContainer: Color.lerp(
        value.onWarningContainer,
        otherValue.onWarningContainer,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    final value = this as SemanticColorThemeData;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SemanticColorThemeData &&
            identical(value.success, other.success) &&
            identical(value.onSuccess, other.onSuccess) &&
            identical(value.successContainer, other.successContainer) &&
            identical(value.onSuccessContainer, other.onSuccessContainer) &&
            identical(value.info, other.info) &&
            identical(value.onInfo, other.onInfo) &&
            identical(value.infoContainer, other.infoContainer) &&
            identical(value.onInfoContainer, other.onInfoContainer) &&
            identical(value.warning, other.warning) &&
            identical(value.onWarning, other.onWarning) &&
            identical(value.warningContainer, other.warningContainer) &&
            identical(value.onWarningContainer, other.onWarningContainer));
  }

  @override
  int get hashCode {
    final value = this as SemanticColorThemeData;

    return Object.hash(
      runtimeType,
      value.success,
      value.onSuccess,
      value.successContainer,
      value.onSuccessContainer,
      value.info,
      value.onInfo,
      value.infoContainer,
      value.onInfoContainer,
      value.warning,
      value.onWarning,
      value.warningContainer,
      value.onWarningContainer,
    );
  }
}

extension SemanticColorThemeDataBuildContext on BuildContext {
  SemanticColorThemeData get semanticColorThemeData =>
      Theme.of(this).extension<SemanticColorThemeData>()!;
}
