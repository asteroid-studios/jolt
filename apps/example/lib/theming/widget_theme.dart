import 'package:jolt/jolt.dart';

/// Return my widget theme
WidgetThemeData widgetTheme(
  ThemeData theme,
) {
  return WidgetThemeData(
    surface: SurfaceTheme(
      horizontalPadding: theme.dimensions.sizing.md,
      verticalPadding: theme.dimensions.sizing.xs,
      borderRadius: theme.borderRadius.md,
    ),
  );
}
