import 'package:ui/typography.dart';
import 'package:ui/ui.dart';

const _neutralColor = Colors.slate;
final _colorSchemeLight = ColorScheme.light(
  neutral: _neutralColor,
  primary: Colors.violet,
  secondary: Colors.emerald,
).swapSurfaceWithBackground;
final _colorSchemeDark = ColorScheme.dark(neutral: _neutralColor);

final themes = [
  ThemeData(
    colorScheme: _colorSchemeLight,
    id: 'default_light',
    typography: typographyLight,
  ),
  ThemeData(
    colorScheme: _colorSchemeLight.withHighContrast.swapSurfaceWithBackground,
    id: 'default_light_high_contrast',
    typography: typographyLight,
  ),
  ThemeData(
    colorScheme: _colorSchemeLight.copyWith(
      primary: Colors.violet,
      secondary: Colors.emerald,
    ),
    id: 'default_light_violet',
    typography: typographyLight,
  ),
  ThemeData(
    colorScheme:
        _colorSchemeLight.withHighContrast.swapSurfaceWithBackground.copyWith(
      primary: Colors.violet,
      secondary: Colors.emerald,
    ),
    id: 'default_light_violet_high_contrast',
    typography: typographyLight,
  ),
  ThemeData(
    colorScheme: _colorSchemeDark,
    id: 'default_dark',
    typography: typographyDark,
  ),
  ThemeData(
    colorScheme: _colorSchemeDark.withHighContrast,
    id: 'default_dark_high_contrast',
    typography: typographyDark,
  ),
  ThemeData(
    colorScheme: _colorSchemeDark.copyWith(
      primary: Colors.violet,
      secondary: Colors.emerald,
    ),
    id: 'default_dark_violet',
    typography: typographyDark,
  ),
  ThemeData(
    colorScheme: _colorSchemeDark.withHighContrast.copyWith(
      primary: Colors.violet,
      secondary: Colors.emerald,
    ),
    id: 'default_dark_violet_high_contrast',
    typography: typographyDark,
  ),
];
