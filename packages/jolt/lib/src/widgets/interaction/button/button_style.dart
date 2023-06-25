// ignore_for_file: avoid_positional_boolean_parameters

import 'package:jolt/jolt.dart';

///
class ButtonStyle {
  ///
  const ButtonStyle({
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
  ButtonStyle copyWith({
    SurfaceStyle? surfaceStyle,
    double? spacing,
    TextStyle? labelStyle,
  }) {
    return ButtonStyle(
      surfaceStyle: surfaceStyle ?? this.surfaceStyle,
      spacing: spacing ?? this.spacing,
      labelStyle: labelStyle ?? this.labelStyle,
    );
  }
}
