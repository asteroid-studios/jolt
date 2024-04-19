import 'package:ui/ui.dart';

///
class Button extends StatelessWidget {
  ///
  const Button({
    this.label,
    this.icon,
    this.onTap,
    this.color,
    this.selected = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.labelStyle,
    this.horizontalPadding,
    super.key,
  });

  ///
  final String? label;

  ///
  final IconData? icon;

  ///
  final TextStyle? labelStyle;

  ///
  final void Function()? onTap;

  ///
  final Color? color;

  ///
  final double? horizontalPadding;

  ///
  final MainAxisAlignment mainAxisAlignment;

  // TODOremove
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final c = ThemeProvider.theme.colorScheme;
    final background = color ?? c.surface;

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
          vertical: Spacing.sm,
          horizontal:
              horizontalPadding ?? (label != null ? Spacing.lg : Spacing.sm),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const RotatedBox(quarterTurns: 1, child: Text('')),
            const Text(''),
            Row(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                if (icon != null)
                  Icon(
                    icon!,
                    size: labelStyle?.fontSize,
                  ),
                if (icon != null && label != null) const Gap.xs(),
                if (label != null)
                  Text(
                    label!,
                    style: labelStyle,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
