import 'package:jolt_copy/jolt.dart';

/// A mapping of durations to use in animations.
extension DurationExtension on BuildContext {
  ///
  Durations get durations => Durations();
}

///
class Durations {
  ///
  Duration zero = Duration.zero;

  ///
  Duration short = const Duration(milliseconds: 100);

  ///
  Duration mid = const Duration(milliseconds: 300);

  ///
  Duration long = const Duration(milliseconds: 500);
}
