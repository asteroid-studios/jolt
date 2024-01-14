import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolt/jolt.dart';

part 'surface_style_new.freezed.dart';

///
@freezed
class SurfaceStyle with _$SurfaceStyle implements Style<SurfaceStyle> {
  /// Defines the style of a [Surface] widget
  const factory SurfaceStyle({
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape? shape,
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
      image: image ?? style?.image,
      border: border ?? style?.border,
      borderRadius: borderRadius ?? style?.borderRadius,
      boxShadow: boxShadow ?? style?.boxShadow,
      gradient: gradient ?? style?.gradient,
      backgroundBlendMode: backgroundBlendMode ?? style?.backgroundBlendMode,
      shape: shape ?? style?.shape,
    );
  }
}
