import 'package:jolt/jolt.dart';
export 'package:tinycolor2/tinycolor2.dart';
import 'dart:math' as math;

///
extension ColorExtension on Color {
  /// Return a copy of the color with the lightness changed
  Color withLightness(double lightness) {
    return hsl.withLightness(lightness).toColor();
  }

  /// Return a copy of the color with the saturation changed
  Color withSaturation(double saturation) {
    return hsl.withSaturation(saturation).toColor();
  }

  /// Return a copy of the color with the saturation changed
  Color withMaxSaturation(double saturation) {
    return hsl.withSaturation(math.min(saturation, hsl.saturation)).toColor();
  }

  /// If the color is dark, make it darker, if light make lighter
  Color strengthen([int value = 10]) {
    final currentLightness = hsl.lightness;
    final newLightness = currentLightness + ((isLight ? value : -value) / 100);
    return hsl.withLightness(math.max(0, math.min(1, newLightness))).toColor();
  }

  /// If the color is dark, make it light, if light make darker
  Color weaken([int value = 10]) {
    final currentLightness = hsl.lightness;
    final newLightness = currentLightness + ((isLight ? -value : value) / 100);
    return hsl.withLightness(math.max(0, math.min(1, newLightness))).toColor();
  }

  ///
  bool get isGreyScale => hsl.saturation == 1 || hsl.saturation == 0;

  ///
  bool get isMediumBrightness => brightness > 50 && brightness < 200;

  /// Return HSL color
  HSLColor get hsl {
    final hslColor = HSLColor.fromColor(this);

    if (hslColor.saturation == 1) {
      return hslColor.withSaturation(0);
    }

    return hslColor;
  }
}
