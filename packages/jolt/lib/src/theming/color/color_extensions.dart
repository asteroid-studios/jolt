import 'package:jolt/jolt.dart';

///
extension ColorContextX on BuildContext {
  /// Returns the current color scheme.
  ColorScheme get color => theme.colorScheme;
}

/// Some utility methods on Color
extension ColorX on Color {
  /// Return a jolt color if this Color is a JoltColor
  JoltColor? get maybeAsJoltColor =>
      this is JoltColor ? this as JoltColor : null;

  /// If the color is dark, make it darker, if light make lighter
  Color strengthen([int value = 10]) =>
      isDark ? darken(value) : brighten(value);

  /// If the color is dark, make it light, if light make darker
  Color weaken([int value = 10]) => isDark ? brighten(value) : darken(value);
}

/// Some utility methods on JoltColor
extension JoltColorX on JoltColor {
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
      primary: primary,
      foreground: s900,
      onHovered: s200,
      onFocused: s200,
    );
  }

  /// Return a copy of the JoltColor which will work better as a **surface**
  JoltColor asSurface({bool highContrast = true}) {
    return copyWith(
      primary: highContrast ? s300 : s200,
      foreground: s950,
      onHovered: highContrast ? s200 : s300,
      onFocused: highContrast ? s200 : s300,
    );
  }
}
