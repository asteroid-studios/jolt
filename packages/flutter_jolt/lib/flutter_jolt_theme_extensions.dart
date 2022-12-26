import 'package:flutter/material.dart';
import 'src/jolt/theme.dart';
import 'src/text/theme.dart';
import 'src/semantic_colors/theme.dart';

export 'src/text/theme.dart';
export 'src/jolt/theme.dart';
export 'src/semantic_colors/theme.dart';

class JoltThemeExtensions {
  final JoltThemeData Function(ThemeData)? joltThemeData;
  final JoltTextThemeData Function(ThemeData)? textThemeData;
  final SemanticColorThemeData Function(ThemeData)? semanticColorsThemeData;

  const JoltThemeExtensions({
    this.joltThemeData,
    this.textThemeData,
    this.semanticColorsThemeData,
  });

  ThemeData themeFromExtensions(ThemeData theme) {
    return theme.copyWith(
      extensions: [
        joltThemeData != null ? joltThemeData!(theme) : const JoltThemeData(),
        textThemeData != null
            ? textThemeData!(theme)
            : const JoltTextThemeData(),
        if (semanticColorsThemeData != null)
          semanticColorsThemeData!(theme)
        else if (theme.brightness == Brightness.dark)
          const SemanticColorThemeData.dark()
        else if (theme.brightness == Brightness.light)
          const SemanticColorThemeData.light(),
      ],
    );
  }
}
