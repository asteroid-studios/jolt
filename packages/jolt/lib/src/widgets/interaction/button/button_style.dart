// ignore_for_file: avoid_positional_boolean_parameters

import 'package:jolt/jolt.dart';

///
class ButtonStyleOld {
  ///
  const ButtonStyleOld({
    this.surfaceStyle,
    this.spacing,
    this.labelStyle,
  });

  /// The theme of the button surface
  final SurfaceStyle? surfaceStyle;

  /// The spacing between a button icon and label
  final double? spacing;

  /// The text style of the button label
  final TextStyle? labelStyle;

  ///
  ButtonStyleOld copyWith({
    SurfaceStyle? surfaceStyle,
    double? spacing,
    TextStyle? labelStyle,
  }) {
    return ButtonStyleOld(
      surfaceStyle: surfaceStyle ?? this.surfaceStyle,
      spacing: spacing ?? this.spacing,
      labelStyle: labelStyle ?? this.labelStyle,
    );
  }
}
