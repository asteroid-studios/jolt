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

  @override
  Widget build(BuildContext context) {
    return Interaction(
      onTap: onTap,
      builder: (context, state) {
        // TODO issue where TextStyle merging fails to run properly
        // Only an issue when merge is run from macro, if class runs its fine
        final defaultStyle = ButtonStyle.defaultStyle(context, this);
        final inheritedStyle = InheritedStyle.maybeOf<ButtonStyle>(context);
        final typeStyle = ButtonStyle.fromType(type).call(context, this);
        final inlineStyle = typeStyle?.merge(this.style?.call(context, this));
        final style = defaultStyle.resolve(context, inheritedStyle, inlineStyle);
        return Surface(
          style: (context, button) {
            return style.surfaceStyle?.merge(
              SurfaceStyle(
                color: color,
                padding: padding,
                border: selected
                    ? Border.all(
                        color: Colors.white,
                        width: 1.2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      )
                    : null,
              ),
            );
          },
          child: IconTheme.merge(
            data: IconThemeData(
              size: size ?? style.iconSize ?? DefaultTextStyle.of(context).style.fontSize,
            ),
            child: DefaultTextStyle.merge(
              style: TextStyle(fontSize: size).merge(style.labelStyle),
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
          ),
        );
      },
    );
  }
}
