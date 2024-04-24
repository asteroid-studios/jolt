import 'package:ui/ui.dart';

/// Some pre-configured colors for Jolt.
///
/// Colors are based on the [TailwindCSS](https://tailwindcss.com/docs/customizing-colors) color palette.
class Colors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Colors._();

  /// Completely Transparent.
  ///
  /// To access a ColorSwatch that is transparent, use context.color.transparent
  static const transparent = Color(0x00000000);

  /// Pure white
  static const white = Color(0xffffffff);

  /// Pure black
  static const black = Color(0xff000000);

  ///
  static TailwindColors get tailwind => TailwindColors();

  //
  static ColorScheme get _color => ThemeProvider.globalTheme.colorScheme;

  ///
  static Color get outline => _color.outline;

  ///
  static Color get surface => _color.surface;

  ///
  static Color get background => _color.background;

  ///
  static Color get primary => _color.primary;

  ///
  static Color get secondary => _color.secondary;

  ///
  static Color get tertiary => _color.tertiary;

  ///
  static Color get success => _color.success;

  ///
  static Color get warning => _color.warning;

  ///
  static Color get error => _color.error;

  ///
  static Brightness get brightness => _color.brightness;

  ///
  static bool get isDark => brightness == Brightness.dark;

  ///
  static bool get isLight => brightness == Brightness.light;
}
