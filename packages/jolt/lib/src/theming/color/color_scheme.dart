import 'package:jolt/jolt.dart';

export 'dart:ui' show Brightness;

// TODO handle shadow color as well, unless it's just part of SurfaceData

/// The color scheme for the app.
@immutable
class ColorScheme {
  const ColorScheme._({
    required this.brightness,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.surface,
    required this.background,
    required this.neutral,
    required this.info,
    required this.warning,
    required this.error,
    required this.success,
    required this.highContrast,
  });

  ///
  ColorScheme.light({
    JoltColor? primary,
    JoltColor? secondary,
    JoltColor? tertiary,
    JoltColor? background,
    JoltColor? surface,
    JoltColor? neutral,
    JoltColor? error,
    JoltColor? warning,
    JoltColor? info,
    JoltColor? success,
    this.highContrast = false,
    // ignore: avoid_field_initializers_in_const_classes
  })  : brightness = Brightness.light,
        primary = primary ?? Colors.emerald,
        secondary = secondary ?? Colors.violet,
        tertiary = tertiary ?? Colors.black,
        neutral = neutral ?? Colors.slate,
        background = background ??
            (neutral ?? Colors.slate).asBackground(highContrast: highContrast),
        surface = surface ??
            (neutral ?? Colors.slate).asSurface(highContrast: highContrast),
        error = error ?? Colors.red,
        warning = warning ?? Colors.amber,
        info = info ?? Colors.sky,
        success = success ?? Colors.emerald;

  ///
  ColorScheme.dark({
    JoltColor? primary,
    JoltColor? secondary,
    JoltColor? tertiary,
    JoltColor? background,
    JoltColor? surface,
    JoltColor? neutral,
    JoltColor? error,
    JoltColor? warning,
    JoltColor? info,
    JoltColor? success,
    this.highContrast = false,
    // ignore: avoid_field_initializers_in_const_classes
  })  : brightness = Brightness.dark,
        primary = primary ?? Colors.emerald,
        secondary = secondary ?? Colors.violet,
        tertiary = tertiary ?? Colors.white,
        neutral = neutral ?? Colors.slate,
        background = background ??
            (neutral ?? Colors.slate)
                .reversed
                .asBackground(highContrast: highContrast),
        surface = surface ??
            (neutral ?? Colors.slate)
                .reversed
                .asSurface(highContrast: highContrast),
        error = error ?? Colors.red,
        warning = warning ?? Colors.amber,
        info = info ?? Colors.sky,
        success = success ?? Colors.emerald;

  /// Whether to use high contrast colors for background and surface.
  final bool highContrast;

  ///
  final Brightness brightness;

  ///
  final JoltColor primary;

  ///
  final JoltColor secondary;

  ///
  final JoltColor tertiary;

  ///
  final JoltColor surface;

  ///
  final JoltColor background;

  ///
  final JoltColor neutral;

  ///
  final JoltColor info;

  ///
  final JoltColor warning;

  ///
  final JoltColor error;

  ///
  final JoltColor success;

  /// Return a fully transparent color.
  JoltColor get transparent => surface.withOpacity(0);

  ///
  ColorScheme copyWith({
    JoltColor? primary,
    JoltColor? secondary,
    JoltColor? tertiary,
    JoltColor? background,
    JoltColor? surface,
    JoltColor? neutral,
    JoltColor? error,
    JoltColor? warning,
    JoltColor? info,
    JoltColor? success,
    bool? highContrast,
  }) {
    return ColorScheme._(
      brightness: brightness,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      neutral: neutral ?? this.neutral,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      success: success ?? this.success,
      highContrast: highContrast ?? this.highContrast,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ColorScheme &&
        other.highContrast == highContrast &&
        other.brightness == brightness &&
        other.primary == primary &&
        other.secondary == secondary &&
        other.tertiary == tertiary &&
        other.surface == surface &&
        other.background == background &&
        other.neutral == neutral &&
        other.info == info &&
        other.warning == warning &&
        other.error == error &&
        other.success == success;
  }

  @override
  int get hashCode {
    final values = <Object?>[
      highContrast,
      brightness,
      primary,
      secondary,
      tertiary,
      surface,
      background,
      neutral,
      info,
      warning,
      error,
      success,
    ];
    return Object.hashAll(values);
  }

  ///
  bool get isDark => brightness == Brightness.dark;

  ///
  bool get isLight => brightness == Brightness.light;

  /// Return [color] or override with [colorDark] for dark themes.
  ///
  /// If [colorDark] is null, [color] will be used for dark themes.
  ///
  /// Useful when creating reusable widgets that need to adapt to the theme,
  /// especially if they will only have a different dark color sometimes.
  Color? responsive(Color? color, {Color? colorDark}) {
    return isDark ? (colorDark ?? color) : color;
  }
}
