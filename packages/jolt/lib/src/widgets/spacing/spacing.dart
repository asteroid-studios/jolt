import 'package:jolt/jolt.dart';

///
class Spacing extends _Spacing {
  ///
  const Spacing({
    super.height,
    super.width,
    super.key,
  });

  const Spacing._({
    super.height,
    super.width,
    super.size,
  });

  ///
  const Spacing.expand({super.key})
      : super(
          width: double.infinity,
          height: double.infinity,
        );

  ///
  const Spacing.shrink({super.key}) : super(width: 0, height: 0);

  ///
  const Spacing.xxs({super.key}) : super(size: _SpacingSize.xxs);

  ///
  const Spacing.xs({super.key}) : super(size: _SpacingSize.xs);

  ///
  const Spacing.sm({super.key}) : super(size: _SpacingSize.sm);

  ///
  const Spacing.md({super.key}) : super(size: _SpacingSize.md);

  ///
  const Spacing.lg({super.key}) : super(size: _SpacingSize.lg);

  ///
  const Spacing.xl({super.key}) : super(size: _SpacingSize.xl);

  ///
  const Spacing.xxl({super.key}) : super(size: _SpacingSize.xxl);

  ///
  const Spacing.xxxl({super.key}) : super(size: _SpacingSize.xxxl);
}

class _Spacing extends StatelessWidget {
  const _Spacing({
    this.size,
    this.width,
    this.height,
    super.key,
  });

  final _SpacingSize? size;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    double getSize() {
      if (size != null) {
        switch (size!) {
          case _SpacingSize.xxs:
            return context.sizing.xxs;
          case _SpacingSize.xs:
            return context.sizing.xs;
          case _SpacingSize.sm:
            return context.sizing.sm;
          case _SpacingSize.md:
            return context.sizing.md;
          case _SpacingSize.lg:
            return context.sizing.lg;
          case _SpacingSize.xl:
            return context.sizing.xl;
          case _SpacingSize.xxl:
            return context.sizing.xxl;
          case _SpacingSize.xxxl:
            return context.sizing.xxxl;
        }
      }
      return context.sizing.md;
    }

    return SizedBox(
      width: width ?? getSize(),
      height: height ?? getSize(),
    );
  }
}

enum _SpacingSize {
  xxs,
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
  xxxl,
}

///
extension SpacingExtension on Spacing {
  ///
  Spacing get vertical => Spacing._(size: size, width: 0);

  ///
  Spacing get horizontal => Spacing._(size: size, height: 0);
}
