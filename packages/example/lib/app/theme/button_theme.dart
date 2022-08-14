import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_utilities.dart';

OutlinedButtonThemeData buttonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(
        horizontal: SpacingMapping().lg,
        vertical: SpacingMapping().md,
      ),
      side: BorderSide(
        width: 2,
      ),
    ),
  );
}
