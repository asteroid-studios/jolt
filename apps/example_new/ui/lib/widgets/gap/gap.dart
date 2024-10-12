import 'package:gap/gap.dart' as gap;
import 'package:ui/ui.dart';

///
class Gap extends StatelessWidget {
  ///
  const Gap(double gapSize, {super.key})
      : size = gapSize,
        spacing = null;

  ///
  const Gap.xxxs({super.key})
      : size = null,
        spacing = SpacingSize.xxxs;

  ///
  const Gap.xxs({super.key})
      : size = null,
        spacing = SpacingSize.xxs;

  ///
  const Gap.xs({super.key})
      : size = null,
        spacing = SpacingSize.xs;

  ///
  const Gap.sm({super.key})
      : size = null,
        spacing = SpacingSize.sm;

  ///
  const Gap.md({super.key})
      : size = null,
        spacing = SpacingSize.md;

  ///
  const Gap.lg({super.key})
      : size = null,
        spacing = SpacingSize.lg;

  ///
  const Gap.xl({super.key})
      : size = null,
        spacing = SpacingSize.xl;

  ///
  const Gap.xxl({super.key})
      : size = null,
        spacing = SpacingSize.xxl;

  ///
  const Gap.xxxl({super.key})
      : size = null,
        spacing = SpacingSize.xxxl;

  ///
  const Gap.hero({super.key})
      : size = null,
        spacing = SpacingSize.hero;

  ///
  /// TODO Gap.max
  // const Gap.max({super.key})
  //     : size = null,
  //       spacing = SpacingSize.hero;

  ///
  static Widget scrollStart() {
    return Builder(
      builder: (context) {
        return Gap(ScrollPadding.of(context).start);
      },
    );
  }

  ///
  static Widget scrollEnd() {
    return Builder(
      builder: (context) {
        return Gap(ScrollPadding.of(context).end);
      },
    );
  }

  ///
  final double? size;

  ///
  final SpacingSize? spacing;

  @override
  Widget build(BuildContext context) {
    // TODO handle spacing scaling
    final size = spacing?.value ?? this.size ?? 0;

    return gap.Gap(size);
  }
}
