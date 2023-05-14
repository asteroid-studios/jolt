import 'package:jolt/jolt.dart';

///
class ButtonTheme {
  ///
  const ButtonTheme({
    this.surface,
    this.color,
    this.spacing,
    this.labelStyle,
    this.smallButtonTheme,
    this.largeButtonTheme,
    this.awaitingIcon,
  });

  /// The theme of the button surface
  final SurfaceTheme? surface;

  /// The spacing between a button icon and label
  final double? spacing;

  /// The text style of the button label
  final TextStyle? labelStyle;

  /// A style for a small button
  final ButtonTheme? smallButtonTheme;

  /// A style for a large button
  final ButtonTheme? largeButtonTheme;

  /// The icon to show when the button is awaiting
  final IconData? awaitingIcon;

  /// override the foreground color of the button
  final Color Function(Color? background)? color;

  ///
  ButtonTheme copyWith({
    SurfaceTheme? surface,
    double? spacing,
    TextStyle? labelStyle,
    ButtonTheme? smallButtonTheme,
    ButtonTheme? largeButtonTheme,
    IconData? awaitingIcon,
    Color Function(Color? background)? color,
  }) {
    return ButtonTheme(
      surface: surface ?? this.surface,
      spacing: spacing ?? this.spacing,
      labelStyle: labelStyle ?? this.labelStyle,
      smallButtonTheme: smallButtonTheme ?? this.smallButtonTheme,
      largeButtonTheme: largeButtonTheme ?? this.largeButtonTheme,
      awaitingIcon: awaitingIcon ?? this.awaitingIcon,
      color: color ?? this.color,
    );
  }
}
