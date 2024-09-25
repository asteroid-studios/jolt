import 'package:ui/ui.dart';

///
class Button extends StatelessWidget {
  ///
  const Button({
    this.label,
    this.icon,
    this.style,
    this.onTap,
    this.color,
    this.trailing,
    this.selected = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.size,
    this.padding,
    super.key,
  });

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
  final StyleResolver<ButtonStyle, Button>? style;

  final EdgeInsetsGeometry? padding;

  // TODO remove
  final bool selected;

  /// Regular filled button, default style
  static StyleResolver<ButtonStyle, Button> get filled => (context, button) => null;

  /// A button styled as a link
  static StyleResolver<ButtonStyle, Button> get link => (context, button) => ButtonStyle(
        // TODO only add on hover
        labelStyle: const TextStyle(decoration: TextDecoration.underline),
        surfaceStyle: SurfaceStyle(
          color: Colors.transparent,
          foregroundColor: Colors.background.foreground,
        ),
      );

  /// A transparent button
  static StyleResolver<ButtonStyle, Button> get ghost => (context, button) => ButtonStyle(
        surfaceStyle: SurfaceStyle(
          color: Colors.transparent,
          foregroundColor: Colors.background.foreground,
        ),
      );

  ///
  static StyleResolver<ButtonStyle, Button> get outlined => (context, button) => ButtonStyle(
        surfaceStyle: SurfaceStyle(
          color: Colors.background,
          border: Border.all(
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.outline,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final defaultStyle = ButtonStyle.defaultStyle(context, this);
    final inherited = InheritedStyle.maybeOf<ButtonStyle, Button>(context, this);
    final inline = this.style?.call(context, this);
    // TODO issue where TextStyle merging fails to run properly
    // Only an issue when merge is run from macro, if class runs its fine
    final style = defaultStyle.resolve(context, inherited, inline);

    // TODO swap for interaction widget.

    return GestureDetector(
      onTap: onTap,
      child: Surface(
        style: (context, button) {
          return SurfaceStyle(
            color: color,
            padding: padding,
            border: selected
                ? Border.all(
                    color: Colors.white,
                    width: 1.2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  )
                : null,
          ).merge(style.surfaceStyle);
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
                    if (icon != null && label != null) const Gap.xs(),
                    if (label != null) label!,
                    if (trailing != null) trailing!,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
