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
  static Color get barrier => _color.barrier;

  ///
  static Brightness get brightness => _color.brightness;

  ///
  static bool get isDark => brightness == Brightness.dark;

  ///
  static bool get isLight => brightness == Brightness.light;
}

///
extension ColorX on Color {
  ///
  Color dark(Color color) {
    return Colors.isDark ? color : this;
  }

  ///
  Color get foreground {
    if (opacity < 0.5) {
      return Colors.background.foreground;
    }
    return (isLight ? shade900 : shade50).withOpacity(1);
  }

  ///
  Color get foregroundLight => (isMediumBrightness
          ? isLight
              ? shade700
              : shade300
          : shade500)
      .withMaxSaturation(0.3)
      .withOpacity(1);

  ///
  Color get active {
    // TODO this not great
    if (value == Colors.white.value || value == Colors.black.value) {
      return weaken();
    } else {
      return strengthen();
    }
  }
}

///
extension ColorWidgetX on Widget {
  ///
  Widget get foreground => Builder(
        builder: (context) {
          // TODO Fix up and use inherited surface color
          final surfaceColor = Colors.surface;
          return DefaultSymbolStyle(
            style: TextStyle(color: surfaceColor.foreground),
            child: this,
          );
        },
      );

  ///
  Widget get foregroundLight => Builder(
        builder: (context) {
          // TODO Fix up and use inherited surface color
          final surfaceColor = Colors.surface;
          return DefaultSymbolStyle(
            style: TextStyle(color: surfaceColor.foregroundLight),
            child: this,
          );
        },
      );
}
