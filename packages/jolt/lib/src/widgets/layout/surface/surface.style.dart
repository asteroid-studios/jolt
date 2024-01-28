import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolt/jolt.dart';

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
      padding: padding ?? style?.padding,
      margin: margin ?? style?.margin,
      width: width ?? style?.width,
      height: height ?? style?.height,
      constraints: constraints ?? style?.constraints,
      clipBehavior: clipBehavior ?? style?.clipBehavior,
      color: color ?? style?.color,
      borderColor: borderColor ?? style?.borderColor,
      image: image ?? style?.image,
      border: border ?? style?.border,
      splash: splash ?? style?.splash,
      borderRadius: borderRadius ?? style?.borderRadius,
      boxShadow: boxShadow ?? style?.boxShadow,
      gradient: gradient ?? style?.gradient,
      backgroundBlendMode: backgroundBlendMode ?? style?.backgroundBlendMode,
      shape: shape ?? style?.shape,
      animationDuration: animationDuration ?? style?.animationDuration,
      resolveBackgroundColor:
          resolveBackgroundColor ?? style?.resolveBackgroundColor,
    );
  }
}

///
extension SurfaceWidgetX on Widget {
  /// Make all surfaces in the widget tree have a set background.
  Widget withBackground(Color color) => DefaultStyle<SurfaceStyle>(
        style: SurfaceStyle(color: color),
        child: this,
      );

  /// Make all surfaces in the widget tree have a transparent background.
  Widget withBackgroundTransparent() => DefaultStyle<SurfaceStyle>(
        style: const SurfaceStyle(color: Colors.transparent),
        child: this,
      );

  /// Make all surfaces in the widget tree have a background of background.
  Widget withBackgroundBackground() => Builder(
        builder: (context) => DefaultStyle<SurfaceStyle>(
          style: SurfaceStyle(color: context.color.background),
          child: this,
        ),
      );

  /// Make all surfaces in the widget tree have a background of surface.
  Widget withBackgroundSurface() => Builder(
        builder: (context) => DefaultStyle<SurfaceStyle>(
          style: SurfaceStyle(color: context.color.surface),
          child: this,
        ),
      );

  /// Make all surfaces in the widget tree have a background of primary.
  Widget withBackgroundPrimary() => Builder(
        builder: (context) => DefaultStyle<SurfaceStyle>(
          style: SurfaceStyle(color: context.color.primary),
          child: this,
        ),
      );

  /// Make all surfaces in the widget tree have a background of secondary.
  Widget withBackgroundSecondary() => Builder(
        builder: (context) => DefaultStyle<SurfaceStyle>(
          style: SurfaceStyle(color: context.color.secondary),
          child: this,
        ),
      );

  /// Make all surfaces in the widget tree have a background of tertiary.
  Widget withBackgroundTertiary() => Builder(
        builder: (context) => DefaultStyle<SurfaceStyle>(
          style: SurfaceStyle(color: context.color.tertiary),
          child: this,
        ),
      );

  /// Make all surfaces in the widget tree have a background of success.
  Widget withBackgroundSuccess() => Builder(
        builder: (context) => DefaultStyle<SurfaceStyle>(
          style: SurfaceStyle(color: context.color.success),
          child: this,
        ),
      );

  /// Make all surfaces in the widget tree have a background of warning.
  Widget withBackgroundWarning() => Builder(
        builder: (context) => DefaultStyle<SurfaceStyle>(
          style: SurfaceStyle(color: context.color.warning),
          child: this,
        ),
      );

  /// Make all surfaces in the widget tree have a background of error.
  Widget withBackgroundError() => Builder(
        builder: (context) => DefaultStyle<SurfaceStyle>(
          style: SurfaceStyle(color: context.color.error),
          child: this,
        ),
      );

  /// Make all surfaces in the widget tree have a background of info.
  Widget withBackgroundInfo() => Builder(
        builder: (context) => DefaultStyle<SurfaceStyle>(
          style: SurfaceStyle(color: context.color.info),
          child: this,
        ),
      );
}
