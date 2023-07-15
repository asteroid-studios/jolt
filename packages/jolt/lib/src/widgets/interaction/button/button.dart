import 'dart:async';

import 'package:jolt/jolt.dart';

///
class Button extends StatefulWidget {
  ///
  const Button({
    super.key,
    this.label,
    this.tooltip,
    this.icon,
    this.iconSize,
    this.iconScale = 1.0,
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
    this.fullWidth = false,
    this.autoFocus = false,
    this.requestFocusOnPress = true,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.direction = TextDirection.ltr,
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
  final double iconScale;

  ///
  final double? iconSize;

  ///
  final FutureOr<void> Function()? onTap;

  ///
  final FutureOr<void> Function()? onLongPressed;

  /// Called when an error occurs inside onTap or onLongPressed
  final void Function(InteractionException)? errorHandler;

  ///
  final bool requestFocusOnPress;

  ///
  final JoltColor? background;

  ///
  final JoltColor? backgroundDark;

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

  ///
  final MainAxisAlignment mainAxisAlignment;

  ///
  final TextDirection direction;

  ///
  final bool fullWidth;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    // Prepare the button theme
    late ButtonType type;
    final hasIcon = widget.icon != null || widget.iconWidget != null;
    final hasLabel = widget.label != null;
    if (hasLabel && hasIcon) {
      type = ButtonType.iconLabel;
    } else if (hasLabel) {
      type = ButtonType.label;
    } else if (hasIcon) {
      type = ButtonType.icon;
    } else {
      type = ButtonType.empty;
    }
    final buttonStyle = context.inherited.widgetTheme.buttonStyle?.call(type);

    return Interaction(
      onTap: widget.onTap,
      onLongPressed: widget.onLongPressed,
      errorHandler: widget.errorHandler,
      tooltip: widget.tooltip,
      autoFocus: widget.autoFocus,
      requestFocusOnPress: widget.requestFocusOnPress,
      builder: (context, state) {
        final color = context.color.responsive(
          widget.color,
          colorDark: widget.colorDark,
        );
        // Prepare the icon
        final icon = widget.iconWidget ??
            (widget.icon != null
                ? Icon(
                    widget.icon!,
                    size: widget.iconSize ?? widget.labelStyle?.fontSize,
                    scale: widget.iconScale,
                    color: color,
                  )
                : null);
        // Prepare the progressIndicator
        final progressIndicator = CircularProgressIndicator(
          color: color,
          // size: iconSize,
        );

        late Widget child;
        // Layout ICON button
        if (widget.label == null) {
          type = ButtonType.icon;
          child = Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Necessary for widths to line up without label
              RotatedBox(
                quarterTurns: 1,
                child: Text('', style: widget.labelStyle),
              ),
              Row(
                mainAxisSize:
                    widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: widget.mainAxisAlignment,
                children: [
                  if (state.isWaiting)
                    progressIndicator
                  else
                    icon ?? const Icon(Icons.dot, color: Colors.transparent),
                  // Necessary for heights to line up without label
                  Text('', style: widget.labelStyle),
                ],
              )
            ],
          );
        } else {
          if (icon == null) {
            type = ButtonType.label;
          } else {
            type = ButtonType.iconLabel;
          }
          // Prepare LABEL button
          final spacing =
              widget.spacing ?? buttonStyle?.spacing ?? context.spacing.xs;
          final buttonChildren = [
            if (state.isWaiting) progressIndicator else if (icon != null) icon,
            Text(
              widget.label!,
              style: widget.labelStyle,
              color: color,
            ),
          ];
          if (widget.verticalButton) {
            // Layout VERTICAL button
            child = Column(
              verticalDirection: widget.direction == TextDirection.ltr
                  ? VerticalDirection.down
                  : VerticalDirection.up,
              mainAxisSize: MainAxisSize.min,
              spacing: spacing,
              children: buttonChildren,
            );
          } else {
            // Layout HORIZONTAL button
            child = Row(
              textDirection: widget.direction,
              mainAxisSize:
                  widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: widget.mainAxisAlignment,
              spacing: spacing,
              children: buttonChildren,
            );
          }
        }

        final surface = Surface(
          fallbackStyle: buttonStyle?.surfaceStyle,
          width: widget.width,
          height: widget.height,
          background: widget.background,
          backgroundDark: widget.backgroundDark,
          borderColor: widget.borderColor,
          borderRadius: widget.borderRadius,
          borderWidth: widget.borderWidth,
          padding: widget.padding,
          ripple: true,
          child: child,
        );

        if (buttonStyle?.labelStyle == null) return surface;

        return DefaultSymbolStyle(
          style: (_) => buttonStyle!.labelStyle!,
          child: surface,
        );
      },
    );
  }
}

/// The type of button
enum ButtonType {
  /// An icon only
  icon,

  /// An label only
  label,

  /// Both an icon and label
  iconLabel,

  /// An icon widget
  empty,
}
