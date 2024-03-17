import 'package:jolt_copy/jolt.dart';

///
class JoltColorScheme {
  /// A convenience wrapper for ColorScheme
  /// which returns [JoltColor] instead of [Color]
  const JoltColorScheme(ColorScheme colorScheme) : _colorScheme = colorScheme;

  final ColorScheme _colorScheme;

  ///
  Brightness get brightness => _colorScheme.brightness;

  ///
  JoltColor get primary => _colorScheme.primary.as.joltColor();

  ///
  JoltColor get secondary => _colorScheme.secondary.as.joltColor();

  ///
  JoltColor get tertiary => _colorScheme.tertiary.as.joltColor();

  ///
  JoltColor get surface => _colorScheme.surface.as.joltColor();

  ///
  JoltColor get surfaceInverse => _colorScheme.surfaceInverse.as.joltColor();

  ///
  JoltColor get background => _colorScheme.background.as.joltColor();

  ///
  JoltColor get info => _colorScheme.info.as.joltColor();

  ///
  JoltColor get warning => _colorScheme.warning.as.joltColor();

  ///
  JoltColor get error => _colorScheme.error.as.joltColor();

  ///
  JoltColor get success => _colorScheme.success.as.joltColor();

  ///
  bool get isDark => brightness == Brightness.dark;

  ///
  bool get isLight => brightness == Brightness.light;
}
