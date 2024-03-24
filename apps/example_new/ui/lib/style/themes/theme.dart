import 'package:ui/ui.dart';

final _defaultBackgroundLight = Colors.grey.shade50;
final _defaultSurfaceLight = Colors.grey.shade100;
final _defaultBackgroundDark = Colors.grey.shade950;
final _defaultSurfaceDark = Colors.grey.shade900;
const _defaultPrimary = Colors.violet;
final _defaultSecondary = Colors.violet.shade300;
final _defaultTertiaryLight = Colors.grey.shade950;
final _defaultTertiaryDark = Colors.grey.shade50;
const _defaultError = Colors.red;
const _defaultWarning = Colors.amber;
const _defaultSuccess = Colors.emerald;

///
abstract class Theme extends BaseTheme {
  ///
  ColorScheme get colorScheme;
}

///
mixin ThemeValues on Object {
  ///
  Theme get theme => ThemeProvider.theme;

  ///
  ColorScheme get color => theme.colorScheme;

  ///
  Typography get text => const Typography();
}

///
class ColorScheme {
  ///
  const ColorScheme._({
    required this.brightness,
    required this.background,
    required this.surface,
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
