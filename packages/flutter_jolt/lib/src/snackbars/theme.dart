import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'theme.g.theme.dart';

@themeExtensions
class JoltSnackbarThemeData extends ThemeExtension<JoltSnackbarThemeData>
    with _$ThemeExtensionMixin {
  const JoltSnackbarThemeData({
    this.iconSuccess = Icons.check_circle_outline_outlined,
    this.iconInfo = Icons.info_outline_rounded,
    this.iconWarning = Icons.warning_amber_rounded,
    this.iconError = Icons.error_outline_rounded,
  });

  final IconData iconSuccess;
  final IconData iconInfo;
  final IconData iconWarning;
  final IconData iconError;
}
