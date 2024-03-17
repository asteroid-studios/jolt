import 'package:jolt_copy/jolt.dart';

///
extension ScalingContextX on BuildContext {
  /// Returns the current scaling data.
  Scaling get scaling => DefaultScaling.of(this);
}
