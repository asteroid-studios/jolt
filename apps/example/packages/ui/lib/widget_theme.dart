import 'package:ui/ui.dart';

/// Return my widget theme
WidgetTheme widgetTheme(BuildContext context) {
  // final color = context.color;
  // final spacing = context.spacing;
  return WidgetTheme(
    surfaceStyle: SurfaceStyle(
      // borderRadius: theme.borderRadius.lg,
      padding: EdgeInsets.all(context.spacing.lg),
      borderWidth: 0,
    ),
    buttonStyle: ButtonStyle(
      surfaceStyle: SurfaceStyle(
        padding: EdgeInsets.all(context.spacing.zero),
        borderWidth: 2,
      ),
    ),
    // // TODO popover theme, would be good to make it more contrasting by default
    // // TODO ie darkest background on dark and lightest on light
    // progressIndicator: ProgressIndicatorTheme(
    //   // icon: IconsDuotone.speakerHifi,
    //   // icon: IconsDuotone.spinnerGap,
    //   circularIndicatorSize: sizing.xxxl,
    // ),
    // button: ButtonTheme(
    //   labelStyle: theme.typography.button,
    //   surfaceStyle: SurfaceStyle(
    //     // horizontalPadding: sizing.md,
    //     // verticalPadding: sizing.xs,
    //     // borderRadius: theme.borderRadius.md,
    //     borderColor: (background) {
    //       if (background.opacity == 0) {
    //         return color.surface;
    //       } else if (background.opacity < 0.5) {
    //         return background.withOpacity(1);
    //       }
    //       return background;
    //     },
    //   ),
    //   color: (background) {
    //     if (background is JoltColor) {
    //       if (background.opacity < 0.5) {
    //         return (color.isDark ? background.s300 : background.s800)
    //             .withOpacity(1);
    //       }
    //       return background.foreground;
    //     }
    //     return color.surface.foreground;
    //   },
    // ),
  );
}
