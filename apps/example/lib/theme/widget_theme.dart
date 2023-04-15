import 'package:jolt/jolt.dart';

/// Return my widget theme
WidgetTheme widgetTheme(
  ThemeData theme,
  // TODO maybe should pass separate dimensions
  // Dimensions dimensions,
) {
  return WidgetTheme(
    surface: SurfaceTheme(
      borderRadius: theme.dimensions.borderRadius.l,
    ),
  );
}
