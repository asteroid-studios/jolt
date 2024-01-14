import 'package:jolt/jolt.dart';

///
class Surface extends StatelessWidget {
  ///
  const Surface({
    required this.child,
    this.background,
    this.border,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.ripple = false,
    this.setDefaultStyleForChildren = true,
    this.fallbackStyle,
    super.key,
  });

  ///
  final Widget child;

  ///
  final Color? background;

  ///
  final Border? border;

  ///
  final BorderRadius? borderRadius;

  ///
  final EdgeInsets? padding;

  ///
  final EdgeInsets? margin;

  ///
  final double? width;

  ///
  final double? height;

  /// Whether to show a ripple effect on tap
  final bool ripple;

  /// Whether to set the default style for children
  final bool setDefaultStyleForChildren;

  /// Pass a fallback surface style
  /// which will be used over the default surface style from widget theme.
  ///
  /// For example button passes the button style to it's surface.
  final SurfaceStyle? fallbackStyle;

  @override
  Widget build(BuildContext context) {
    final interaction = context.inherited.interactionState;
    final defaultSurfaceStyle = SurfaceStyle(
      background: context.color.surface,
      borderRadius: context.borderRadius.md,
      border: Border.all(width: 2),
    );
    // Hierarchy of applied surface styles in order:
    // 1. A default surface style
    // 2. The surface style from the widget theme.
    // 3. A fallback style passed from a widget utilizing surface (ie button)
    // 4. A DefaultSurfaceStyle supplied style above this widget.
    // 5. Styles passed directly to surface widget
    final style = defaultSurfaceStyle
        .merge(context.inherited.widgetTheme.surfaceStyle)
        .merge(fallbackStyle)
        .merge(DefaultSurfaceStyle.maybeOf(context))
        .merge(
          SurfaceStyle(
            border: border,
            borderRadius: borderRadius,
            padding: padding,
            margin: margin,
            background: background,
          ),
        );

    final surfaceColor = style.background!.asJoltColor;
    final borderColor = border.toBorderColor ?? surfaceColor.as.border(context);
    final backgroundColor = surfaceColor.as.background(context);
    final foregroundColor = surfaceColor.as.foreground(context);
    final defaultPadding = style.padding ??
        EdgeInsets.symmetric(
          horizontal: context.spacing.sm,
          vertical: context.spacing.xs,
        );

    // Wrap with a default surface style so things
    // like foregroundLight will work inside surface
    // It's important to only pass the background or all surface params
    // will be applied to everything below, ie button in a card
    //
    // Wrap the children of the surface with a symbol style so that they use
    // the foreground color by default.
    //
    // Also wrap the children with padding.
    Widget childWidget = DefaultSymbolStyle(
      style: (_) => TextStyle(color: foregroundColor),
      child: Padding(
        padding: defaultPadding,
        child: child,
      ),
    );

    if (setDefaultStyleForChildren) {
      childWidget = DefaultSurfaceStyle(
        style: SurfaceStyle(background: style.background),
        child: childWidget,
      );
    }

    // Return the surface
    // TODO should i apply clip to container instead?
    return ClipRRect(
      borderRadius: style.borderRadius ?? BorderRadius.zero,
      child: AnimatedContainer(
        width: width,
        height: height,
        margin: margin,
        duration: context.durations.mid,
        decoration: BoxDecoration(
          borderRadius: style.borderRadius,
          color: backgroundColor,
          // gradient: surfaceColor.backgroundGradient,
          border: style.border?.copyWithColor(borderColor),
          // TODO implement shadow
          // boxShadow: ,
        ),
        child: ripple
            ? TouchRippleEffect(
                backgroundColor: backgroundColor.withOpacity(1),
                borderRadius: style.borderRadius,
                foregroundColor: foregroundColor,
                child: childWidget,
              )
            : childWidget,
      ),
    );
  }
}
