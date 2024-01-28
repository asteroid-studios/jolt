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
        horizontal: context.spacing.sm,
        vertical: context.spacing.xs,
      ),
    );

    // Merge and resolve all child styles.
    final style = Style.resolveAll(
      context,
      widgetStyle: widgetStyle,
      style: this.style?.call(context),
    );

    final childWithPadding = Padding(
      padding: style.padding ?? EdgeInsets.zero,
      child: child,
    );

    return DefaultSymbolStyle(
      style: (context) =>
          TextStyle(color: style.color?.asJoltColor.as.foreground(context)),
      child: SizedBox(
        width: style.width,
        height: style.height,
        child: AnimatedContainer(
          clipBehavior: style.clipBehavior ?? Clip.antiAlias,
          decoration: BoxDecoration(
            color: style.color?.asJoltColor.as.background(context),
            image: style.image,
            border: style.border?.copyWithColor(
              style.borderColor ?? style.color?.asJoltColor.as.border(context),
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
