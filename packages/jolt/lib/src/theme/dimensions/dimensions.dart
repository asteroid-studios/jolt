import 'package:jolt/jolt.dart';

///
class Dimensions {
  ///
  const Dimensions({
    this.borderRadius = const BorderRadiusData(),
    this.sizing = const Sizing(),
    this.borderWidth = 2,
  });

  ///
  final BorderRadiusData borderRadius;

  ///
  final Sizing sizing;

  ///
  final double borderWidth;
}

///
class Sizing {
  ///
  const Sizing({
    this.xxs = 4,
    this.xs = 8,
    this.sm = 12,
    this.md = 16,
    this.lg = 24,
    this.xl = 32,
    this.xxl = 40,
    this.xxxl = 48,
    this.section = 96,
  });

  ///
  static const double none = 0;

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

  Sizing scaled(double scaleFactor) {
    return Sizing(
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

///
class BorderRadiusData {
  ///
  const BorderRadiusData({
    this.sm = const BorderRadius.all(Radius.circular(4)),
    this.md = const BorderRadius.all(Radius.circular(8)),
    this.lg = const BorderRadius.all(Radius.circular(32)),
  });

  ///
  final BorderRadius sm;

  ///
  final BorderRadius md;

  ///
  final BorderRadius lg;

  ///
  BorderRadius get zero => BorderRadius.zero;
}
