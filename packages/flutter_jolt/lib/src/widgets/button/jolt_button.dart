import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';

class JoltButton extends StatelessWidget {
  final Function()? onPressed;
  final Function()? onLongPress;
  final Function(bool)? onHover;
  final Function(bool)? onFocusChange;
  final FocusNode? focusNode;

  final String? label;
  final IconData? icon;
  final TextDirection? textDirection;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;

  const JoltButton({
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.label,
    this.icon,
    this.textDirection,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the overridden button theme if it exists
    final joltButtonTheme = context.theme.joltButtonTheme;
    // Get the effective background color
    final effectiveBackgroundColor = backgroundColor ??
        joltButtonTheme?.backgroundColor ??
        context.color.background;
    // Get the effective foreground color
    final effectiveForegroundColor = foregroundColor ??
        context.color.foreground(backgroundColor) ??
        joltButtonTheme?.foregroundColor ??
        context.color.foreground(joltButtonTheme?.backgroundColor) ??
        context.color.primary;
    // Get the effective text style
    final effectiveTextStyle = textStyle ?? context.textStyle.body;
    // Get the scaled iconSize, which is based on the text size
    final iconSize =
        effectiveTextStyle?.fontSize ?? context.theme.iconTheme.size ?? 18;
    final scaledIconSize = iconSize * context.effectiveTextScale;

    final modifiedButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) {
        if (states.isNotEmpty) {
          print(states);
          switch (states.first) {
            case MaterialState.hovered:
              return effectiveBackgroundColor.darken(0);
            case MaterialState.focused:
              // TODO: Handle this case.
              break;
            case MaterialState.pressed:
              // TODO: Handle this case.
              break;
            case MaterialState.dragged:
              // TODO: Handle this case.
              break;
            case MaterialState.selected:
              // TODO: Handle this case.
              break;
            case MaterialState.scrolledUnder:
              // TODO: Handle this case.
              break;
            case MaterialState.disabled:
              // TODO: Handle this case.
              break;
            case MaterialState.error:
              // TODO: Handle this case.
              break;
          }
        }
        return effectiveBackgroundColor;
      }),
      foregroundColor: MaterialStateProperty.all(effectiveForegroundColor),
      // primary: _foregroundColor,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(
      //   joltButtonTheme?.borderRadius ?? 5,
      // )),
    );

    // TODO allow multiple sizes? maybe an optional button small and large?

    // TODO allow forcing a border.
    // modifiedButtonStyle = modifiedButtonStyle?.copyWith(
    //   side: MaterialStateProperty.all(BorderSide(
    //     // TODO Make sure the width from the theme comes through to here.
    //     // TODO Handle if background is dark or light.
    //     // TODO make the splash color match the background color
    //     // width: modifiedButtonStyle.side,
    //     width: 2,
    //     // color: background.isDark ? background.lighten() : background.darken(),
    //   )),
    // );

    return OutlinedButton(
      style: modifiedButtonStyle,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      focusNode: focusNode,
      child: Row(
        textDirection: textDirection ?? TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO show a spinner when loading
          if (icon != null) Icon(icon!, size: scaledIconSize),
          // TODO replace with actual spacer
          if (icon != null && label != null)
            SizedBox(
              width: context.spacing.sm,
            ),
          if (label != null)
            Flexible(
              child: JoltText(
                label!,
                selectable: false,
                style: effectiveTextStyle,
                color: effectiveForegroundColor,
              ),
            ),
        ],
      ),
    );
  }
}
