import 'package:jolt/jolt.dart';

///
extension SurfaceWidgetX on Widget {
  /// Make all surfaces in the widget tree have a transparent background.
  Widget backgroundTransparent() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.transparent,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of background.
  Widget backgroundBackground() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.background,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of surface.
  Widget backgroundSurface() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.surface,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of primary.
  Widget backgroundPrimary() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.primary,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of secondary.
  Widget backgroundSecondary() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.secondary,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of tertiary.
  Widget backgroundTertiary() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.tertiary,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of success.
  Widget backgroundSuccess() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.success,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of warning.
  Widget backgroundWarning() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.warning,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of error.
  Widget backgroundError() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.error,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of info.
  Widget backgroundInfo() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.info,
        ),
        child: this,
      );
}
