import 'package:jolt/jolt.dart';
import 'package:jolt/src/utils/theme/defaults.dart';
import 'package:jolt/src/widgets/ripple_effect/ripple_effect.dart';

///
class Surface extends StatefulWidget {
  ///
  const Surface({
    required this.child,
    this.theme,
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
    this.ripple = false,
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

  /// Pass an entire surface theme to the surface.
  final SurfaceTheme? theme;

  /// Whether to show a ripple effect on tap
  final bool ripple;

  @override
  State<Surface> createState() => _SurfaceState();
}

class _SurfaceState extends State<Surface> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // The surface theme will either be the default
    // or a merge of the default and one passed in
    final theme = context.widgetTheme.surface.merge(widget.theme);

    // Default background color
    final backgroundColor = context.color.darkWithFallback(
          widget.backgroundDark,
          widget.background,
        ) ??
        theme.background ??
        context.color.surface;

    // Border
    final borderWidth = widget.borderWidth ?? theme.borderWidth ?? 2;
    final borderRadius =
        widget.borderRadius ?? theme.borderRadius ?? context.borderRadius.md;
    final borderColor = widget.borderColor ??
        theme.borderColor?.call(backgroundColor) ??
        backgroundColor;

    // Support for interactions
    final interaction = widget.interactionState;

    // Hover state
    final isHovered = interaction?.isHovered ?? false;
    final hoverColor = theme.backgroundOnHover?.call(backgroundColor) ??
        backgroundColor.darken(5);

    // Focus state
    final focusedAfterPressed = interaction?.wasFocusedAfterPress ?? false;
    final isFocused = interaction?.isFocused ?? false;
    final focusBorderColor = theme.borderColorOnFocus?.call(backgroundColor) ??
        context.color.primary;
    final focusColor = theme.backgroundOnFocus?.call(backgroundColor) ??
        backgroundColor.darken(5);

    // The end result of the background color and borderColor
    final background = isHovered
        ? hoverColor
        : isFocused
            ? focusColor
            : backgroundColor;

    // Wrap the child with the padding
    final child = Padding(
      padding: widget.padding ??
          EdgeInsets.symmetric(
            horizontal:
                theme.horizontalPadding ?? context.defaults.horizontalPadding,
            vertical: theme.verticalPadding ?? context.defaults.verticalPadding,
          ),
      child: widget.child,
    );

    // Return the surface
    return ClipRRect(
      borderRadius: borderRadius,
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        duration: context.durations.mid,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: (isFocused && !focusedAfterPressed)
                ? focusBorderColor
                : borderColor,
            width: borderWidth,
          ),
          color: background,
        ),
        child: widget.ripple
            ? TouchRippleEffect(
                backgroundColor: backgroundColor,
                borderRadius: borderRadius,
                child: child,
              )
            : child,
      ),
    );
  }
}