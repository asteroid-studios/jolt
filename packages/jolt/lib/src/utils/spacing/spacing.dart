import 'package:jolt/jolt.dart';

final size = Size(2, 4);

final sizedBox = const SizedBox().h2;

extension SizeExtensions on SizedBox {
  SizedBox get h2 => SizedBox(width: 2);
}

class Span {
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s28 = 28.0;
  static const double s32 = 32.0;
  static const double s36 = 36.0;
  static const double s40 = 40.0;
  static const double s44 = 44.0;
  static const double s48 = 48.0;
  static const double s56 = 56.0;
}

// final padding= EdgeInsets.all(value);

