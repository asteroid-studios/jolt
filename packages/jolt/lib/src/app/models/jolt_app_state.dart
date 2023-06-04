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
    this.textScaleFactorMultiplier = 1.0,
    this.spacingScaleFactorMultiplier = 1.0,
  });

  ///
  final ThemeData theme;

  /// The list of themes.
  final List<ThemeData> themes;

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
  final double textScaleFactorMultiplier;

  /// The spacing scale factor multiplier.
  final double spacingScaleFactorMultiplier;

  /// Copy with
  JoltAppState copyWith({
    ThemeData? theme,
    List<ThemeData>? themes,
    List<Locale>? supportedLocales,
    Color? primaryColor,
    Locale? locale,
    ThemeMode? themeMode,
    bool? highContrast,
    double? textScaleFactorMultiplier,
    double? spacingScaleFactorMultiplier,
  }) {
    return JoltAppState(
      theme: theme ?? this.theme,
      themes: themes ?? this.themes,
      supportedLocales: supportedLocales ?? this.supportedLocales,
      primaryColor: primaryColor ?? this.primaryColor,
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      highContrast: highContrast ?? this.highContrast,
      textScaleFactorMultiplier:
          textScaleFactorMultiplier ?? this.textScaleFactorMultiplier,
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
          supportedLocales == other.supportedLocales &&
          primaryColor == other.primaryColor &&
          locale == other.locale &&
          themeMode == other.themeMode &&
          highContrast == other.highContrast &&
          textScaleFactorMultiplier == other.textScaleFactorMultiplier &&
          spacingScaleFactorMultiplier == other.spacingScaleFactorMultiplier;

  /// Hash code
  @override
  int get hashCode =>
      theme.hashCode ^
      themes.hashCode ^
      supportedLocales.hashCode ^
      primaryColor.hashCode ^
      locale.hashCode ^
      themeMode.hashCode ^
      highContrast.hashCode ^
      textScaleFactorMultiplier.hashCode ^
      spacingScaleFactorMultiplier.hashCode;
}
