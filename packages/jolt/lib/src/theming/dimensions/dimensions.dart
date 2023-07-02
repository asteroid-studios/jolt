import 'package:jolt/jolt.dart';

///
class Dimensions {
  ///
  const Dimensions({
    this.borderRadius = const BorderRadii(),
    this.spacing = const SpacingSizes(),
  });

  ///
  final BorderRadii borderRadius;

  ///
  final SpacingSizes spacing;
}
