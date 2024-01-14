// TODO button styles

import 'package:jolt/jolt.dart';

ButtonStyle buttonStyle(BuildContext context) {
  return ButtonStyle(
    labelStyle: context.style.body,
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
      background: context.color.transparent,
      borderRadius: context.borderRadius.xl,
      padding: EdgeInsets.symmetric(
        vertical: context.spacing.xs,
        horizontal: context.spacing.md,
      ),
    ),
  );
}
