import 'package:jolt/jolt.dart';
import 'package:tinycolor2/tinycolor2.dart';

/// Some theming utility methods on BuildContext
extension JoltThemeExtensions on BuildContext {
  /// Returns the current scaling data.
  ScalingData get _scaling => Scaling.of(this);

  /// Returns the current theme data.
  ThemeData get theme => Theme.of(this);

  /// Returns the current color scheme.
  ColorScheme get color => theme.colorScheme;

  /// Returns the current typography.
  Typography get textStyle => theme.typography;

  /// Returns the current dimensions.
  Dimensions get dimensions => theme.dimensions;

  /// Returns the current spacing.
  Sizing get sizing => dimensions.sizing.scaled(_scaling.spacingScale);

  /// Returns the current border radius values.
  BorderRadiusData get borderRadius => dimensions.borderRadius;

  /// Returns the current border width.
  double get borderWidth => dimensions.borderWidth;

  /// Returns the current media query data.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the current widget theme data.
  WidgetThemeData get widgetTheme => WidgetTheme.of(this);
}

/// Some theming utility methods on BuildContext
extension ThemeDataExtensions on ThemeData {
  /// Returns the current color scheme.
  ColorScheme get color => colorScheme;

  /// Returns the current typography.
  Typography get textStyle => typography;

  /// Returns the current border radius values.
  BorderRadiusData get borderRadius => dimensions.borderRadius;

  /// Returns the current border width.
  double get borderWidth => dimensions.borderWidth;
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
  JoltColor get reversed => JoltColor(
        value,
        highlight: highlight.value,
        shade50: s950.value,
        shade100: s900.value,
        shade200: s800.value,
        shade300: s700.value,
        shade400: s600.value,
        shade500: s500.value,
        shade600: s400.value,
        shade700: s300.value,
        shade800: s200.value,
        shade900: s100.value,
        shade950: s50.value,
      );

  /// Return a copy of the JoltColor which will work better as a **background**
  /// - Reassigns the primary color to be the value from **shade50**
  /// - Reassigns the highlight color to be the value from **shade900**
  JoltColor asBackground({bool highContrast = true}) => JoltColor(
        highContrast
            ? (s50.isLight ? Colors.white : Colors.black).value
            : s50.value,
        highlight: s900.value,
        shade50: s50.value,
        shade100: s100.value,
        shade200: s200.value,
        shade300: s300.value,
        shade400: s400.value,
        shade500: s500.value,
        shade600: s600.value,
        shade700: s700.value,
        shade800: s800.value,
        shade900: s900.value,
        shade950: s950.value,
      );

  /// Return a copy of the JoltColor which will work better as a **surface**
  /// - Reassigns the primary color to be the value from **shade200**
  /// - Reassigns the highlight color to be the value from **shade950**
  JoltColor asSurface({bool highContrast = true}) => JoltColor(
        highContrast ? s300.value : s200.value,
        highlight: s950.value,
        shade50: s50.value,
        shade100: s100.value,
        shade200: s200.value,
        shade300: s300.value,
        shade400: s400.value,
        shade500: s500.value,
        shade600: s600.value,
        shade700: s700.value,
        shade800: s800.value,
        shade900: s900.value,
        shade950: s950.value,
      );
}

///
extension TextStyleExtensions on TextStyle {
  ///
  TextStyle color(Color? color) => copyWith(color: color);

  ///
  TextStyle size(double? size) => copyWith(fontSize: size);
}
