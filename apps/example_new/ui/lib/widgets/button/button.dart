import 'package:ui/ui.dart';

///
class Button extends StatelessWidget {
  ///
  const Button({
    this.label,
    this.icon,
    this.trailing,
    this.onTap,
    this.color,
    this.selected = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.size,
    this.padding,
    this.horizontalPadding,
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
  final double? padding;

  ///
  final double? horizontalPadding;

  ///
  final MainAxisAlignment mainAxisAlignment;

  // TODO remove
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final background = color ?? Colors.surface;

    final padding = this.padding ?? Spacing.sm;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: surfaceDuration,
        decoration: BoxDecoration(
          color: background,
          border: selected
              ? Border.all(
                  color: Colors.white,
                  width: 1.2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                )
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: padding,
          horizontal:
              horizontalPadding ?? (label != null ? Spacing.lg : padding),
        ),
        child: IconTheme.merge(
          data: IconThemeData(
            size: size ?? DefaultTextStyle.of(context).style.fontSize,
          ),
          child: DefaultTextStyle.merge(
            style: TextStyle(fontSize: size),
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
