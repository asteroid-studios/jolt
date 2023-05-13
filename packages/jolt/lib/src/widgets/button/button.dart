import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';

import 'package:jolt/jolt.dart';
import 'package:jolt/src/utils/theme/defaults.dart';

///
class Button extends StatefulWidget {
  ///
  const Button({
    super.key,
    this.label,
    this.tooltip,
    this.icon,
    this.iconSize,
    this.iconWidget,
    this.onTap,
    this.onLongPressed,
    this.errorHandler,
    this.background,
    this.backgroundDark,
    this.color,
    this.colorDark,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.labelStyle,
    this.horizontalSpacing,
    this.width,
    this.height,
    this.padding,
    this.size = ButtonSize.md,
  });

  ///
  final String? label;

  ///
  final String? tooltip;

  ///
  final IconData? icon;

  ///
  final Widget? iconWidget;

  ///
  final ButtonSize size;

  ///
  final double? iconSize;

  ///
  final FutureOr<void> Function()? onTap;

  ///
  final FutureOr<void> Function()? onLongPressed;

  /// Called when an error occurs inside onTap or onLongPressed
  final void Function(InteractionException)? errorHandler;

  ///
  final Color? background;

  ///
  final Color? backgroundDark;

  ///
  final Color? color;

  ///
  final Color? colorDark;

  ///
  final Color? borderColor;

  ///
  final double? borderWidth;

  ///
  final double? horizontalSpacing;

  ///
  final BorderRadius? borderRadius;

  ///
  final TextStyle? labelStyle;

  ///
  final double? width;

  ///
  final double? height;

  ///
  final EdgeInsets? padding;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    // Prepare the theme
    final surfaceTheme = context.widgetTheme.surface;
    final buttonTheme = context.widgetTheme.button;
    final theme = widget.size == ButtonSize.md
        ? buttonTheme
        : widget.size == ButtonSize.sm
            // TODO come up with default button themes for small and large
            ? buttonTheme.smallButtonTheme ?? buttonTheme
            : buttonTheme.largeButtonTheme ?? buttonTheme;

    final labelStyle =
        widget.labelStyle ?? theme.labelStyle ?? context.style.body;
    final iconSize = (widget.iconSize ?? labelStyle.fontSize ?? 16) *
        context.scaling.textScale;
    final background = (context.color.isDark
            ? (widget.backgroundDark ?? widget.background)
            : widget.background) ??
        theme.background;
    final color = context.color.isDark
        ? (widget.colorDark ?? widget.color)
        : widget.color;
    final baseColor = color ??
        (background is JoltColor ? background.highlight : null) ??
        labelStyle.color;

    final noLabel = widget.label == null;

    // Prepare padding
    final verticalPadding = theme.verticalPadding ??
        surfaceTheme.verticalPadding ??
        context.defaults.verticalPadding;
    final horizontalPadding = noLabel
        ? verticalPadding
        : theme.horizontalPadding ??
            surfaceTheme.horizontalPadding ??
            context.defaults.horizontalPadding;
    final padding = widget.padding ??
        EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        );

    return Interaction(
      onTap: widget.onTap,
      onLongPressed: widget.onLongPressed,
      errorHandler: widget.errorHandler,
      tooltip: widget.tooltip,
      builder: (context, state) {
        final isDisabled = state.isAwaiting || !state.hasPressHandler;

        final color = isDisabled
            ? baseColor?.withOpacity(isDisabled ? 0.5 : 1)
            : baseColor;

        // Prepare the icon
        final icon = widget.iconWidget ??
            (widget.icon != null
                ? Icon(widget.icon!, size: iconSize, color: color)
                : null);

        const processingDuration = Duration(milliseconds: 1500);
        final processingIcon =
            theme.processingIcon ?? Icons.duotone.circleNotch;
        final processingIconWidget = Icon(
          processingIcon,
          color: baseColor,
          size: iconSize,
        )
            .animate(onPlay: (controller) => controller.repeat())
            .rotate(duration: processingDuration);

        late Widget button;
        if (noLabel) {
          button = Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Necessary for widths to line up without label
              RotatedBox(
                quarterTurns: 1,
                child: Text('', style: labelStyle),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state.isAwaiting)
                    processingIconWidget
                  else
                    icon ??
                        Icon(
                          Icons.regular.dot,
                          color: Colors.transparent,
                        ),
                  // Necessary for heights to line up without label
                  Text('', style: labelStyle),
                ],
              ),
            ],
          );
        } else {
          button = Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.isAwaiting)
                processingIconWidget
              else if (icon != null)
                icon,
              if (icon != null || state.isAwaiting)
                SizedBox(
                  width: widget.horizontalSpacing ??
                      theme.horizontalSpacing ??
                      context.sizing.xs,
                ),
              Text(
                widget.label!,
                style: labelStyle,
                color: color,
              ),
            ],
          );
        }

        return Surface(
          width: widget.width,
          height: widget.height,
          background: widget.background ?? theme.background,
          borderColor: widget.borderColor ?? theme.borderColor,
          borderRadius: widget.borderRadius ?? theme.borderRadius,
          borderWidth: widget.borderWidth,
          padding: padding,
          interactionState: state,
          child: button,
        );
      },
    );
  }
}

/// The size of a button
enum ButtonSize {
  /// A small button
  sm,

  /// A medium button
  md,

  /// A large button
  lg,
}
