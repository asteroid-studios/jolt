import 'package:ui/ui.dart';

const surfaceDuration = Durations.medium;

///
class Surface extends StatelessWidget {
  /// A widget similar to AnimatedContainer but with two additional features
  ///
  /// 1. The given surface color can be used to work out the
  /// foreground color of children
  ///
  /// 2. The given surface color can react to Widget state
  /// from Interaction widget like hover, focus, etc.
  const Surface({required this.child, this.style, super.key}) : isSliver = false;

  ///
  const Surface.sliver({required this.child, this.style, super.key}) : isSliver = true;

  ///
  final StyleResolver<SurfaceStyle>? style;

  ///
  final Widget? child;

  ///
  final bool isSliver;

  @override
  Widget build(BuildContext context) {
    final surfaceStyle = SurfaceStyle.resolve(context, style);

    if (isSliver) {
      return AnimatedDecoratedSliver(
        duration: surfaceStyle.animationDuration,
        decoration: surfaceStyle.decoration,
        sliver: child,
      );
    }

    return AnimatedContainer(
      duration: surfaceStyle.animationDuration,
      decoration: surfaceStyle.decoration,
      child: child,
    );
  }
}
