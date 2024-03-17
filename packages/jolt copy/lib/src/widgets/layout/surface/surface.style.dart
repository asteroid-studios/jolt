import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolt_copy/jolt.dart';

part 'surface.style.freezed.dart';

///
@freezed
class SurfaceStyle with _$SurfaceStyle implements Style<SurfaceStyle> {
  /// Defines the style of a [Surface] widget
  const factory SurfaceStyle({
    /// The width of the surface
    double? width,

    /// The height of the surface
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? color,
    Color? borderColor,
    DecorationImage? image,
    Border? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape? shape,
    Duration? animationDuration,

    /// Whether the surface should have a splash effect, defaults to false
    bool? splash,

    /// Whether to force the padding to equal the vertical padding on all sides
    ///
    /// Used to make sure square buttons are square.
    bool? forcePaddingEqualToVertical,

    /// Whether the surface should resolve the background color
    /// defaults to true
    ///
    /// For example you might want a transparent surface with no hover effect.
    bool? resolveBackgroundColor,
  }) = _SurfaceStyle;

  const SurfaceStyle._();

  @override
  SurfaceStyle merge(SurfaceStyle? style) {
    return copyWith(
      padding: style?.padding ?? padding,
      margin: style?.margin ?? margin,
      width: style?.width ?? width,
      height: style?.height ?? height,
      constraints: style?.constraints ?? constraints,
      clipBehavior: style?.clipBehavior ?? clipBehavior,
      color: style?.color ?? color,
      borderColor: style?.borderColor ?? borderColor,
      image: style?.image ?? image,
      border: style?.border ?? border,
      splash: style?.splash ?? splash,
      borderRadius: style?.borderRadius ?? borderRadius,
      boxShadow: style?.boxShadow ?? boxShadow,
      gradient: style?.gradient ?? gradient,
      backgroundBlendMode: style?.backgroundBlendMode ?? backgroundBlendMode,
      shape: style?.shape ?? shape,
      animationDuration: style?.animationDuration ?? animationDuration,
      forcePaddingEqualToVertical:
          style?.forcePaddingEqualToVertical ?? forcePaddingEqualToVertical,
      resolveBackgroundColor:
          style?.resolveBackgroundColor ?? resolveBackgroundColor,
    );
  }
}

///
extension SurfaceWidgetX on Widget {
  /// Make all surfaces in the widget tree have a set background.
  Widget withBackground(Color color) => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: color),
        child: this,
      );

  /// Make all surfaces in the widget tree have a transparent background.
  Widget withBackgroundTransparent() => DefaultStyle<SurfaceStyle>(
        style: (context) => const SurfaceStyle(color: Colors.transparent),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of background.
  Widget withBackgroundBackground() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.background),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of surface.
  Widget withBackgroundSurface() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.surface),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of surface.
  Widget withBackgroundSurfaceInverse() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.surfaceInverse),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of primary.
  Widget withBackgroundPrimary() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.primary),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of secondary.
  Widget withBackgroundSecondary() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.secondary),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of tertiary.
  Widget withBackgroundTertiary() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.tertiary),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of success.
  Widget withBackgroundSuccess() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.success),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of warning.
  Widget withBackgroundWarning() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.warning),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of error.
  Widget withBackgroundError() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.error),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of info.
  Widget withBackgroundInfo() => DefaultStyle<SurfaceStyle>(
        style: (context) => SurfaceStyle(color: context.color.info),
        child: this,
      );
}
