import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'theme.g.theme.dart';

extension JoltTextThemeDataExtension on ThemeData {
  JoltTextThemeData get joltTextTheme =>
      extension<JoltTextThemeData>() ?? const JoltTextThemeData();
}

// To rerun theme:
// flutter pub run build_runner build --delete-conflicting-outputs

@themeExtensions
class JoltTextThemeData extends ThemeExtension<JoltTextThemeData>
    with _$ThemeExtensionMixin {
  const JoltTextThemeData({
    this.defaultTextStyle,
  });

  /// Defaults to context.textstyle.body
  final TextStyle? defaultTextStyle;
}
