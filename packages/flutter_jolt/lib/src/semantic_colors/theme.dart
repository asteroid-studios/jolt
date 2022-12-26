import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'theme.g.theme.dart';

@themeExtensions
class SemanticColorThemeData extends ThemeExtension<SemanticColorThemeData>
    with _$ThemeExtensionMixin {
  const SemanticColorThemeData({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
  });

  /// A constructor with light defaults
  const SemanticColorThemeData.light({
    this.success = const Color(0xff4B9564),
    this.onSuccess = const Color(0xffC9E3D1),
    this.successContainer = const Color(0xFFA0CFB0),
    this.onSuccessContainer = const Color(0xff15281B),
    this.info = const Color(0xff33b5e5),
    this.onInfo = const Color(0xffEDF9FD),
    this.infoContainer = const Color(0xffC4EAF8),
    this.onInfoContainer = const Color(0xff093044),
    this.warning = const Color(0xffEE8F00),
    this.onWarning = const Color(0xffFFDEAD),
    this.warningContainer = const Color(0xffFFC670),
    this.onWarningContainer = const Color(0xff211C13),
  });

  /// A constructor with dark defaults
  const SemanticColorThemeData.dark({
    this.success = const Color(0xffA0CFB0),
    this.onSuccess = const Color(0xff15281B),
    this.successContainer = const Color(0xFF4B9564),
    this.onSuccessContainer = const Color(0xffC9E3D1),
    this.info = const Color(0xffC4EAF8),
    this.onInfo = const Color(0xff093044),
    this.infoContainer = const Color(0xff33B5E5),
    this.onInfoContainer = const Color(0xffEDF9FD),
    this.warning = const Color(0xffFFC670),
    this.onWarning = const Color(0xff211C13),
    this.warningContainer = const Color(0xffEE8F00),
    this.onWarningContainer = const Color(0xffFFDEAD),
  });

  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;
}
