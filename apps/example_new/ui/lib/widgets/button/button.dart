import 'package:ui/ui.dart';

///
class Button extends StatelessWidget with ThemeValues {
  ///
  const Button({
    this.label,
    this.icon,
    this.onTap,
    super.key,
  });

  ///
  final String? label;

  ///
  final IconData? icon;

  ///
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: color.surface,
          border: Border.all(color: color.surface),
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
              children: [
                if (icon != null) Icon(icon!),
                if (icon != null && label != null) const Gap.xs(),
                if (label != null) Text(label!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
