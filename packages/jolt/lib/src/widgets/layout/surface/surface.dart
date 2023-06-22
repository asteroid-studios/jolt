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
    final surfaceStyle = context.inherited.surfaceStyle ??
        fallbackStyle ??
        context.inherited.widgetTheme.surfaceStyle;
    final style = surfaceStyle.merge(
      SurfaceStyle(
        background: context.color.darkWithFallback(
          backgroundDark,
          background,
        ) as JoltColor?,
        borderColor: borderColor,
        borderRadius: borderRadius,
        borderWidth: borderWidth,
        padding: padding,
        margin: margin,
      ),
    );

    final defaultBackground = style.background ?? context.color.surface;
    final defaultBorderColor = style.borderColor ?? style.background;
    final defaultBorderRadius = style.borderRadius ?? context.borderRadius.md;
    final defaultBorderWidth = style.borderWidth ?? 2;
    final transparentBackground = defaultBackground.opacity == 0;
    final interaction = context.inherited.interactionState;
    final isHovered = interaction?.isHovered ?? false;
    final isFocused = interaction?.isFocused ?? false;
    final effectColor = isHovered
        ? defaultBackground.onHover
        : isFocused
            ? defaultBackground.onFocus
            : null;
    // TODO how to make border surface? or transparent surface?
    // final borderColor = style.borderColor ??
    //     (transparentBackground
    //         ? context.color.surface
    //         : backgroundColor.weaken());

    // Border
    //  context.borderRadius.md;
    // final borderColor = borderColor ??
    //     theme.borderColor?.call(background) ??
    //     (backgroundIsTransparent ? context.color.surface : background);

    // final hoverColor = theme.backgroundOnHover?.call(background) ??
    //     background.asJoltColor?.onHover ??
    //     (backgroundIsTransparent
    //         ? context.color.surface.withOpacity(0.8)
    //         : background.weaken());

    // // Focus state
    // final focusedAfterPressed = interaction?.wasFocusedAfterPress ?? false;
    // final isFocused = interaction?.isFocused ?? false;
    // final focusBorderColor =
    //     theme.borderColorOnFocus?.call(background) ?? context.color.primary;
    // final focusColor = theme.backgroundOnFocus?.call(background) ??
    //     background.asJoltColor?.onFocus ??
    //     (backgroundIsTransparent
    //         ? context.color.surface.withOpacity(0.8)
    //         : background.weaken());

    // The end result of the background color and borderColor

    // Wrap the child with the padding and new default surface
    final childWidget = DefaultSurfaceStyle(
      style: style,
      child: Padding(
        padding: style.padding ??
            EdgeInsets.symmetric(
              horizontal: context.sizing.sm,
              vertical: context.sizing.xs,
            ),
        child: child,
      ),
    );

    // Return the surface
    return ClipRRect(
      borderRadius: borderRadius,
      child: AnimatedContainer(
        width: width,
        height: height,
        margin: margin,
        duration: context.durations.mid,
        decoration: BoxDecoration(
          borderRadius: style.borderRadius,
          border: Border.all(
            // color: (isFocused && !focusedAfterPressed)
            //     ? focusBorderColor
            //     : borderColor,
            width: style.borderWidth ?? 2,
          ),
          // boxShadow: ,
          color: effectColor != null
              ? Color.alphaBlend(effectColor, defaultBackground)
              : transparentBackground
                  ? null
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
