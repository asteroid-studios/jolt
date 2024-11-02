import 'package:gap/gap.dart' as gap;
import 'package:ui/ui.dart';

///
class Divider extends StatelessWidget {
  ///
  const Divider({
    this.color,
    this.margin,
    this.thickness,
    this.startIndent,
    this.endIndent,
    super.key,
  });

  ///
  final double? margin;

  ///
  final double? startIndent;

  ///
  final double? endIndent;

  ///
  final double? thickness;

  ///
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // TODO support margin and indent properly with respect to axis
      // TODO support text in the middle of the divider
      padding: EdgeInsets.only(
        left: startIndent ?? 0,
        right: endIndent ?? 0,
        top: margin ?? Spacing.xl,
        bottom: margin ?? Spacing.xl,
      ),
      child: gap.Gap(
        thickness ?? 1,
        crossAxisExtent: double.infinity,
        color: Colors.outline,
      ),
    );
  }
}
