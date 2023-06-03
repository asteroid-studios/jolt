import 'package:jolt/jolt.dart';

/// Some theming utility methods on BuildContext
extension JoltThemeExtensions on BuildContext {
  /// Returns the current scaling data.
  ScalingData get scaling => Scaling.of(this);

  /// Returns the current theme data.
  ThemeData get theme => Theme.of(this);

  /// Returns the current color scheme.
  ColorScheme get color => theme.colorScheme;

  /// Returns the current typography.
  Typography get style => theme.typography;

  /// Returns the current dimensions.
  Dimensions get dimensions => theme.dimensions;

  /// Returns the current spacing.
  Sizing get sizing => dimensions.sizing.scaled(scaling.spacingScale);

  /// Returns the current border radius values.
  BorderRadiusData get borderRadius => dimensions.borderRadius;

  /// Returns the current media query data.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the current widget theme data.
  WidgetThemeData get widgetTheme => WidgetTheme.of(this);

  /// The closest surface in the current context
  InheritedSurface? get inheritedSurface => InheritedSurface.of(this);
}

/// Some theming utility methods on BuildContext
extension ThemeDataExtensions on ThemeData {
  /// Returns the current color scheme.
  ColorScheme get color => colorScheme;

  /// Returns the current typography.
  Typography get style => typography;

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

/// Some utility methods on JoltColor
extension JoltColorExtension on JoltColor {
  /// Returns a copy of the JoltColor with the shades in reverse order
  /// For example:
  /// - s50 would return the old value for s950
  /// - s950 would return the old value for s50
  JoltColor get reversed => copyWith(
        shade50: s950,
        shade100: s900,
        shade200: s800,
        shade300: s700,
        shade400: s600,
        shade500: s500,
        shade600: s400,
        shade700: s300,
        shade800: s200,
        shade900: s100,
        shade950: s50,
      );

  /// Return a copy of the JoltColor which will work better as a **background**
  JoltColor asBackground({bool highContrast = true}) {
    // If high contrast background, use pure black or white
    var primary = s50;
    if (highContrast) {
      primary = s50.isLight ? Colors.white : Colors.black;
    }
    return copyWith(
      primary: primary.value,
      onTop: s900,
      onHover: s200,
      onFocus: s200,
    );
  }

  /// Return a copy of the JoltColor which will work better as a **surface**
  JoltColor asSurface({bool highContrast = true}) {
    return copyWith(
      primary: highContrast ? s300.value : s200.value,
      onTop: s950,
      onHover: highContrast ? s200 : s300,
      onFocus: highContrast ? s200 : s300,
    );
  }
}

///
extension TextStyleExtensions on TextStyle {
  ///
  TextStyle withColor([Color? color]) => copyWith(color: color);

  ///
  TextStyle withSize([double? size]) => copyWith(fontSize: size);
}

/// Available font variation axis
class FontVariationAxis {
  /// The font variation axis for the font weight
  static const weight = 'wght';
}
