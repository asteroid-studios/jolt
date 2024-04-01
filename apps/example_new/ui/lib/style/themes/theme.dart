import 'package:ui/ui.dart';
export 'dart:ui' show Brightness;

final _defaultBackgroundLight = Colors.neutral.shade50;
final _defaultSurfaceLight = Colors.neutral.shade200;
final _defaultOutlineLight = Colors.neutral.shade200;
final _defaultBackgroundDark = Colors.neutral.shade950;
final _defaultSurfaceDark = Colors.neutral.shade900;
final _defaultOutlineDark = Colors.neutral.shade900;
const _defaultPrimary = Colors.violet;
final _defaultSecondary = _defaultPrimary.shade300;
final _defaultTertiaryLight = Colors.neutral.shade950;
final _defaultTertiaryDark = Colors.neutral.shade50;
const _defaultError = Colors.red;
const _defaultWarning = Colors.amber;
const _defaultSuccess = Colors.green;

///
abstract class Theme {
  ///
  String get id;

  ///
  ColorScheme get colorScheme;

  ///
  Typography get typography => const Typography();

  ///
  bool get isDark => colorScheme.isDark;

  ///
  bool get isLight => colorScheme.isLight;

  // TODO add spacing, radius, breakpoints, etc.
}

///
mixin ThemeValues on Object {
  ///
  ColorScheme get color => ThemeProvider.theme.colorScheme;

  ///
  Typography get text => ThemeProvider.theme.typography;

  // TODO add spacing, radius, breakpoints, etc.
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
