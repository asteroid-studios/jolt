import 'package:jolt/jolt.dart';

/// A mapping of durations to use in animations.
extension DurationExtension on BuildContext {
  ///
  DurationMapping get durations => DurationMapping();
}

///
class DurationMapping {
  ///
  Duration zero = Duration.zero;

  ///
  Duration fast = const Duration(milliseconds: 100);

  ///
  Duration mid = const Duration(milliseconds: 300);

  ///
  Duration long = const Duration(milliseconds: 500);
}
