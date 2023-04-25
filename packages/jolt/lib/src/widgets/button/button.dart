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
    this.toolTip,
    this.icon,
    this.phosphorIcon,
    this.iconWidget,
    this.onTap,
    this.onLongPressed,
    this.background,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.labelStyle,
    this.horizontalSpacing,
    this.size = ButtonSize.md,
  });

  ///
  final String? label;

  ///
  final String? toolTip;

  ///
  final IconData? icon;

  ///
  final PhosphorIconData? phosphorIcon;

  ///
  final Widget? iconWidget;

  ///
  final ButtonSize size;

  ///
  final FutureOr<void> Function()? onTap;

  ///
  final FutureOr<void> Function()? onLongPressed;

  ///
  final Color? background;

  ///
  final Color? color;

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

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isProcessing = false;

  FutureOr<void> handlePressed(FutureOr<void> Function() function) async {
    if (isProcessing) return;
    setState(() => isProcessing = true);
    await function();
    setState(() => isProcessing = false);
  }

  @override
  Widget build(BuildContext context) {
    final disabled =
        isProcessing || (widget.onTap == null && widget.onLongPressed == null);

    // Prepare the theme
    final buttonTheme = context.widgetTheme.button;
    final theme = widget.size == ButtonSize.md
        ? buttonTheme
        : widget.size == ButtonSize.sm
            // TODO come up with default button themes for small and large
            ? buttonTheme.smallButtonTheme ?? buttonTheme
            : buttonTheme.largeButtonTheme ?? buttonTheme;

    final labelStyle =
        widget.labelStyle ?? theme.labelStyle ?? context.style.body;
    final background = widget.background ?? theme.background;
    final baseColor = widget.color ??
        (background is JoltColor ? background.highlight : null) ??
        labelStyle.color;
    final color =
        disabled ? baseColor?.withOpacity(disabled ? 0.5 : 1) : baseColor;

    // Prepare the icon
    final icon = widget.iconWidget ??
        (widget.icon != null
            ? Icon(
                widget.icon,
                color: color,
              )
            : null) ??
        (widget.phosphorIcon != null
            ? PhosphorIcon(
                widget.phosphorIcon!,
                color: color,
              )
            : null);

    final noLabel = widget.label == null;
    final verticalPadding =
        theme.verticalPadding ?? context.defaults.verticalPadding;

    return Surface.focusable(
      onTap: widget.onTap != null
          ? () async => await handlePressed(widget.onTap!)
          : null,
      onLongPressed: widget.onLongPressed != null
          ? () async => await handlePressed(widget.onLongPressed!)
          : null,
      background: widget.background ?? theme.background,
      borderColor: widget.borderColor ?? theme.borderColor,
      borderRadius: widget.borderRadius ?? theme.borderRadius,
      borderWidth: widget.borderWidth,
      padding: EdgeInsets.symmetric(
        horizontal: noLabel
            ? verticalPadding
            : theme.horizontalPadding ?? context.defaults.horizontalPadding,
        vertical: verticalPadding,
      ),
      builder: (context, state) {
        if (noLabel) {
          return icon ??
              Icon(
                PhosphorIcons.regular.dot,
                color: Colors.transparent,
              );
        }

        const processingDuration = Duration(milliseconds: 1500);

        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isProcessing)
              PhosphorIcon(
                PhosphorIcons.duotone.circleNotch,
                color: baseColor,
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .rotate(duration: processingDuration)
            else if (icon != null)
              icon,
            if (icon != null || isProcessing)
              SizedBox(
                width: widget.horizontalSpacing ??
                    theme.horizontalSpacing ??
                    context.sizing.xs,
              ),
            JoltText(
              widget.label!,
              style: labelStyle,
              color: color,
            ),
          ],
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
