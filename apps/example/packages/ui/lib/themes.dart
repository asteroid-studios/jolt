import 'package:ui/typography.dart';
import 'package:ui/ui.dart';

const _neutralColor = Colors.slate;

///
final themes = [
  Theme(
    colorScheme: ColorScheme.light(
      baseColor: _neutralColor,
    ),
    id: 'default_light',
    typography: typography,
  ),
  Theme(
    colorScheme: ColorScheme.light(
      baseColor: _neutralColor,
      highContrast: true,
    ),
    id: 'default_light_high_contrast',
    typography: typography,
  ),
  Theme(
    colorScheme: ColorScheme.dark(
      baseColor: _neutralColor,
    ),
    id: 'default_dark',
    typography: typography,
  ),
  Theme(
    colorScheme: ColorScheme.dark(
      baseColor: _neutralColor,
      highContrast: true,
    ),
    id: 'default_dark_high_contrast',
    typography: typography,
  ),
];
