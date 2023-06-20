import 'package:ui/ui.dart';

/// Return my widget theme
WidgetThemeData widgetTheme(
  ThemeData theme,
  ScalingData scaling,
) {
  final color = theme.color;
  final sizing = theme.dimensions.sizing.scaled(scaling.spacingScale);
  return WidgetThemeData(
    surface: SurfaceTheme(
        // horizontalPadding: sizing.md,
        // verticalPadding: sizing.md,
        // borderRadius: theme.borderRadius.lg,
        ),
    // TODO popover theme, would be good to make it more contrasting by default
    // TODO ie darkest background on dark and lightest on light
    progressIndicator: ProgressIndicatorTheme(
      // icon: IconsDuotone.speakerHifi,
      // icon: IconsDuotone.spinnerGap,
      circularIndicatorSize: sizing.xxxl,
    ),
    button: ButtonTheme(
      labelStyle: theme.typography.button,
      surface: SurfaceTheme(
        // horizontalPadding: sizing.md,
        // verticalPadding: sizing.xs,
        // borderRadius: theme.borderRadius.md,
        borderColor: (background) {
          if (background.opacity == 0) {
            return color.surface;
          } else if (background.opacity < 0.5) {
            return background.withOpacity(1);
          }
          return background;
        },
      ),
      color: (background) {
        if (background is JoltColor) {
          if (background.opacity < 0.5) {
            return (color.isDark ? background.s300 : background.s800)
                .withOpacity(1);
          }
          return background.foreground;
        }
        return color.surface.foreground;
      },
    ),
  );
}
