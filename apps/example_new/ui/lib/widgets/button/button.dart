import 'package:ui/ui.dart';

///
class Button extends StatelessWidget {
  /// A default
  const Button({
    this.label,
    this.icon,
    this.onTap,
    this.style,
    this.color,
    this.trailing,
    this.selected = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.size,
    this.padding,
    super.key,
  }) : type = ButtonType.filled;

  /// A button with a transparent background
  const Button.ghost({
    this.label,
    this.icon,
    this.onTap,
    this.style,
    this.color,
    this.trailing,
    this.selected = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.size,
    this.padding,
    super.key,
  }) : type = ButtonType.ghost;

  /// A button with an outlined border
  const Button.outlined({
    this.label,
    this.icon,
    this.onTap,
    this.style,
    this.color,
    this.trailing,
    this.selected = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.size,
    this.padding,
    super.key,
  }) : type = ButtonType.outlined;

  /// A button styled as a link
  const Button.link({
    this.label,
    this.icon,
    this.onTap,
    this.style,
    this.color,
    this.trailing,
    this.selected = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.size,
    this.padding,
    super.key,
  }) : type = ButtonType.link;

  /// A button with a filled background
  const Button.filled({
    this.label,
    this.icon,
    this.onTap,
    this.style,
    this.color,
    this.trailing,
    this.selected = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.size,
    this.padding,
    super.key,
  }) : type = ButtonType.filled;

  ///
  final Widget? label;

  ///
  final Widget? icon;

  ///
  final Widget? trailing;

  ///
  final double? size;

  ///
  final void Function()? onTap;

  ///
  final Color? color;

  ///
  final MainAxisAlignment mainAxisAlignment;

  ///
  final ButtonType type;

  ///
  final StyleResolver<ButtonStyle, Button>? style;

  final EdgeInsetsGeometry? padding;

  // TODO remove
  final bool selected;

  // TODO loading indicator

  @override
  Widget build(BuildContext context) {
    return Interaction(
      onTap: onTap,
      builder: (context, state) {
        final defaultStyle = ButtonStyle.defaultStyle(context, this);
        final typeStyle = ButtonStyle.fromType(type).call(context, this);
        final inlineStyle = typeStyle?.merge(this.style?.call(context, this));
        final style = defaultStyle.resolve(context, inlineStyle);
        final labelStyle = TextStyle(fontSize: size);

        return Surface(
          style: (context, surface) {
            return style.surfaceStyle?.merge(
              SurfaceStyle(
                color: color,
                padding: padding,
              ),
            );
          },
          backgroundChild: style.splash?.call(),
          child: DefaultSymbolStyle(
            iconSize: style.iconSize,
            style: style.labelStyle?.merge(labelStyle) ?? labelStyle,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const RotatedBox(quarterTurns: 1, child: Text('')),
                const Text(''),
                Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    if (icon != null) icon!,
                    if (icon != null && label != null && style.dividerIconLabel != null) style.dividerIconLabel!,
                    if (label != null) label!,
                    if (trailing != null) trailing!,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
