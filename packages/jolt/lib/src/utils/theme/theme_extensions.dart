import 'package:jolt/jolt.dart';

/// Some theming utility methods on BuildContext
extension JoltThemeExtensions on BuildContext {
  /// Returns the current scaling data.
  ScalingData get scaling => Scaling.of(this);

  /// Returns the current theme data.
  ThemeData get theme => Theme.of(this);

  /// Returns the current color scheme.
  ColorScheme get color => theme.colorScheme;

  /// Returns the current dimensions.
  Dimensions get dimensions => theme.dimensions;

  /// Returns the current spacing.
  Sizing get sizing => dimensions.sizing.scaled(scaling.spacingScale);

  /// Returns the current border radius values.
  BorderRadiusData get borderRadius => dimensions.borderRadius;

  /// Returns the current widget theme data.
  WidgetTheme get widgetTheme => DefaultWidgetTheme.of(this);
}

/// Some theming utility methods on BuildContext
extension ThemeDataExtensions on ThemeData {
  /// Returns the current color scheme.
  ColorScheme get color => colorScheme;

  /// Returns the current border radius values.
  BorderRadiusData get borderRadius => dimensions.borderRadius;
}

/// Some utility methods on Color
extension ColorExtension on Color {
  /// Return a jolt color if this Color is a JoltColor
  JoltColor? get asJoltColor => this is JoltColor ? this as JoltColor : null;

  /// If the color is dark, make it darker, if light make lighter
  Color strengthen([int value = 10]) =>
      isDark ? darken(value) : brighten(value);

  /// If the color is dark, make it light, if light make darker
  Color weaken([int value = 10]) => isDark ? brighten(value) : darken(value);
}

/// Some utility methods on ColorScheme
extension JoltColorSchemeExtension on ColorScheme {
  /// Returns a copy of the color scheme
  /// with the brightness reversed if in dark mode.
  ColorScheme get reversible {
    if (brightness == Brightness.light) {
      return this;
    } else {
      return copyWith(
        neutral: neutral.reversed,
      );
    }
  }

  /// Returns a copy of the color scheme with high contrast.
  ColorScheme get withHighContrast {
    return copyWith(
      highContrast: true,
      background: background.asBackground(),
      surface: surface.asSurface(),
    );
  }

  /// Returns a copy of the color scheme with low contrast.
  ColorScheme get swapSurfaceWithBackground {
    return copyWith(
      background: surface,
      surface: background,
    );
  }
}
