import 'package:jolt/jolt.dart';

///
class ButtonTheme {
  ///
  const ButtonTheme({
    this.surfaceStyle,
    this.color,
    this.spacing,
    this.labelStyle,
    this.smallButtonTheme,
    this.largeButtonTheme,
  });

  /// The theme of the button surface
  final SurfaceStyle? surfaceStyle;

  /// The spacing between a button icon and label
  final double? spacing;

  /// The text style of the button label
  final TextStyle? labelStyle;

  /// A style for a small button
  final ButtonTheme? smallButtonTheme;

  /// A style for a large button
  final ButtonTheme? largeButtonTheme;

  /// override the foreground color of the button
  final Color Function(Color? background)? color;

  ///
  ButtonTheme copyWith({
    SurfaceStyle? surfaceStyle,
    double? spacing,
    TextStyle? labelStyle,
    ButtonTheme? smallButtonTheme,
    ButtonTheme? largeButtonTheme,
    Color Function(Color? background)? color,
  }) {
    return ButtonTheme(
      surfaceStyle: surfaceStyle ?? this.surfaceStyle,
      spacing: spacing ?? this.spacing,
      labelStyle: labelStyle ?? this.labelStyle,
      smallButtonTheme: smallButtonTheme ?? this.smallButtonTheme,
      largeButtonTheme: largeButtonTheme ?? this.largeButtonTheme,
      color: color ?? this.color,
    );
  }
}
