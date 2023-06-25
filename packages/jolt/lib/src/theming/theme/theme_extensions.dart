import 'package:jolt/jolt.dart';

///
extension ThemeContextX on BuildContext {
  /// Returns the current theme data.
  Theme get theme => Theme.of(this);
}

/// Some theming utility methods on BuildContext
extension ThemeX on Theme {
  /// Returns the current color scheme.
  ColorScheme get color => colorScheme;

  /// Returns the current border radius values.
  BorderRadii get borderRadius => dimensions.borderRadius;

  /// Returns the current spacing.
  Spacing get spacing => dimensions.spacing;
}
