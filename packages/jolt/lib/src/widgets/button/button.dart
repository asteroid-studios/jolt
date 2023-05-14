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
    this.spacing,
    this.width,
    this.height,
    this.padding,
    this.verticalButton = false,
    this.autoFocus = false,
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
  final double? spacing;

  ///
  final BorderRadius? borderRadius;

  ///
  final TextStyle? labelStyle;

  ///
  final double? width;

  ///
  final double? height;

  ///
  final bool autoFocus;

  ///
  final EdgeInsets? padding;

  /// Whether to arrange items vertically instead of horizontally
  final bool verticalButton;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    // Prepare the button theme
    final button = context.widgetTheme.button;
    final smallButton = button.copyWith(labelStyle: context.style.label);
    final largeButton = button.copyWith(labelStyle: context.style.heading);
    final theme = widget.size == ButtonSize.md
        ? button
        : widget.size == ButtonSize.sm
            ? button.smallButtonTheme ?? smallButton
            : button.largeButtonTheme ?? largeButton;

    // Prepare the surface
    final surface = context.surfaceTheme.merge(button.surface).copyWith(
          background: context.color.darkWithFallback(
            widget.backgroundDark,
            widget.background,
          ),
        );

    // Prepare the label style
    final noLabel = widget.label == null;
    final labelStyle =
        widget.labelStyle ?? theme.labelStyle ?? context.style.body;

    // Prepare the icon size
    final iconSize = (widget.iconSize ?? labelStyle.fontSize ?? 16) *
        context.scaling.textScale;

    // Prepare the foreground color
    final background = surface.background;
    final color = context.color.darkWithFallback(
      widget.colorDark,
      widget.color,
    );
    final baseColor = color ??
        button.color?.call(background) ??
        (background is JoltColor ? background.highlight : null) ??
        labelStyle.color;

    // Prepare padding
    final verticalPadding =
        surface.verticalPadding ?? context.defaults.verticalPadding;
    final horizontalPadding = noLabel
        // When there is no label, we want a square button so make
        // the horizontal padding the same as the vertical padding
        ? verticalPadding
        : surface.horizontalPadding ?? context.defaults.horizontalPadding;
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
      autoFocus: widget.autoFocus,
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

        // Prepare the awaiting icon
        const awaitingDuration = Duration(milliseconds: 1500);
        final awaitingIcon = theme.awaitingIcon ?? Icons.duotone.circleNotch;
        final awaitingIconWidget = Icon(
          awaitingIcon,
          color: baseColor,
          size: iconSize,
        )
            .animate(onPlay: (controller) => controller.repeat())
            .rotate(duration: awaitingDuration);

        late Widget child;
        if (noLabel) {
          // Layout ICON button
          child = Column(
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
                    awaitingIconWidget
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
          // Prepare LABEL button
          final spacing = widget.spacing ?? theme.spacing ?? context.sizing.xs;
          final buttonChildren = [
            if (state.isAwaiting)
              awaitingIconWidget
            else if (icon != null)
              icon,
            Text(
              widget.label!,
              style: labelStyle,
              color: color,
            ),
          ];
          if (widget.verticalButton) {
            // Layout VERTICAL button
            child = Column(
              mainAxisSize: MainAxisSize.min,
              spacing: spacing,
              children: buttonChildren,
            );
          } else {
            // Layout HORIZONTAL button
            child = Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: spacing,
              children: buttonChildren,
            );
          }
        }

        return Surface(
          width: widget.width,
          height: widget.height,
          theme: surface,
          borderColor: widget.borderColor,
          borderRadius: widget.borderRadius,
          borderWidth: widget.borderWidth,
          padding: padding,
          interactionState: state,
          ripple: true,
          child: child,
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
