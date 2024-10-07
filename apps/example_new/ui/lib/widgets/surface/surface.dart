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
    this.identifier,
    this.backgroundChild,
    this.style,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
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
  final String? identifier;

  ///
  final Widget? backgroundChild;

  ///
  final bool isSliver;

  ///
  final double? width;

  ///
  final double? height;

  ///
  final Color? color;

  ///
  final BorderRadiusGeometry? borderRadius;

  ///
  final EdgeInsetsGeometry? padding;

  ///
  final EdgeInsetsGeometry? margin;

  ///
  static SurfaceStyle of(BuildContext context) {
    final style = context.dependOnInheritedWidgetOfExactType<SurfaceScope>()?.style;
    // This method will mainly be used to get
    // the color of the parent surface for widgets
    // So we can just return Colors.background as the default
    return SurfaceStyle(color: Colors.background).merge(style);
  }

  @override
  Widget build(BuildContext context) {
    final preStyle = SurfaceStyle.defaultStyle(context, this)
        .resolve(
          context,
          this.style?.call(context, this),
        )
        .merge(
          // TODO change to copywith
          SurfaceStyle(color: color, borderRadius: borderRadius),
        );

    // TODO clean up as part of resolve
    // Needs to iterate through all resolvers in order
    final style = preStyle.resolver?.call(preStyle, context) ?? preStyle;
    final foreground = style.foregroundColor ?? style.color?.foreground;

    // TODO test initial build count, currently 2 should be 1
    // if (style.color == Colors.tailwind.green) {
    //   print('Surface Built');
    // }

    final background = backgroundChild;
    final childWidget = this.child ?? const SizedBox.shrink();
    final child = Padding(
      padding: padding ?? style.padding ?? EdgeInsets.zero,
      child: DefaultSymbolStyle(
        style: TextStyle(color: foreground),
        child: style.foregroundOpacity != null
            ? Opacity(
                opacity: style.foregroundOpacity!,
                child: childWidget,
              )
            : childWidget,
      ),
    );

    final surface = AnimatedContainer(
      duration: Theme.transitionDuration,
      curve: Theme.transitionCurve,
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
                curve: Curves.ease,
                duration: Theme.transitionDuration,
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

    return Semantics(
      identifier: identifier,
      label: identifier,
      child: SurfaceScope(
        style: style,
        child: Stack(clipBehavior: Clip.none, children: [surface, ...borders]),
      ),
    );
  }
}

///
class SurfaceScope extends InheritedWidget {
  ///
  const SurfaceScope({
    required this.style,
    required super.child,
  });

  final SurfaceStyle style;

  @override
  bool updateShouldNotify(SurfaceScope oldWidget) => true;
}
