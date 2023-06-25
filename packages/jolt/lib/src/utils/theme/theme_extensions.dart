import 'package:jolt/jolt.dart';

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
