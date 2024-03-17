import 'package:jolt_copy/jolt.dart';

///
extension SpacingX on Spacing {
  ///
  Spacing fromAxis(Axis? axis) {
    switch (axis) {
      case Axis.horizontal:
        return horizontal;
      case Axis.vertical:
        return vertical;
      case _:
        return this;
    }
  }
}

/// Convenient extensions to help with layout of multiple widgets.
extension ListSpacingX on List<Widget> {
  ///
  List<Widget> withSpacing(double spacing, {Axis? axis}) {
    return withSeparator((_) {
      switch (axis) {
        case Axis.horizontal:
          return Spacing(width: spacing);
        case Axis.vertical:
          return Spacing(height: spacing);
        case _:
          return Spacing(width: spacing, height: spacing);
      }
    });
  }

  ///
  List<Widget> withSpacingXxs({Axis? axis}) =>
      withSeparator((_) => const Spacing.xxs().fromAxis(axis));

  ///
  List<Widget> withSpacingXs({Axis? axis}) =>
      withSeparator((_) => const Spacing.xs().fromAxis(axis));

  ///
  List<Widget> withSpacingSm({Axis? axis}) =>
      withSeparator((_) => const Spacing.sm().fromAxis(axis));

  ///
  List<Widget> withSpacingMd({Axis? axis}) =>
      withSeparator((_) => const Spacing.md().fromAxis(axis));

  ///
  List<Widget> withSpacingLg({Axis? axis}) =>
      withSeparator((_) => const Spacing.lg().fromAxis(axis));

  ///
  List<Widget> withSpacingXl({Axis? axis}) =>
      withSeparator((_) => const Spacing.xl().fromAxis(axis));

  ///
  List<Widget> withSpacingXxl({Axis? axis}) =>
      withSeparator((_) => const Spacing.xxl().fromAxis(axis));

  ///
  List<Widget> withSpacingXxxl({Axis? axis}) =>
      withSeparator((_) => const Spacing.xxxl().fromAxis(axis));

  ///
  List<Widget> withSpacingSection({Axis? axis}) =>
      withSeparator((_) => const Spacing.section().fromAxis(axis));
}
