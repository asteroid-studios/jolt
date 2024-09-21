import 'package:ui/ui.dart';

// ignore_for_file: public_member_api_docs
// -----------------------------------------------
// Later on this will be way less code with Macros
// -----------------------------------------------
class SurfaceStyle {
  const SurfaceStyle({
    this.color,
    this.foregroundColor,
    this.borderRadius,
    this.border,
    this.animationDuration,
  });

  final Color? color;
  final Color? foregroundColor;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Duration? animationDuration;

  /// Default style for all surfaces
  static MergedSurfaceStyle defaultStyle(BuildContext context) {
    return MergedSurfaceStyle(
      color: Colors.surface,
      borderRadius: BorderRadius.circular(8),
      animationDuration: Durations.medium,
    );
  }

  static MergedSurfaceStyle resolve(
    BuildContext context,
    StyleResolver<SurfaceStyle>? inlineStyle,
  ) =>
      defaultStyle(context).merge(InheritedStyle.maybeOf<SurfaceStyle>(context)).merge(inlineStyle?.call(context));
}

class MergedSurfaceStyle {
  const MergedSurfaceStyle({
    required this.color,
    required this.borderRadius,
    required this.animationDuration,
    this.border,
    this.foregroundColor,
  });

  final Color color;
  final BorderRadiusGeometry borderRadius;
  final Duration animationDuration;
  final Color? foregroundColor;
  final BoxBorder? border;

  MergedSurfaceStyle merge(SurfaceStyle? style) {
    return MergedSurfaceStyle(
      color: style?.color ?? color,
      foregroundColor: style?.foregroundColor ?? foregroundColor,
      borderRadius: style?.borderRadius ?? borderRadius,
      animationDuration: style?.animationDuration ?? animationDuration,
      border: style?.border ?? border,
    );
  }
}


// Once macros are more developed I can do this instead
// @Style()
// class SurfaceStyle {
//   final BoxDecoration decoration;
//   final Duration animationDuration;

//   ///
//   static MergedSurfaceStyle defaultStyle(BuildContext context) {
//     return const MergedSurfaceStyle(
//       decoration: BoxDecoration(),
//       animationDuration: Durations.medium,
//     );
//   }
// }
