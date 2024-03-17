import 'package:jolt_copy/jolt.dart';

///
class BorderRadii {
  ///
  const BorderRadii({
    this.sm = const BorderRadius.all(Radius.circular(4)),
    this.md = const BorderRadius.all(Radius.circular(8)),
    this.lg = const BorderRadius.all(Radius.circular(12)),
    this.xl = const BorderRadius.all(Radius.circular(32)),
  });

  ///
  final BorderRadius sm;

  ///
  final BorderRadius md;

  ///
  final BorderRadius lg;

  ///
  final BorderRadius xl;

  ///
  BorderRadius get zero => BorderRadius.zero;
}
