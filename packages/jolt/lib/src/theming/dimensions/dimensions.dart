import 'package:jolt/jolt.dart';

///
class Dimensions {
  ///
  const Dimensions({
    this.borderRadius = const BorderRadii(),
    this.spacing = const Spacing(),
  });

  ///
  final BorderRadii borderRadius;

  ///
  final Spacing spacing;
}
