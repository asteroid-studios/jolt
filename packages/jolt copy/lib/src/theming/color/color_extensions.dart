import 'package:jolt_copy/jolt.dart';

///
extension ColorContextX on BuildContext {
  /// Returns the current color scheme.
  JoltColorScheme get color => JoltColorScheme(theme.colorScheme);
}

/// Some utility methods on Color
extension ColorX on Color {
  /// If the color is dark, make it darker, if light make lighter
  Color strengthen([int value = 10]) =>
      isDark ? darken(value) : brighten(value);

  /// If the color is dark, make it light, if light make darker
  Color weaken([int value = 10]) => isDark ? brighten(value) : darken(value);

  /// Return HSL color
  HSLColor get _asHSLColor {
    final hsl = HSLColor.fromColor(this);

    if (this != Colors.black && this != Colors.white) return hsl;

    return hsl.withSaturation(0);
  }

  /// The lightness value of the color, from HSL
  double get saturation => _asHSLColor.saturation;

  /// The lightness value of the color, from HSL
  double get lightness => _asHSLColor.lightness;

  /// Return a copy of the color with the lightness changed
  Color withLightness(double lightness) =>
      _asHSLColor.withLightness(lightness).toColor();

  ///
  JoltColorAs get as => JoltColorAs(color: this);
}

///
extension ColorBorderX on Border {
  ///
  Border copyWithColor(Color? color) {
    return Border(
      top: top.copyWith(color: color),
      bottom: bottom.copyWith(color: color),
      left: left.copyWith(color: color),
      right: right.copyWith(color: color),
    );
  }
}
