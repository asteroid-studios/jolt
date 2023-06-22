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

  @override
  Widget build(BuildContext context) {
    // TODO how to make border surface? or transparent surface?
    final interaction = context.inherited.interactionState;
    final surfaceStyle = context.inherited.surfaceStyle ??
        context.inherited.widgetTheme.surfaceStyle;
    final style = surfaceStyle.merge(
      SurfaceStyle(
        background: background,
        borderColor: borderColor,
        borderRadius: borderRadius,
        borderWidth: borderWidth,
        padding: padding,
        margin: margin,
      ),
    );

    // Default background color
    // final background = context.color.darkWithFallback(
    //       backgroundDark,
    //       background,
    //     ) ??
    //     theme.background ??
    //     context.color.surface;
    final backgroundIsTransparent = background == Colors.transparent;

    // Border
    //  context.borderRadius.md;
    // final borderColor = borderColor ??
    //     theme.borderColor?.call(background) ??
    //     (backgroundIsTransparent ? context.color.surface : background);

    // Support for interactions

    // Hover state
    final isHovered = interaction?.isHovered ?? false;
    final hoverColor = theme.backgroundOnHover?.call(background) ??
        background.asJoltColor?.onHover ??
        (backgroundIsTransparent
            ? context.color.surface.withOpacity(0.8)
            : background.weaken());

    // Focus state
    final focusedAfterPressed = interaction?.wasFocusedAfterPress ?? false;
    final isFocused = interaction?.isFocused ?? false;
    final focusBorderColor =
        theme.borderColorOnFocus?.call(background) ?? context.color.primary;
    final focusColor = theme.backgroundOnFocus?.call(background) ??
        background.asJoltColor?.onFocus ??
        (backgroundIsTransparent
            ? context.color.surface.withOpacity(0.8)
            : background.weaken());

    // The end result of the background color and borderColor
    final foreground = isHovered
        ? hoverColor
        : isFocused
            ? focusColor
            : null;

    // Wrap the child with the padding
    final child = Padding(
      padding: padding ??
          theme.padding ??
          EdgeInsets.symmetric(
            horizontal: context.defaults.horizontalPadding,
            vertical: context.defaults.verticalPadding,
          ),
      child: child,
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
          borderRadius: borderRadius,
          border: Border.all(
            color: (isFocused && !focusedAfterPressed)
                ? focusBorderColor
                : borderColor,
            width: borderWidth,
          ),
          // boxShadow: ,
          color: foreground != null
              ? Color.alphaBlend(foreground, background)
              : backgroundIsTransparent
                  ? null
                  : background,
        ),
        child: InheritedSurface(
          background: background,
          child: ripple
              ? TouchRippleEffect(
                  backgroundColor: background.withOpacity(1),
                  borderRadius: borderRadius,
                  child: child,
                )
              : child,
        ),
      ),
    );
  }
}
