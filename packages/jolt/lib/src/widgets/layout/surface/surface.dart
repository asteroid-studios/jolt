import 'package:jolt/jolt.dart';

///
class Surface extends StatelessWidget {
  ///
  const Surface({
    required this.child,
    this.background,
    this.backgroundDark,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
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
  final JoltColor? background;

  ///
  final JoltColor? backgroundDark;

  ///
  final Color? borderColor;

  ///
  final BorderRadius? borderRadius;

  ///
  final double? borderWidth;

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
    final defaultSurfaceStyle = SurfaceStyle(
      background: context.color.surface,
      borderWidth: 2,
    );
    // Hierarchy of applied surface styles in order:
    // 1. A default surface style
    // 2. The surface style from the widget theme.
    // 3. A fallback style passed from a widget implementing surface (ie button)
    // 4. A DefaultSurfaceStyle supplied style above this widget.
    // 5. Styles passed directly to surface widget
    final style = defaultSurfaceStyle
        .merge(context.inherited.widgetTheme.surfaceStyle)
        .merge(fallbackStyle)
        .merge(DefaultSurfaceStyle.maybeOf(context))
        .merge(
          SurfaceStyle(
            background: context.color.responsive(
              background,
              colorDark: backgroundDark,
            ) as JoltColor?,
            borderColor: borderColor,
            borderRadius: borderRadius,
            borderWidth: borderWidth,
            padding: padding,
            margin: margin,
          ),
        );

    final defaultBackground = style.background!;
    final defaultBorderColor = style.borderColor ?? defaultBackground;
    final defaultBorderRadius = style.borderRadius ?? context.borderRadius.md;
    final defaultBorderWidth = style.borderWidth!;
    final defaultPadding = style.padding ??
        EdgeInsets.symmetric(
          horizontal: context.spacing.sm,
          vertical: context.spacing.xs,
        );

    final interaction = context.inherited.interactionState;
    final isHovered = interaction?.isHovered ?? false;
    final isFocused = interaction?.isFocused ?? false;
    final effectColor = isHovered
        ? defaultBackground.onHovered
        : isFocused
            ? defaultBackground.onFocused
            : null;

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
      style: (_) => TextStyle(color: style.background?.foreground),
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
    return ClipRRect(
      borderRadius: defaultBorderRadius,
      child: AnimatedContainer(
        width: width,
        height: height,
        margin: margin,
        duration: context.durations.mid,
        decoration: BoxDecoration(
          borderRadius: defaultBorderRadius,
          border: Border.all(
            color: isFocused ? context.color.primary : defaultBorderColor,
            width: defaultBorderWidth,
          ),
          // TODO implement shadow
          // boxShadow: ,
          color: effectColor != null
              ? Color.alphaBlend(effectColor, defaultBackground)
              : defaultBackground,
        ),
        child: ripple
            ? TouchRippleEffect(
                backgroundColor: defaultBackground.withOpacity(1),
                borderRadius: defaultBorderRadius,
                child: childWidget,
              )
            : childWidget,
      ),
    );
  }
}
