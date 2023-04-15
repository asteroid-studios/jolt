import 'package:flutter/material.dart';
import 'package:flutter_jolt/src/utils/spacing.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'theme.g.theme.dart';

extension JoltThemeDataExtension on ThemeData {
  JoltThemeData get joltTextTheme =>
      extension<JoltThemeData>() ?? const JoltThemeData();
}

@themeExtensions
class JoltThemeData extends ThemeExtension<JoltThemeData>
    with _$ThemeExtensionMixin {
  const JoltThemeData({
    this.borderRadius = Span.s8,
  });

  /// Define a default border radius for buttons/inputs/cards etc
  /// Defaults to Span.s8
  final double borderRadius;
}
