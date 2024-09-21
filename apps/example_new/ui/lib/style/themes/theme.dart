// ignore_for_file: prefer_const_declarations

import 'package:ui/ui.dart';
export 'dart:ui' show Brightness;

final _baseColor = Colors.tailwind.neutral;
final _defaultBackgroundLight = Colors.white;
final _defaultSurfaceLight = _baseColor.shade100.darken(2);
final _defaultOutlineLight = _baseColor.shade100;
final _defaultBackgroundDark = _baseColor.shade950;
final _defaultSurfaceDark = _baseColor.shade800;
final _defaultOutlineDark = _baseColor.shade900;
final _defaultPrimary = Colors.tailwind.violet;
final _defaultSecondary = _defaultPrimary.shade300;
final _defaultTertiaryLight = Colors.tailwind.grey.shade950;
final _defaultTertiaryDark = Colors.tailwind.grey.shade50;
final _defaultError = Colors.tailwind.red;
final _defaultWarning = Colors.tailwind.amber;
final _defaultSuccess = Colors.tailwind.green;
final _defaultBarrier = Colors.black.withOpacity(0.8);

///
abstract class Theme {
  ///
  String get id;

  ///
  ColorScheme get colorScheme;

  ///
  bool get isDark => colorScheme.isDark;

  ///
  bool get isLight => colorScheme.isLight;

  ///
  static Theme of(BuildContext context) {
    return ThemeProvider.of(context)?.theme ?? themes.first;
  }
}

///
class ColorScheme {
  ///
  const ColorScheme._({
    required this.brightness,
    required this.background,
    required this.surface,
    required this.outline,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.error,
    required this.warning,
    required this.success,
    required this.barrier,
  });

  ///
  factory ColorScheme.light({
    Color? background,
    Color? surface,
    Color? outline,
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? warning,
    Color? success,
    Color? barrier,
  }) {
    return ColorScheme._(
      brightness: Brightness.light,
      background: background ?? _defaultBackgroundLight,
      surface: surface ?? _defaultSurfaceLight,
      outline: outline ?? _defaultOutlineLight,
      primary: primary ?? _defaultPrimary,
      secondary: secondary ?? _defaultSecondary,
      tertiary: tertiary ?? _defaultTertiaryLight,
      error: error ?? _defaultError,
      warning: warning ?? _defaultWarning,
      success: success ?? _defaultSuccess,
      barrier: barrier ?? _defaultBarrier,
    );
  }

  ///
  factory ColorScheme.dark({
    Color? background,
    Color? surface,
    Color? outline,
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? warning,
    Color? success,
    Color? barrier,
  }) {
    return ColorScheme._(
      brightness: Brightness.dark,
      background: background ?? _defaultBackgroundDark,
      surface: surface ?? _defaultSurfaceDark,
      outline: outline ?? _defaultOutlineDark,
      primary: primary ?? _defaultPrimary,
      secondary: secondary ?? _defaultSecondary,
      tertiary: tertiary ?? _defaultTertiaryDark,
      error: error ?? _defaultError,
      warning: warning ?? _defaultWarning,
      success: success ?? _defaultSuccess,
      barrier: barrier ?? _defaultBarrier,
    );
  }

  ///
  final Brightness brightness;

  ///
  final Color primary;

  ///
  final Color secondary;

  ///
  final Color tertiary;

  ///
  final Color surface;

  ///
  final Color background;

  ///
  final Color outline;

  ///
  final Color success;

  ///
  final Color error;

  ///
  final Color warning;

  ///
  final Color barrier;

  ///
  bool get isLight => brightness == Brightness.light;

  ///
  bool get isDark => brightness == Brightness.dark;

  ///
  Color adaptive(
    Color light, {
    required Color dark,
  }) {
    return isLight ? light : dark;
  }
}

///
extension ThemesX on BuildContext {
  ///
  Theme get theme => Theme.of(this);

  ///
  ColorScheme get color => theme.colorScheme;
}
