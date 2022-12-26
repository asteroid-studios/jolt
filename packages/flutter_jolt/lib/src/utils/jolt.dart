import 'package:flutter/material.dart';
import 'package:flutter_jolt/src/jolt/jolt.dart';

extension JoltExtensions on BuildContext {
  /// Returns all state for the Jolt widget
  JoltState get jolt => JoltState.of(this);
  ThemeData get theme => Theme.of(this);
}
