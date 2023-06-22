import 'package:jolt/jolt.dart';

///
extension SurfaceWidgetX on Widget {
  /// Make all surfaces in the widget tree have a transparent background.
  Widget surfaceTransparent() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.transparent,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of background.
  Widget surfaceBackground() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.background,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of surface.
  Widget surfaceSurface() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.surface,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of primary.
  Widget surfacePrimary() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.primary,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of secondary.
  Widget surfaceSecondary() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.secondary,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of tertiary.
  Widget surfaceTertiary() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.tertiary,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of success.
  Widget surfaceSuccess() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.success,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of warning.
  Widget surfaceWarning() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.warning,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of error.
  Widget surfaceError() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.error,
        ),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of info.
  Widget surfaceInfo() => DefaultSurfaceStyle.merge(
        style: (context) => SurfaceStyle(
          background: context.color.info,
        ),
        child: this,
      );
}
