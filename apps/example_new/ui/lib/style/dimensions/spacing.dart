// TODO change this to macros with comments based on values.

///
enum SpacingSize {
  ///
  zero(0),

  ///
  xxxs(2),

  ///
  xxs(4),

  ///
  xs(8),

  ///
  sm(10),

  ///
  md(16),

  ///
  lg(24),

  /// Spacing equal to: **32**
  xl(32),

  /// Spacing equal to: **40**
  xxl(40),

  ///
  xxxl(48),

  ///
  hero(128);

  const SpacingSize(this.value);

  ///
  final double value;
}

///
class Spacing {
  ///
  static double get zero => SpacingSize.zero.value;

  ///
  static double get xxxs => SpacingSize.xxxs.value;

  ///
  static double get xxs => SpacingSize.xxs.value;

  ///
  static double get xs => SpacingSize.xs.value;

  ///
  static double get sm => SpacingSize.sm.value;

  ///
  static double get md => SpacingSize.md.value;

  ///
  static double get lg => SpacingSize.lg.value;

  ///
  static double get xl => SpacingSize.xl.value;

  ///
  static double get xxl => SpacingSize.xxl.value;

  ///
  static double get xxxl => SpacingSize.xxxl.value;

  ///
  static double get hero => SpacingSize.hero.value;
}
