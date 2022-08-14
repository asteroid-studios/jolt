import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_utilities.dart';

ElevatedButtonThemeData buttonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(
        horizontal: SpacingMapping().lg,
        vertical: SpacingMapping().md,
      ),
    ),
  );
}
