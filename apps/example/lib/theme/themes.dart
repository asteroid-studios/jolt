import 'package:jolt/jolt.dart';

import 'package:example/theme/typography.dart';

const _neutralColor = Colors.slate;

final _colorSchemeLight = ColorScheme.light(
  neutral: _neutralColor,
).swapSurfaceWithBackground;

final _colorSchemeLightHighContrast =
    _colorSchemeLight.withHighContrast.swapSurfaceWithBackground;

final _colorSchemeDark = ColorScheme.dark(
  neutral: _neutralColor,
);

// final _buttonData = ButtonData(
//   defaultStyle = _typography.body,
// );
// final _widgetsData = WidgetsData(
//   button: _buttonData;
// );
///
final themes = [
  ThemeData(
    colorScheme: _colorSchemeLight,
    id: 'default_light',
    typography: typographyLight,
  ),
  ThemeData(
    colorScheme: _colorSchemeLightHighContrast,
    id: 'default_light_high_contrast',
    typography: typographyLight,
  ),
  ThemeData(
    colorScheme: _colorSchemeLight.copyWith(primary: Colors.violet),
    id: 'default_light_violet',
    typography: typographyLight,
  ),
  ThemeData(
    colorScheme: _colorSchemeLightHighContrast.copyWith(primary: Colors.violet),
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
    colorScheme: _colorSchemeDark.copyWith(primary: Colors.violet),
    id: 'default_dark_violet',
    typography: typographyDark,
  ),
  ThemeData(
    colorScheme:
        _colorSchemeDark.withHighContrast.copyWith(primary: Colors.violet),
    id: 'default_dark_violet_high_contrast',
    typography: typographyDark,
  ),
];
