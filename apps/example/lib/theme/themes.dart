import 'package:jolt/jolt.dart';

const _neutralColor = Colors.slate;

final _colorSchemeLight = ColorScheme.light(neutral: _neutralColor);

final _colorSchemeDark = ColorScheme.dark(neutral: _neutralColor);

final _typography = Typography();

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
    typography: _typography,
  ),
  ThemeData(
    colorScheme: _colorSchemeLight.copyWith(primary: Colors.violet),
    id: 'default_light_violet',
    typography: _typography,
  ),
  ThemeData(
    colorScheme: _colorSchemeDark,
    id: 'default_dark',
    typography: _typography,
  ),
  ThemeData(
    colorScheme: _colorSchemeDark.withHighContrast,
    id: 'default_dark_high_contrast',
    typography: _typography,
  ),
  ThemeData(
    colorScheme: _colorSchemeDark.copyWith(primary: Colors.violet),
    id: 'default_dark_violet',
    typography: _typography,
  ),
  ThemeData(
    colorScheme:
        _colorSchemeDark.withHighContrast.copyWith(primary: Colors.violet),
    id: 'default_dark_violet_high_contrast',
    typography: _typography,
  ),
];
