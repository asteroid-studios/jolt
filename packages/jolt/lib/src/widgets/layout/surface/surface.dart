import 'package:jolt/jolt.dart';

///
class Surface extends StatelessWidget {
  ///
  const Surface({
    this.style,
    this.child,
    super.key,
  });

  ///
  final StyleResolver<SurfaceStyle>? style;

  ///
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // The default widget style
    final widgetStyle = SurfaceStyle(
      color: context.color.surface,
      border: Border.all(width: 1.5),
      borderRadius: context.dimensions.borderRadius.md,
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.xs,
        vertical: context.spacing.xs,
      ),
    );

    // Merge and resolve all child styles.
    final style = Style.resolveAll(
      context,
      widgetStyle: widgetStyle,
      style: this.style?.call(context),
    );

    final color = style.color == Colors.transparent
        ? SurfaceColor.of(context)
        : style.color!;

    final childWithPadding = SurfaceColor(
      color: color,
      child: Padding(
        padding: style.padding ?? EdgeInsets.zero,
        child: child,
      ),
    );

    return DefaultSymbolStyle(
      style: (context) => TextStyle(color: color.as.foreground(context)),
      child: SizedBox(
        width: style.width,
        height: style.height,
        child: AnimatedContainer(
          clipBehavior: style.clipBehavior ?? Clip.antiAlias,
          decoration: BoxDecoration(
            color: color.as.background(context),
            image: style.image,
            border: style.border?.copyWithColor(
              style.borderColor ?? color.as.border(context),
            ),
            borderRadius: style.borderRadius,
            boxShadow: style.boxShadow,
            gradient: style.gradient,
            backgroundBlendMode: style.backgroundBlendMode,
            shape: style.shape ?? BoxShape.rectangle,
          ),
          duration: style.animationDuration ?? context.durations.short,
          child: style.splash ?? false
              ? Splash(child: childWithPadding)
              : childWithPadding,
        ),
      ),
    );
  }
}

///
class SurfaceColor extends InheritedWidget {
  ///
  const SurfaceColor({
    required this.color,
    required super.child,
    super.key,
  });

  ///
  final Color color;

  /// Helper method to access the nearest InheritedSurface in the widget tree
  static Color of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SurfaceColor>()?.color ??
        context.color.background;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
