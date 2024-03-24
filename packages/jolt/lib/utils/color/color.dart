import 'package:jolt/jolt.dart';
export 'package:tinycolor2/tinycolor2.dart';
import 'dart:math' as math;

///
class JoltColor {
  /// private constructor
  JoltColor._();

  /// the one and only instance of this singleton
  static final instance = JoltColor._();

  /// The shades used to convert a color into a swatch
  ///
  /// You can overwrite this value using
  ///
  /// `Jolt.color.shades = JoltColorShades()`
  ///
  /// If you want more exact control over the shades of a color,
  /// instead use a ColorSwatch()
  JoltColorShades shades = const JoltColorShades();

  /// The default function to determine the active color
  Color Function(Color color) active = (color) {
    if (color.value == _pureWhite.value || color.value == _pureBlack.value) {
      return color.weaken();
    } else {
      return color.strengthen();
    }
  };

  /// The default function to determine the foreground color
  Color Function(Color color) foreground = (color) {
    return color.isLight ? color.shade900 : color.shade100;
  };

  /// The default function to determine the foregroundLight color
  Color Function(Color color) foregroundLight = (color) {
    return (color.isMediumBrightness
            ? color.isLight
                ? color.shade700
                : color.shade300
            : color.shade500)
        .withMaxSaturation(0.3);
  };
}

/// A color that has a small table of related colors called a "swatch"
class ColorSwatch extends Color {
  ///
  const ColorSwatch(
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

  /// The second darkest shade.
  final Color shade900;

  /// The darkest shade.
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
extension ColorExtension on Color {
  ///
  ColorAs get as => ColorAs(value);

  bool get _greyscale => as.hsl.saturation == 1 || as.hsl.saturation == 0;

  JoltColorShades get _shades =>
      _greyscale ? JoltColorShades.wide() : Jolt.color.shades;

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

  /// Return a copy of the color with the saturation changed
  Color withSaturation(double saturation) {
    return as.hsl.withSaturation(saturation).toColor();
  }

  /// Return a copy of the color with the saturation changed
  Color withMaxSaturation(double saturation) {
    final hslColor = as.hsl;
    return hslColor
        .withSaturation(math.min(saturation, hslColor.saturation))
        .toColor();
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

  ///
  bool get isMediumBrightness => brightness > 50 && brightness < 200;
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
  Color get active => Jolt.color.active(this);

  ///
  Color get foreground => Jolt.color.foreground(this);

  ///
  Color get foregroundLight => Jolt.color.foregroundLight(this);
}

const _pureWhite = Color(0xFFFFFFFF);
const _pureBlack = Color(0xFF000000);
