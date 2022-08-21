// ignore_for_file: unused_element, unused_field

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'jolt_button_theme_data.tailor.dart';

// To re-run the generation use the line below:
// * flutter pub run build_runner build --delete-conflicting-outputs
// ! After generating remove required from nullable fields
// Right now after generating I have to go in and fix the output,
// because there is no support for nullable options with Theme Tailor

extension JoltButtonThemeExtension on ThemeData {
  JoltButtonThemeData? get joltButtonTheme => extension<JoltButtonThemeData>();
}

@TailorComponent(themes: [])
class _$JoltButtonThemeData {
  static List<Color?>? backgroundColor;
  static List<Color?>? foregroundColor;
  static List<TextStyle?>? textStyle;
  static List<double?>? borderRadius;
}
