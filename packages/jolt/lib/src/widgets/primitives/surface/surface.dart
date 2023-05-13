import 'package:jolt/jolt.dart';
import 'package:jolt/src/utils/theme/defaults.dart';

///
class Surface extends StatefulWidget {
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
    this.interactionState,
    super.key,
  });

  ///
  final Widget child;

  ///
  final Color? background;

  ///
  final Color? backgroundDark;

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

  /// Pass the state of an interaction to the surface.
  final InteractionState? interactionState;

  @override
  State<Surface> createState() => _SurfaceState();
}

class _SurfaceState extends State<Surface> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = context.widgetTheme.surface;
    final defaultBackground = (context.color.isDark
            ? (widget.backgroundDark ?? widget.background)
            : widget.background) ??
        theme.background ??
        context.color.surface;
    final defaultBorderRadius =
        widget.borderRadius ?? theme.borderRadius ?? context.borderRadius.md;
    final defaultHoverColor =
        theme.backgroundOnHover ?? defaultBackground.darken(5);
    final defaultFocusColor =
        theme.backgroundOnFocus ?? defaultBackground.darken(5);
    final defaultBorderColor =
        widget.borderColor ?? theme.borderColor ?? defaultBackground;
    final defaultFocusBorderColor =
        theme.borderColorOnFocus ?? context.color.primary;
    // Support for interactions
    final interaction = widget.interactionState;
    final isHovered = interaction?.isHovered ?? false;
    final isFocused = interaction?.isFocused ?? false;
    final backgroundColor = isHovered
        ? defaultHoverColor
        : isFocused
            ? defaultFocusColor
            : defaultBackground;

    return ClipRRect(
      borderRadius: defaultBorderRadius,
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: defaultBorderRadius,
          border: Border.all(
            color: isFocused ? defaultFocusBorderColor : defaultBorderColor,
            width: widget.borderWidth ?? context.borderWidth,
          ),
          color: backgroundColor,
        ),
        child: Padding(
          padding: widget.padding ??
              EdgeInsets.symmetric(
                horizontal: theme.horizontalPadding ??
                    context.defaults.horizontalPadding,
                vertical:
                    theme.verticalPadding ?? context.defaults.verticalPadding,
              ),
          child: widget.child,
        ),
        // child: widget.child != null
        //     ? child
        //     : TouchRippleEffect(
        //         borderRadius: defaultBorderRadius,
        //         backgroundColor: defaultBackground,
        //         child: child,
        //       ),
      ),
    );
  }
}
