import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_utilities.dart';

TextButtonThemeData buttonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(
        horizontal: SpacingMapping().md,
        vertical: SpacingMapping().md,
      ),
      side: const BorderSide(
        width: 0,
        color: Colors.transparent,
      ),
    ),
  );
}
