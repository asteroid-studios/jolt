///
class SpacingSizes {
  ///
  const SpacingSizes({
    this.xxs = 4,
    this.xs = 8,
    this.sm = 12,
    this.md = 16,
    this.lg = 24,
    this.xl = 32,
    this.xxl = 40,
    this.xxxl = 48,
    this.section = 128,
  });

  ///
  double get zero => 0;

  ///
  final double xxs;

  ///
  final double xs;

  ///
  final double sm;

  ///
  final double md;

  ///
  final double lg;

  ///
  final double xl;

  ///
  final double xxl;

  ///
  final double xxxl;

  ///
  final double section;

  ///
  SpacingSizes scaled(double scaleFactor) {
    return SpacingSizes(
      xxs: xxs * scaleFactor,
      xs: xs * scaleFactor,
      sm: sm * scaleFactor,
      md: md * scaleFactor,
      lg: lg * scaleFactor,
      xl: xl * scaleFactor,
      xxl: xxl * scaleFactor,
      xxxl: xxxl * scaleFactor,
      section: section * scaleFactor,
    );
  }
}
