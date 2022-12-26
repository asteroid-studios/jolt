// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_jolt/flutter_jolt.dart';

// class JoltButton extends HookWidget {
//   final Future<void>? Function()? onPressed;
//   final Function()? onLongPress;
//   final Function(bool)? onHover;
//   final Function(bool)? onFocusChange;
//   final FocusNode? focusNode;

//   final String? label;
//   final String? labelProcessing;
//   final IconData? icon;
//   final TextDirection? textDirection;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final Color? borderColor;
//   final TextStyle? textStyle;
//   final double? iconSize;
//   final double? borderRadius;
//   final bool? circularIconButton;
//   final bool outlined;

//   const JoltButton({
//     this.onPressed,
//     this.onLongPress,
//     this.onHover,
//     this.onFocusChange,
//     this.focusNode,
//     this.label,
//     this.labelProcessing,
//     this.icon,
//     this.textDirection,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.borderColor,
//     this.textStyle,
//     this.iconSize,
//     this.borderRadius,
//     this.outlined = false,
//     this.circularIconButton,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final isProcessing = useState(false);
//     final effectiveFunction = onPressed ?? onLongPress;
//     final isDisabled = isProcessing.value || effectiveFunction == null;
//     // Get the overridden button theme if it exists
//     final joltButtonTheme =
//         context.theme.joltButtonTheme ?? const JoltButtonThemeData();
//     // Check if circularIconButton
//     final effectiveCircularIconButton =
//         (circularIconButton ?? joltButtonTheme.circularIconButtons) &&
//             label == null;
//     // Get the effective background color
//     final effectiveBackgroundColor = backgroundColor ??
//         joltButtonTheme.backgroundColor ??
//         ((outlined || effectiveCircularIconButton)
//             ? context.color.background
//             : context.color.surface);
//     // Get the overlayColor
//     final backgroundBrightness = effectiveBackgroundColor.brightness;
//     final overlayOpacity = backgroundBrightness < 10
//         ? 0.05
//         : backgroundBrightness > 200
//             ? 0.1
//             : 0.2;
//     final overlayColor =
//         (effectiveBackgroundColor.isDark ? Colors.white : Colors.black)
//             .withOpacity(overlayOpacity);
//     // Get the effective foreground color
//     final effectiveForegroundColor = foregroundColor ??
//         context.color.foreground(backgroundColor) ??
//         joltButtonTheme.foregroundColor ??
//         context.color.foreground(joltButtonTheme.backgroundColor) ??
//         context.color.primary;
//     // Get the effective text style
//     final effectiveTextStyle =
//         textStyle ?? joltButtonTheme.textStyle ?? context.textStyle.body;
//     // Get the scaled iconSize, which is based on the text size
//     // A small modifier of context.spacing.xs is added to make the icon
//     // slightly bigger than the font.
//     final effectiveIconSize = iconSize ??
//         effectiveTextStyle?.fontSize ??
//         context.theme.iconTheme.size ??
//         14;
//     final scaledIconSize =
//         (effectiveIconSize * context.effectiveTextScale) + context.spacing.xs;
//     // Get the effective border radius
//     final effectiveBorderRadius = borderRadius ?? joltButtonTheme.borderRadius;
//     // Get the effective border color
//     final effectiveBorderColor =
//         borderColor ?? (outlined ? overlayColor : effectiveBackgroundColor);
//     // Get the effective spacing
//     final effectiveSpacing = (effectiveTextStyle?.fontSize != null
//             ? effectiveTextStyle!.fontSize! / 2
//             : null) ??
//         context.spacing.sm;
//     // Get the effective button size
//     final effectiveButtonSize = (scaledIconSize * 2) + (effectiveSpacing * 2);

//     // Prepare the button style
//     final modifiedButtonStyle = ButtonStyle(
//       backgroundColor: MaterialStateColor.resolveWith((states) {
//         if (states.isNotEmpty && states.first == MaterialState.disabled) {
//           return effectiveBackgroundColor.withOpacity(0.5);
//         }
//         return effectiveBackgroundColor;
//       }),
//       minimumSize: MaterialStateProperty.all(
//         Size(effectiveButtonSize, effectiveButtonSize),
//       ),
//       enableFeedback: joltButtonTheme.enableFeedback,
//       foregroundColor: MaterialStateColor.resolveWith((states) {
//         if (states.isNotEmpty && states.first == MaterialState.disabled) {
//           return effectiveForegroundColor.withOpacity(0.7);
//         }
//         return effectiveForegroundColor;
//       }),
//       overlayColor: MaterialStateProperty.all(overlayColor),
//       side: MaterialStateProperty.all(BorderSide(
//         width: 1.5,
//         color: effectiveBorderColor,
//       )),
//       tapTargetSize:
//           effectiveButtonSize < 50 ? MaterialTapTargetSize.shrinkWrap : null,
//       padding: MaterialStateProperty.all(
//         EdgeInsets.symmetric(
//           horizontal: effectiveCircularIconButton ? 0 : effectiveSpacing * 2,
//         ),
//       ),
//       shape: effectiveCircularIconButton
//           ? MaterialStateProperty.all(const CircleBorder())
//           : effectiveBorderRadius != null
//               ? MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(
//                       effectiveBorderRadius,
//                     ),
//                   ),
//                 )
//               : null,
//     );

//     return OutlinedButton(
//       style: modifiedButtonStyle,
//       onPressed: onPressed != null && !isProcessing.value
//           ? () async {
//               isProcessing.value = true;
//               await onPressed!();
//               isProcessing.value = false;
//             }
//           : null,
//       onLongPress: onLongPress != null && !isProcessing.value
//           ? () async {
//               isProcessing.value = true;
//               await onLongPress!();
//               isProcessing.value = false;
//             }
//           : null,
//       onHover: onHover,
//       onFocusChange: onFocusChange,
//       focusNode: focusNode,
//       // TODO work out why no icon or label doesn't create a basic square
//       child: Row(
//         textDirection: textDirection ?? TextDirection.ltr,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (isProcessing.value)
//             SizedBox(
//               width: scaledIconSize,
//               height: scaledIconSize,
//               child: Center(
//                 child: SizedBox(
//                   width: scaledIconSize / 2,
//                   height: scaledIconSize / 2,
//                   child: CircularProgressIndicator(
//                     strokeWidth: scaledIconSize / 12,
//                     color: effectiveForegroundColor,
//                   ),
//                 ),
//               ),
//             )
//           else if (icon != null)
//             Icon(
//               icon!,
//               size: scaledIconSize,
//               color: isDisabled
//                   ? effectiveForegroundColor.withOpacity(0.5)
//                   : effectiveForegroundColor,
//             ),
//           if ((isProcessing.value || icon != null) && label != null)
//             // TODO replace with actual spacer
//             SizedBox(
//               width: effectiveSpacing,
//             ),
//           if (label != null)
//             Flexible(
//               child: JoltText(
//                 isProcessing.value ? (labelProcessing ?? label!) : label!,
//                 selectable: false,
//                 style: effectiveTextStyle,
//                 color: isDisabled
//                     ? effectiveForegroundColor.withOpacity(0.5)
//                     : effectiveForegroundColor,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
