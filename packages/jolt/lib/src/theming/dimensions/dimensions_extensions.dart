import 'package:jolt/jolt.dart';

///
extension DimensionsContextX on BuildContext {
  /// Returns the current dimensions.
  Dimensions get dimensions => theme.dimensions;

  /// Returns the current spacing.
  SpacingSizes get spacing => dimensions.spacing.scaled(scaling.spacingScale);

  /// Returns the current border radius values.
  BorderRadii get borderRadius => dimensions.borderRadius;
}
