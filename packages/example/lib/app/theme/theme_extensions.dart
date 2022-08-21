import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt.dart';

List<ThemeExtension<dynamic>> themeExtensions(themeData) {
  final color = themeData.colorScheme;
  return [
    const JoltButtonThemeData(
      // borderRadius: 5,
      circularIconButtons: true,
    ),
  ];
}
