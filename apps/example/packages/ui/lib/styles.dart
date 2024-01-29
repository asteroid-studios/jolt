// TODO button styles

import 'package:jolt/jolt.dart';

ButtonStyle buttonStyle(BuildContext context) {
  return ButtonStyle(
    // textStyle: context.style.body,
    surfaceStyle: SurfaceStyle(
      borderRadius: context.borderRadius.xl,
      padding: EdgeInsets.symmetric(
        vertical: context.spacing.xs,
        horizontal: context.spacing.md,
      ),
    ),
  );
}

ButtonStyle outlineButton(BuildContext context) {
  return ButtonStyle(
    surfaceStyle: SurfaceStyle(
      color: SurfaceColor.of(context).as.joltColor().copyWith(
        colorResolvers: JoltColorResolvers(
          border: (color, context) {
            return SurfaceColor.of(context)
                .as
                .foreground(context)
                .withOpacity(0.7);
          },
        ),
      ),
    ),
  );
}
