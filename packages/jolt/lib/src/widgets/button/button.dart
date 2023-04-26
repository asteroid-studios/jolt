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
    this.background,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.labelStyle,
    this.horizontalSpacing,
    this.width,
    this.height,
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

  ///
  final double? width;

  ///
  final double? height;

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
    final iconSize = (widget.iconSize ?? labelStyle.fontSize ?? 16) *
        context.scaling.textScale;
    final background = widget.background ?? theme.background;
    final baseColor = widget.color ??
        (background is JoltColor ? background.highlight : null) ??
        labelStyle.color;
    final color =
        disabled ? baseColor?.withOpacity(disabled ? 0.5 : 1) : baseColor;

    // Prepare the icon
    final icon = widget.iconWidget ??
        (widget.icon != null && widget.icon is PhosphorIconData
                ? widget.icon! as PhosphorIconData
                : null)
            ?.icon(
          size: iconSize,
          color: color,
        ) ??
        widget.icon?.icon(
          color: color,
          size: iconSize,
        );

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
      tooltip: widget.tooltip,
      width: widget.width,
      height: widget.height,
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
        const processingDuration = Duration(milliseconds: 1500);
        final processingIcon =
            theme.processingIcon ?? Icons.duotone.circleNotch;
        final processingIconWidget = (processingIcon is PhosphorIconData
                ? processingIcon.icon(
                    color: baseColor,
                    size: iconSize,
                  )
                : processingIcon.icon(
                    color: baseColor,
                    size: iconSize,
                  ))
            .animate(onPlay: (controller) => controller.repeat())
            .rotate(duration: processingDuration);

        if (noLabel) {
          return Column(
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
                  if (isProcessing)
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
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isProcessing) processingIconWidget else if (icon != null) icon,
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
