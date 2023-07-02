import 'package:jolt/jolt.dart';

///
extension ScalingContextX on BuildContext {
  /// Returns the current scaling data.
  Scaling get scaling => DefaultScaling.of(this);
}
