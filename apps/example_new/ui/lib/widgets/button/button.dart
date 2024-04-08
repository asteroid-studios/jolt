import 'package:ui/ui.dart';

///
class Button extends StatelessWidget {
  ///
  const Button({
    this.label,
    this.icon,
    this.onTap,
    this.color,
    this.labelStyle,
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

  @override
  Widget build(BuildContext context) {
    final c = ThemeProvider.theme.colorScheme;
    final background = color ?? c.surface;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: background,
          border: Border.all(color: background),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Spacing.sm,
          horizontal: label != null ? Spacing.lg : Spacing.sm,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const RotatedBox(quarterTurns: 1, child: Text('')),
            const Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
