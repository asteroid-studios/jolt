import 'package:jolt/jolt.dart';

///
class Dimensions {
  ///
  const Dimensions({
    this.borderRadius = const BorderRadiusData(),
    this.spacing = const Spacing(),
    this.borderWidth = 2,
  });

  ///
  final BorderRadiusData borderRadius;

  ///
  final Spacing spacing;

  ///
  final double borderWidth;
}

// TODO how can a change spacing or allow switching between different spacing values?
// TODO I would prefer it to be like textScaleFactor, rather than having to remake different dimensions
///
class Spacing {
  ///
  const Spacing({
    this.xxs = 4,
    this.xs = 8,
    this.s = 12,
    this.m = 16,
    this.l = 24,
    this.xl = 32,
    this.xxl = 40,
    this.xxxl = 48,
  });

  ///
  static const double none = 0;

  ///
  final double xxs;

  ///
  final double xs;

  ///
  final double s;

  ///
  final double m;

  ///
  final double l;

  ///
  final double xl;

  ///
  final double xxl;

  ///
  final double xxxl;

  Spacing scaled(double scaleFactor) {
    return Spacing(
      xxs: xxs * scaleFactor,
      xs: xs * scaleFactor,
      s: s * scaleFactor,
      m: m * scaleFactor,
      l: l * scaleFactor,
      xl: xl * scaleFactor,
      xxl: xxl * scaleFactor,
      xxxl: xxxl * scaleFactor,
    );
  }
}

///
class BorderRadiusData {
  ///
  const BorderRadiusData({
    this.s = const BorderRadius.all(Radius.circular(4)),
    this.m = const BorderRadius.all(Radius.circular(8)),
    this.l = const BorderRadius.all(Radius.circular(16)),
  });

  ///
  final BorderRadius s;

  ///
  final BorderRadius m;

  ///
  final BorderRadius l;
}
