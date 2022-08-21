import 'package:flutter/material.dart';
import 'package:flutter_jolt/src/util/color.dart';
import 'package:flutter_jolt/src/util/responsive.dart';
import 'package:flutter_jolt/src/util/typography.dart';
import 'package:flutter_jolt/src/widgets/jolt/jolt.dart';

extension JoltExtensions on BuildContext {
  /// Returns all state for the Jolt widget
  JoltState get jolt => JoltState.of(this);

  ThemeData get theme => Theme.of(this);

  ColorMapping get color => ColorMapping(theme);

  TextStyleMapping get textStyle => TextStyleMapping(theme);

  double get effectiveTextScale =>
      mediaQuery.textScaleFactor * jolt.textScale.value;
}
