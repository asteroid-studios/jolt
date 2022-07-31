import 'package:flutter/material.dart';

@immutable
class SemanticColors extends ThemeExtension<SemanticColors> {
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;

  const SemanticColors({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
  });

  @override
  SemanticColors copyWith({
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
    return SemanticColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
    );
  }

  // Controls how the properties change on theme changes
  @override
  SemanticColors lerp(ThemeExtension<SemanticColors>? other, double t) {
    if (other is! SemanticColors) {
      return this;
    }
    return SemanticColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer:
          Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      warningContainer:
          Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarningContainer:
          Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'SemanticColors('
      'success: $success, onSuccess: $onSuccess, successContainer: $successContainer, onSuccessContainer: $onSuccessContainer'
      'info: $info, onInfo: $onInfo, infoContainer: $infoContainer, onInfoContainer: $onInfoContainer'
      'warning: $warning, onWarning: $onWarning, warningContainer: $warningContainer, onWarningContainer: $onWarningContainer'
      ')';

  // the dark theme
  static const darkDefaults = SemanticColors(
    success: Color(0xffA0CFB0),
    onSuccess: Color(0xff15281B),
    successContainer: Color(0xFF4B9564),
    onSuccessContainer: Color(0xffC9E3D1),
    info: Color(0xffC4EAF8),
    onInfo: Color(0xff093044),
    infoContainer: Color(0xff33B5E5),
    onInfoContainer: Color(0xffEDF9FD),
    warning: Color(0xffFFC670),
    onWarning: Color(0xff211C13),
    warningContainer: Color(0xffEE8F00),
    onWarningContainer: Color(0xffFFDEAD),
  );
  // the light theme
  static const lightDefaults = SemanticColors(
    success: Color(0xff4B9564),
    onSuccess: Color(0xffC9E3D1),
    successContainer: Color(0xFFA0CFB0),
    onSuccessContainer: Color(0xff15281B),
    info: Color(0xff33b5e5),
    onInfo: Color(0xffEDF9FD),
    infoContainer: Color(0xffC4EAF8),
    onInfoContainer: Color(0xff093044),
    warning: Color(0xffEE8F00),
    onWarning: Color(0xffFFDEAD),
    warningContainer: Color(0xffFFC670),
    onWarningContainer: Color(0xff211C13),
  );
}
