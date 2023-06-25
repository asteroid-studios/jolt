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

  /// Pass a fallback surface style
  /// which will be used over the default surface style from widget theme.
  ///
  /// For example button passes the button style to it's surface.
  final SurfaceStyle? fallbackStyle;

  @override
  Widget build(BuildContext context) {
    // Hierarchy of applied surface styles in order:
    // 1. The default surface style from the widget theme.
    // 2. A fallback style passed from a widget implementing surface (ie button)
    // 3. A default surface style from somewhere above this widget.
    // 4. Styles passed directly to surface widget (the last merged)
    final style = context.inherited.widgetTheme.surfaceStyle
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

    final defaultBackground = style.background ?? context.color.surface;
    final defaultBorderColor = style.borderColor ?? defaultBackground;
    final defaultBorderRadius = style.borderRadius ?? context.borderRadius.md;
    final defaultBorderWidth = style.borderWidth ?? 2;
    final interaction = context.inherited.interactionState;

    final isHovered = interaction?.isHovered ?? false;
    final isFocused = interaction?.isFocused ?? false;
    final wasFocusedAfterPressed = interaction?.wasFocusedAfterPress ?? false;
    final effectColor = isHovered
        ? defaultBackground.onHovered
        : isFocused
            ? defaultBackground.onFocused
            : null;

    // Wrap with a default surface style so things
    // like foregroundLight will work inside surface
    //
    // Wrap the children of the surface with a symbol style so that they use
    // the foreground color by default.
    //
    // Also wrap the children with padding.
    final childWidget = DefaultSurfaceStyle(
      style: style,
      child: DefaultSymbolStyle(
        style: (_) => TextStyle(color: style.background?.foreground),
        child: Padding(
          padding: style.padding ??
              EdgeInsets.symmetric(
                horizontal: context.spacing.sm,
                vertical: context.spacing.xs,
              ),
          child: child,
        ),
      ),
    );

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
            color: (isFocused && !wasFocusedAfterPressed)
                ? context.color.primary
                : defaultBorderColor,
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
