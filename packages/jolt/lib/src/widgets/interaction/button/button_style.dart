import 'package:jolt/jolt.dart';

///
class ButtonStyle {
  ///
  const ButtonStyle({
    this.surfaceStyle,
    this.color,
    this.spacing,
    this.labelStyle,
  });

  /// The theme of the button surface
  final SurfaceStyle? surfaceStyle;

  /// The spacing between a button icon and label
  final double? spacing;

  /// The text style of the button label
  final TextStyle? labelStyle;

  /// override the foreground color of the button
  final Color Function(Color? background)? color;

  ///
  ButtonStyle copyWith({
    SurfaceStyle? surfaceStyle,
    double? spacing,
    TextStyle? labelStyle,
    Color Function(Color? background)? color,
  }) {
    return ButtonStyle(
      surfaceStyle: surfaceStyle ?? this.surfaceStyle,
      spacing: spacing ?? this.spacing,
      labelStyle: labelStyle ?? this.labelStyle,
      color: color ?? this.color,
    );
  }
}
