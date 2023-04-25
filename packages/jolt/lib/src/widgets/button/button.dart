import 'dart:async';

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
  final BorderRadius? borderRadius;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    // Prepare the theme
    final buttonTheme = context.widgetTheme.button;
    final theme = widget.size == ButtonSize.md
        ? buttonTheme
        : widget.size == ButtonSize.sm
            // TODO come up with default button themes for small and large
            ? buttonTheme.smallButtonTheme ?? buttonTheme
            : buttonTheme.largeButtonTheme ?? buttonTheme;

    final effectiveBackground = widget.background ?? theme.background;
    final effectiveColor = widget.color ??
        (effectiveBackground is JoltColor
            ? effectiveBackground.highlight
            : null);

    // Prepare the icon
    final icon = widget.iconWidget ??
        (widget.icon != null
            ? Icon(
                widget.icon,
                color: effectiveColor,
              )
            : null) ??
        (widget.phosphorIcon != null
            ? PhosphorIcon(
                widget.phosphorIcon!,
                color: effectiveColor,
              )
            : null);

    final noLabel = widget.label == null;
    final verticalPadding =
        theme.verticalPadding ?? context.defaults.verticalPadding;

    return Surface.focusable(
      onTap: widget.onTap,
      onLongPressed: widget.onLongPressed,
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
        if (noLabel) return icon ?? const SizedBox();

        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon,
            JoltText(
              widget.label!,
              color: effectiveColor,
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
