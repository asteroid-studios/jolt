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
  final Color? color;

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
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final background = backgroundColor ?? context.color.background;
    ButtonStyle? modifiedButtonStyle = context.theme.textButtonTheme.style;

    if (backgroundColor != null) {
      Color? foregroundColor = color ?? context.color.foreground(background);

      modifiedButtonStyle = modifiedButtonStyle?.copyWith(
        overlayColor: MaterialStateColor.resolveWith(
          (states) => (background.isDark ? Colors.white : Colors.black)
              .withOpacity(0.1),
        ),
        // surfaceTintColor: MaterialStateColor.resolveWith(
        //   (states) => Colors.blue.withOpacity(0.2),
        // ),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => background,
        ),
        foregroundColor: foregroundColor != null
            ? MaterialStateColor.resolveWith(
                (states) => foregroundColor,
              )
            : null,
      );
    }

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

    return TextButton(
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
          if (icon != null)
            Icon(
              icon!,
              size: (context.textStyle.body?.fontSize ?? 18) *
                  context.effectiveTextScale,
            ),
          if (icon != null && label != null)
            SizedBox(
              width: context.spacing.sm,
            ),
          if (label != null)
            Flexible(
              child: JoltText(
                label!,
                selectable: false,
              ),
            ),
        ],
      ),
    );
  }
}
