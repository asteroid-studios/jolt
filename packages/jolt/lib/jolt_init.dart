import 'package:hive_flutter/hive_flutter.dart';

import 'package:jolt/jolt.dart';

///
class Jolt {
  /// Initialize Jolt to be able to save theme data across sessions.
  static Future<void> initFlutter() async {
    await Hive.initFlutter();
    // ignore: inference_failure_on_function_invocation
    await Hive.openBox(joltStorageKey);
  }
}
