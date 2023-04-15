import 'package:jolt/jolt.dart';

/// Return my widget theme
WidgetThemeData widgetTheme(
  ThemeData theme,
) {
  return WidgetThemeData(
    surface: SurfaceTheme(
      borderRadius: theme.dimensions.borderRadius.l,
    ),
  );
}
