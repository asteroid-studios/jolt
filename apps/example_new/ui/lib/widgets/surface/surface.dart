import 'package:ui/ui.dart';

///
class Surface extends StatelessWidget {
  /// A widget similar to AnimatedContainer but with two additional features
  ///
  /// 1. The given surface color can be used to work out the
  /// foreground color of children
  ///
  /// 2. The given surface color can react to Widget state
  /// from Interaction widget like hover, focus, etc.
  const Surface({
    this.child,
    this.style,
    this.height,
    this.width,
    this.padding,
    this.margin,
    super.key,
  }) : isSliver = false;

  ///
  // const Surface.sliver({this.child, this.style, super.key}) : isSliver = true;

  ///
  final StyleResolver<SurfaceStyle, Surface>? style;

  ///
  final Widget? child;

  ///
  final bool isSliver;

  ///
  final double? width;

  ///
  final double? height;

  ///
  final EdgeInsetsGeometry? padding;

  ///
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final style = SurfaceStyle.defaultStyle(context, this).resolve(
      context,
      InheritedStyle.maybeOf(context),
      this.style?.call(context, this),
    );
    final foreground = style.foregroundColor ?? style.color?.foreground;

    // if (isSliver) {
    //   return AnimatedDecoratedSliver(
    //     duration: surfaceStyle.animationDuration,
    //     decoration: surfaceStyle.decoration,
    //     sliver: child,
    //   );
    // }

    return AnimatedContainer(
      duration: Durations.themeChange,
      width: width,
      height: height,
      padding: padding ?? style.padding,
      margin: margin,
      decoration: BoxDecoration(
        color: style.color,
        borderRadius: style.borderRadius,
        border: style.border,
        shape: style.shape ?? BoxShape.rectangle,
        boxShadow: style.color?.a == 0 ? null : style.boxShadow,
      ),
      child: DefaultSymbolStyle(
        style: TextStyle(color: foreground),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
