import 'package:jolt/jolt.dart';

///
@immutable
class JoltAppState {
  ///
  const JoltAppState({
    required this.locale,
    required this.supportedLocales,
    required this.theme,
    required this.themes,
    required this.themeMode,
    required this.highContrast,
    required this.primaryColor,
    required this.breakpoints,
    this.symbolScaleFactorMultiplier = 1.0,
    this.spacingScaleFactorMultiplier = 1.0,
  });

  ///
  final Theme theme;

  /// The breakpoints for the app
  final Breakpoints breakpoints;

  /// The list of themes.
  final List<Theme> themes;

  /// The list of supported locales.
  final List<Locale> supportedLocales;

  /// The current primary color.
  final Color primaryColor;

  /// The current locale;
  final Locale locale;

  /// The current theme mode.
  final ThemeMode themeMode;

  /// If the user has selected the high contrast theme option
  final bool highContrast;

  /// The text scale factor multiplier.
  final double symbolScaleFactorMultiplier;

  /// The spacing scale factor multiplier.
  final double spacingScaleFactorMultiplier;

  /// Copy with
  JoltAppState copyWith({
    Theme? theme,
    List<Theme>? themes,
    Breakpoints? breakpoints,
    List<Locale>? supportedLocales,
    Color? primaryColor,
    Locale? locale,
    ThemeMode? themeMode,
    bool? highContrast,
    double? symbolScaleFactorMultiplier,
    double? spacingScaleFactorMultiplier,
  }) {
    return JoltAppState(
      theme: theme ?? this.theme,
      themes: themes ?? this.themes,
      breakpoints: breakpoints ?? this.breakpoints,
      supportedLocales: supportedLocales ?? this.supportedLocales,
      primaryColor: primaryColor ?? this.primaryColor,
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      highContrast: highContrast ?? this.highContrast,
      symbolScaleFactorMultiplier:
          symbolScaleFactorMultiplier ?? this.symbolScaleFactorMultiplier,
      spacingScaleFactorMultiplier:
          spacingScaleFactorMultiplier ?? this.spacingScaleFactorMultiplier,
    );
  }

  /// Equality operator
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JoltAppState &&
          runtimeType == other.runtimeType &&
          theme == other.theme &&
          themes == other.themes &&
          breakpoints == other.breakpoints &&
          supportedLocales == other.supportedLocales &&
          primaryColor == other.primaryColor &&
          locale == other.locale &&
          themeMode == other.themeMode &&
          highContrast == other.highContrast &&
          symbolScaleFactorMultiplier == other.symbolScaleFactorMultiplier &&
          spacingScaleFactorMultiplier == other.spacingScaleFactorMultiplier;

  /// Hash code
  @override
  int get hashCode =>
      theme.hashCode ^
      breakpoints.hashCode ^
      themes.hashCode ^
      supportedLocales.hashCode ^
      primaryColor.hashCode ^
      locale.hashCode ^
      themeMode.hashCode ^
      highContrast.hashCode ^
      symbolScaleFactorMultiplier.hashCode ^
      spacingScaleFactorMultiplier.hashCode;
}
