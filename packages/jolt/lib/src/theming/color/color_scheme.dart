import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolt/jolt.dart';
export 'dart:ui' show Brightness;

part 'color_scheme.freezed.dart';

///
@freezed
class ColorScheme with _$ColorScheme {
  ///
  const factory ColorScheme({
    ///
    required Brightness brightness,

    ///
    required Color primary,

    ///
    required Color secondary,

    ///
    required Color tertiary,

    ///
    required Color surface,

    ///
    required Color surfaceInverse,

    ///
    required Color background,

    ///
    @Default(false) bool highContrast,

    ///
    @Default(Colors.sky) Color info,

    ///
    @Default(Colors.amber) Color warning,

    ///
    @Default(Colors.red) Color error,

    ///
    @Default(Colors.emerald) Color success,
  }) = _ColorScheme;

  const ColorScheme._();

  ///
  factory ColorScheme.light({
    Color? baseColor,
    Color primary = Colors.violet,
    Color? secondary,
    Color? tertiary,
    bool highContrast = false,
    bool inverse = false,
  }) {
    final base = baseColor?.as.joltColor() ?? Colors.slate;
    final background = highContrast ? Colors.white : base.s50;
    final surface = base.s200;
    return ColorScheme(
      brightness: Brightness.light,
      highContrast: highContrast,
      primary: primary,
      secondary: secondary ?? Colors.rose,
      tertiary: tertiary ?? primary.as.joltColor().s200,
      background: inverse ? surface : background,
      surface: inverse ? background : surface,
      surfaceInverse: highContrast ? Colors.black : base.s900,
    );
  }

  ///
  factory ColorScheme.dark({
    Color? baseColor,
    Color primary = Colors.violet,
    Color? secondary,
    Color? tertiary,
    bool highContrast = false,
    bool inverse = false,
  }) {
    final base = baseColor?.as.joltColor() ?? Colors.slate;
    final background = highContrast ? Colors.black : base.s950;
    final surface = base.s800;
    return ColorScheme(
      brightness: Brightness.dark,
      highContrast: highContrast,
      primary: primary,
      secondary: secondary ?? Colors.rose,
      tertiary: tertiary ?? primary.as.joltColor().s800,
      background: inverse ? surface : background,
      surface: inverse ? background : surface,
      surfaceInverse: highContrast ? Colors.white : base.s100,
    );
  }

  ///
  bool get isDark => brightness == Brightness.dark;

  ///
  bool get isLight => brightness == Brightness.light;
}
