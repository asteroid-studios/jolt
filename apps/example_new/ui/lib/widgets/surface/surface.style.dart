import 'package:ui/ui.dart';

// TODO once macros are more developed I can do this instead
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

///
class SurfaceStyle {
  ///
  const SurfaceStyle({
    this.decoration,
    this.animationDuration,
  });

  ///
  final BoxDecoration? decoration;

  ///
  final Duration? animationDuration;

  ///
  static MergedSurfaceStyle defaultStyle(BuildContext context) {
    return const MergedSurfaceStyle(
      decoration: BoxDecoration(),
      animationDuration: Durations.medium,
    );
  }

  ///
  static MergedSurfaceStyle resolve(
    BuildContext context,
    SurfaceStyle Function(BuildContext)? inlineStyle,
  ) {
    final inherited = InheritedStyle.maybeOf<SurfaceStyle>(context);
    final inline = inlineStyle?.call(context);
    return defaultStyle(context).merge(inherited).merge(inline);
  }
}

///
class MergedSurfaceStyle {
  ///
  const MergedSurfaceStyle({
    required this.decoration,
    required this.animationDuration,
  });

  ///
  final BoxDecoration decoration;

  ///
  final Duration animationDuration;

  ///
  MergedSurfaceStyle merge(SurfaceStyle? style) {
    return MergedSurfaceStyle(
      decoration: style?.decoration ?? decoration,
      animationDuration: style?.animationDuration ?? animationDuration,
    );
  }
}
