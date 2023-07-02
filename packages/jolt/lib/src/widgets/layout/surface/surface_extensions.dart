import 'package:jolt/jolt.dart';

///
extension SurfaceWidgetX on Widget {
  /// Make all surfaces in the widget tree have a set background.
  Widget withBackground(JoltColor background) => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: background,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a transparent background.
  Widget withBackgroundTransparent() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.transparent,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of background.
  Widget withBackgroundBackground() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.background,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of surface.
  Widget withBackgroundSurface() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.surface,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of primary.
  Widget withBackgroundPrimary() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.primary,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of secondary.
  Widget withBackgroundSecondary() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.secondary,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of tertiary.
  Widget withBackgroundTertiary() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.tertiary,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of success.
  Widget withBackgroundSuccess() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.success,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of warning.
  Widget withBackgroundWarning() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.warning,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of error.
  Widget withBackgroundError() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.error,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of info.
  Widget withBackgroundInfo() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.info,
        ),
        child: this,
      );
}
