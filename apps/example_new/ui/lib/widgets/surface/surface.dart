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
    this.backgroundChild,
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
  final Widget? backgroundChild;

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

  ///
  static SurfaceStyle of(BuildContext context) {
    final style = context.dependOnInheritedWidgetOfExactType<_SurfaceScope>()?.style;
    // This method will mainly be used to get
    // the color of the parent surface for widgets
    // So we can just return Colors.background as the default
    return style ?? SurfaceStyle(color: Colors.background);
  }

  @override
  Widget build(BuildContext context) {
    final preStyle = SurfaceStyle.defaultStyle(context, this).resolve(
      context,
      this.style?.call(context, this),
    );
    // TODO clean up as part of resolve
    // Needs to iterate through all resolvers in order
    final style = preStyle.resolver?.call(preStyle) ?? preStyle;
    final foreground = style.foregroundColor ?? style.color?.foreground;

    final background = backgroundChild;
    final child = Padding(
      padding: padding ?? style.padding ?? EdgeInsets.zero,
      child: DefaultSymbolStyle(
        style: TextStyle(color: foreground),
        child: this.child ?? const SizedBox.shrink(),
      ),
    );

    final surface = AnimatedContainer(
      duration: Durations.themeTransition,
      width: width,
      height: height,
      margin: margin,
      clipBehavior: background != null ? Clip.hardEdge : Clip.none,
      decoration: BoxDecoration(
        color: style.color,
        borderRadius: style.borderRadius,
        shape: style.shape ?? BoxShape.rectangle,
        boxShadow: style.color?.opacity == 0 ? null : style.boxShadow,
      ),
      child: background != null ? Stack(children: [background, child]) : child,
    );

    final borders = style.border?.map(
          (border) => Positioned.fill(
            top: -border.top.gap,
            left: -border.left.gap,
            right: -border.right.gap,
            bottom: -border.bottom.gap,
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: Durations.themeTransition,
                decoration: BoxDecoration(
                  borderRadius: (border.borderRadius ?? style.borderRadius)?.add(BorderRadius.circular(border.top.gap)),
                  border: Border.all(
                    color: border.top.color ?? Colors.outline,
                    width: border.top.width,
                  ),
                ),
              ),
            ),
          ),
        ) ??
        [];

    return _SurfaceScope(
      style: style,
      child: Stack(clipBehavior: Clip.none, children: [surface, ...borders]),
    );
  }
}

class _SurfaceScope extends InheritedWidget {
  const _SurfaceScope({
    required this.style,
    required super.child,
  });

  final SurfaceStyle style;

  @override
  bool updateShouldNotify(_SurfaceScope oldWidget) => true;
}
