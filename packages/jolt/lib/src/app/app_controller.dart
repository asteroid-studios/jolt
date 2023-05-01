import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jolt/jolt.dart';

/// The Hive key for storing Jolt preferences.
const joltStorageKey = 'joltPreferences';

/// Control the JoltApp
/// Eg:
/// - Set the theme
class JoltAppController extends ValueNotifier<ThemeData> {
  ///
  JoltAppController({
    required this.themes,
    required SingletonFlutterWindow window,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    Locale? locale,
  }) : super(themes.first) {
    // Initialise locale
    final defaultLocale = locale ?? supportedLocales.first;
    final savedLocale = _joltPrefs
        .get(
          _JoltPreferences.locale.name,
          defaultValue: defaultLocale.toLanguageTag(),
        )
        .toString();
    this.locale = supportedLocales.firstWhere(
      (l) => l.toLanguageTag() == savedLocale,
    );
    // Initialise theme mode
    themeMode = ThemeMode.values.byName(
      _joltPrefs
          .get(
            _JoltPreferences.themeMode.name,
            defaultValue: ThemeMode.system.name,
          )
          .toString(),
    );
    // Initialise high contrast
    highContrast = _joltPrefs.get(
      _JoltPreferences.highContrast.name,
      defaultValue: false,
    ) as bool;
    // Initialise primary color
    final primaryColorValue = _joltPrefs.get(
      _JoltPreferences.primaryColor.name,
    ) as int?;
    primaryColor = primaryColorValue != null ? Color(primaryColorValue) : null;
    // Initialise text scale factor
    textScaleFactorMultiplier = _joltPrefs.get(
      _JoltPreferences.textScale.name,
      defaultValue: 1.0,
    ) as double;
    // Initialise spacing scale factor
    spacingScaleFactorMultiplier = _joltPrefs.get(
      _JoltPreferences.spacingScale.name,
      defaultValue: 1.0,
    ) as double;
    // Init platform brightness
    _platformBrightness = window.platformBrightness;
    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      _platformBrightness = window.platformBrightness;
      _refreshTheme();
    };
    _refreshTheme();
  }

  void _refreshTheme() {
    // Get the new theme
    value = themes.firstWhereOrNull(
          (theme) {
            final colorScheme = theme.colorScheme;
            return colorScheme.brightness == _brightnessFromThemeMode() &&
                colorScheme.highContrast == highContrast &&
                colorScheme.primary.value == primaryColor?.value;
          },
        ) ??
        themes.firstWhereOrNull(
          (theme) {
            final colorScheme = theme.colorScheme;
            return colorScheme.brightness == _brightnessFromThemeMode() &&
                colorScheme.highContrast == highContrast;
          },
        ) ??
        themes.firstWhereOrNull(
          (theme) => theme.colorScheme.brightness == _brightnessFromThemeMode(),
        ) ??
        themes.first;
    notifyListeners();
  }

  Brightness _brightnessFromThemeMode() {
    switch (themeMode) {
      case ThemeMode.system:
        return _platformBrightness;
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
    }
  }

  /// Change the locale.
  void setLocale(Locale locale) {
    if (supportedLocales.firstWhereOrNull(
          (l) => l.toLanguageTag() == locale.toLanguageTag(),
        ) !=
        null) {
      this.locale = locale;
      _save(_JoltPreferences.locale, locale.toLanguageTag());
      notifyListeners();
    }
  }

  /// Change the theme.
  void setTheme(ThemeMode mode, {bool? withHighContrast}) {
    themeMode = mode;
    _save(_JoltPreferences.themeMode, themeMode.name);
    if (withHighContrast != null) {
      highContrast = withHighContrast;
      _save(_JoltPreferences.highContrast, highContrast);
    }
    _refreshTheme();
  }

  /// Change the primary color.
  void setPrimaryColor(Color color) {
    primaryColor = color;
    _save(_JoltPreferences.primaryColor, primaryColor?.value);
    _refreshTheme();
  }

  /// Change the text scale factor multiplier.
  void setTextScaleFactorMultiplier(double value) {
    textScaleFactorMultiplier = value;
    _save(_JoltPreferences.textScale, textScaleFactorMultiplier);
    notifyListeners();
  }

  /// Change the text scale factor multiplier.
  void setSpacingScaleFactorMultiplier(double value) {
    spacingScaleFactorMultiplier = value;
    _save(_JoltPreferences.spacingScale, spacingScaleFactorMultiplier);
    notifyListeners();
  }

  /// The list of themes.
  final List<ThemeData> themes;

  /// The list of supported locales.
  final List<Locale> supportedLocales;

  /// The current primary color.
  Color? primaryColor;

  /// The current locale;
  late Locale locale;

  /// The current theme mode.
  late ThemeMode themeMode;

  /// If the user has selected the high contrast theme option
  late bool highContrast;

  // The current platform brightness.
  late Brightness _platformBrightness;

  final _joltPrefs = Hive.box(joltStorageKey);

  /// The text scale factor multiplier.
  late double textScaleFactorMultiplier;

  /// The spacing scale factor multiplier.
  late double spacingScaleFactorMultiplier;

  // Save preferences to Hive.
  Future<void> _save(_JoltPreferences option, dynamic value) async {
    await _joltPrefs.put(option.name, value);
  }
}

enum _JoltPreferences {
  themeMode,
  locale,
  highContrast,
  primaryColor,
  textScale,
  spacingScale,
}
