import 'package:flutter/material.dart';
import 'package:flutter_jolt/src/snackbars/theme.dart';
import 'src/jolt/theme.dart';
import 'src/text/theme.dart';
import 'src/semantic_colors/theme.dart';

export 'src/text/theme.dart';
export 'src/jolt/theme.dart';
export 'src/semantic_colors/theme.dart';

class JoltThemeExtensions {
  final JoltThemeData Function(ThemeData)? joltThemeData;
  final JoltTextThemeData Function(ThemeData)? textThemeData;
  final JoltSnackbarThemeData Function(ThemeData)? snackbarThemeData;
  final SemanticColorThemeData Function(ThemeData)? semanticColorsThemeData;

  const JoltThemeExtensions({
    this.joltThemeData,
    this.textThemeData,
    this.snackbarThemeData,
    this.semanticColorsThemeData,
  });

  ThemeData themeFromExtensions(ThemeData t) {
    return t.copyWith(
      extensions: [
        // Theme data for the Jolt Widget
        joltThemeData?.call(t) ?? const JoltThemeData(),
        // Theme data for the JoltText Widget
        textThemeData?.call(t) ?? const JoltTextThemeData(),
        // Theme data for the JoltSnackbar Widget
        snackbarThemeData?.call(t) ?? const JoltSnackbarThemeData(),
        // Theme data for the SemanticColors
        semanticColorsThemeData?.call(t) ??
            (t.brightness == Brightness.dark
                ? const SemanticColorThemeData.dark()
                : const SemanticColorThemeData.light()),
      ],
    );
  }
}
