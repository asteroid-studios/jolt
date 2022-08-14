import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';

class JoltButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final TextDirection? textDirection;
  final double? elevation;
  final Color? backgroundColor;
  final Color? color;

  const JoltButton({
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
    ButtonStyle? modifiedButtonStyle;

    if (backgroundColor != null) {
      Color? foregroundColor =
          color ?? context.color.foreground(backgroundColor!);

      modifiedButtonStyle = context.theme.elevatedButtonTheme.style?.copyWith(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => backgroundColor!,
        ),
        foregroundColor: foregroundColor != null
            ? MaterialStateColor.resolveWith(
                (states) => foregroundColor,
              )
            : null,
      );
    }

    return ElevatedButton(
      style: modifiedButtonStyle,
      onPressed: () {},
      child: Row(
        textDirection: textDirection ?? TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon!,
              size: (context.textStyle.body?.fontSize ?? 18) *
                  context.effectiveTextScale,
            ),
          if (label != null)
            JoltText(
              label!,
              selectable: false,
            ),
        ],
      ),
    );
  }
}
