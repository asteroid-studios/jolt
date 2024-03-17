import 'package:jolt/jolt.dart';
import 'package:tinycolor2/tinycolor2.dart';
import 'dart:math' as math;

/// A color that has a small table of related colors called a "swatch"
class JoltColor extends Color {
  ///
  const JoltColor(
    super.value, {
    required this.name,
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
    required this.shade950,
  });

  /// The lightest shade.
  final Color shade50;

  /// The second lightest shade.
  final Color shade100;

  /// The third lightest shade.
  final Color shade200;

  /// The fourth lightest shade.
  final Color shade300;

  /// The fifth lightest shade.
  final Color shade400;

  /// The middle shade
  final Color shade500;

  /// The fifth darkest shade.
  final Color shade600;

  /// The fourth darkest shade.
  final Color shade700;

  /// The third darkest shade.
  final Color shade800;

  ///
  final Color shade900;

  ///
  final Color shade950;

  ///
  final String name;

  ///
  List<Color> get shades => [
        shade50,
        shade100,
        shade200,
        shade300,
        shade400,
        shade500,
        shade600,
        shade700,
        shade800,
        shade900,
        shade950,
      ];
}

///
extension ColorX on Color {
  ///
  ColorAs get as => ColorAs(value);

  bool get _isPureBlack => as.hsl.saturation == 1;

  bool get _isPureWhite => as.hsl.saturation == 0;

  bool get _isPureBlackOrWhite => _isPureBlack || _isPureWhite;

  JoltColorShades get _shades =>
      _isPureBlackOrWhite ? JoltColorShades.wide() : Jolt.colorShades;

  ///
  Color get shade50 => withLightness(_shades.shade50);

  ///
  Color get shade100 => withLightness(_shades.shade100);

  ///
  Color get shade200 => withLightness(_shades.shade200);

  ///
  Color get shade300 => withLightness(_shades.shade300);

  ///
  Color get shade400 => withLightness(_shades.shade400);

  ///
  Color get shade500 => withLightness(_shades.shade500);

  ///
  Color get shade600 => withLightness(_shades.shade600);

  ///
  Color get shade700 => withLightness(_shades.shade700);

  ///
  Color get shade800 => withLightness(_shades.shade800);

  ///
  Color get shade900 => withLightness(_shades.shade900);

  ///
  Color get shade950 => withLightness(_shades.shade950);

  ///
  List<Color> get shades => [
        shade50,
        shade100,
        shade200,
        shade300,
        shade400,
        shade500,
        shade600,
        shade700,
        shade800,
        shade900,
        shade950,
      ];

  /// Return a copy of the color with the lightness changed
  Color withLightness(double lightness) {
    return as.hsl.withLightness(lightness).toColor();
  }

  /// If the color is dark, make it darker, if light make lighter
  Color strengthen([int value = 10]) {
    final hslColor = as.hsl;
    final currentLightness = hslColor.lightness;
    final newLightness = currentLightness + ((isLight ? value : -value) / 100);
    return hslColor
        .withLightness(math.max(0, math.min(1, newLightness)))
        .toColor();
  }

  /// If the color is dark, make it light, if light make darker
  Color weaken([int value = 10]) {
    final hslColor = as.hsl;
    final currentLightness = hslColor.lightness;
    final newLightness = currentLightness + ((isLight ? -value : value) / 100);
    return hslColor
        .withLightness(math.max(0, math.min(1, newLightness)))
        .toColor();
  }
}

///
class ColorAs extends Color {
  ///
  const ColorAs(super.value);

  /// Return HSL color
  HSLColor get hsl {
    final hslColor = HSLColor.fromColor(this);

    if (hslColor.saturation == 1) {
      return hslColor.withSaturation(0);
    }

    return hslColor;
  }

  ///
  Color get foreground {
    return isLight ? shade900 : shade100;
  }

  ///
  Color get foregroundLight {
    return isLight ? shade600 : shade400;
  }
}

const _pureBlack = Color(0xff000000);
const _pureWhite = Color(0xffffffff);
