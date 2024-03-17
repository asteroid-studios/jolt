import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:jolt_copy/jolt.dart';
export 'package:jolt_copy/src/app/models/jolt_app_state.dart';

/// Control the JoltApp
/// Eg:
/// - Set the theme
class JoltAppController extends ValueNotifier<JoltAppState> {
  ///
  JoltAppController({
    required List<Theme> themes,
    required PlatformDispatcher platformDispatcher,
    List<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    Breakpoints breakpoints = const Breakpoints(),
    Locale? locale,
  }) : super(
          // Init state
          JoltAppState(
            themes: themes,
            breakpoints: breakpoints,
            supportedLocales: supportedLocales,
            theme: themes.first,
            primaryColor: themes.first.colorScheme.primary,
            themeMode: ThemeMode.system,
            highContrast: themes.first.colorScheme.highContrast,
            locale: locale ?? supportedLocales.first,
          ),
        ) {
    // Init platform brightness
    _platformBrightness = platformDispatcher.platformBrightness;
    platformDispatcher.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      _platformBrightness = platformDispatcher.platformBrightness;
      _refreshTheme();
    };
    _initFromStorage();
  }

  void _initFromStorage() {
    // Initialise locale
    final savedLocale = _joltPrefs
        .get(
          _JoltPreferences.locale.name,
          defaultValue: value.locale.toLanguageTag(),
        )
        .toString();
    final locale = value.supportedLocales.firstWhereOrNull(
      (l) => l.toLanguageTag() == savedLocale,
    );
    // Initialise theme mode
    final themeMode = ThemeMode.values.byName(
      _joltPrefs
          .get(
            _JoltPreferences.themeMode.name,
            defaultValue: ThemeMode.system.name,
          )
          .toString(),
    );
    // Initialise high contrast
    final highContrast = _joltPrefs.get(
      _JoltPreferences.highContrast.name,
      defaultValue: false,
    ) as bool;
    // Initialise primary color
    final primaryColorValue = _joltPrefs.get(
      _JoltPreferences.primaryColor.name,
    ) as int?;
    final primaryColor =
        primaryColorValue != null ? Color(primaryColorValue) : null;
    // Initialise text scale factor
    final symbolScaleFactorMultiplier = _joltPrefs.get(
      _JoltPreferences.symbolScale.name,
      defaultValue: 1.0,
    ) as double;
    // Initialise spacing scale factor
    final spacingScaleFactorMultiplier = _joltPrefs.get(
      _JoltPreferences.spacingScale.name,
      defaultValue: 1.0,
    ) as double;
    // Update the app state
    value = value.copyWith(
      locale: locale,
      themeMode: themeMode,
      highContrast: highContrast,
      primaryColor: primaryColor,
      symbolScaleFactorMultiplier: symbolScaleFactorMultiplier,
      spacingScaleFactorMultiplier: spacingScaleFactorMultiplier,
    );
    _refreshTheme();
  }

  void _refreshTheme() {
    // Get the new theme
    final newTheme = value.themes.firstWhereOrNull(
          (theme) {
            final colorScheme = theme.colorScheme;
            return colorScheme.brightness == _brightnessFromThemeMode() &&
                colorScheme.highContrast == value.highContrast &&
                colorScheme.primary.value == value.primaryColor.value;
          },
        ) ??
        value.themes.firstWhereOrNull(
          (theme) {
            final colorScheme = theme.colorScheme;
            return colorScheme.brightness == _brightnessFromThemeMode() &&
                colorScheme.highContrast == value.highContrast;
          },
        ) ??
        value.themes.firstWhereOrNull(
          (theme) => theme.colorScheme.brightness == _brightnessFromThemeMode(),
        ) ??
        value.themes.first;
    value = value.copyWith(theme: newTheme);
    notifyListeners();
  }

  Brightness _brightnessFromThemeMode() {
    switch (value.themeMode) {
      case ThemeMode.system:
        return _platformBrightness;
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
    }
  }

  /// Change the locale.
  //  TODO support using device locale
  void setLocale(Locale locale) {
    if (value.supportedLocales.firstWhereOrNull(
          (l) => l.toLanguageTag() == locale.toLanguageTag(),
        ) !=
        null) {
      value = value.copyWith(locale: locale);
      _save(_JoltPreferences.locale, locale.toLanguageTag());
      notifyListeners();
    }
  }

  /// Change the theme.
  void setTheme(ThemeMode mode, {bool? withHighContrast}) {
    value = value.copyWith(themeMode: mode);
    _save(_JoltPreferences.themeMode, mode.name);
    if (withHighContrast != null) {
      value = value.copyWith(highContrast: withHighContrast);
      _save(_JoltPreferences.highContrast, withHighContrast);
    }
    _refreshTheme();
  }

  /// Change the primary color.
  void setPrimaryColor(Color color) {
    value = value.copyWith(primaryColor: color);
    _save(_JoltPreferences.primaryColor, color.value);
    _refreshTheme();
  }

  /// Change the text scale factor multiplier.
  void setSymbolScaleFactorMultiplier(double multiplier) {
    value = value.copyWith(symbolScaleFactorMultiplier: multiplier);
    _save(_JoltPreferences.symbolScale, multiplier);
    notifyListeners();
  }

  /// Change the text scale factor multiplier.
  void setSpacingScaleFactorMultiplier(double multiplier) {
    value = value.copyWith(spacingScaleFactorMultiplier: multiplier);
    _save(_JoltPreferences.spacingScale, multiplier);
    notifyListeners();
  }

  // The current platform brightness.
  late Brightness _platformBrightness;

  Box<dynamic> get _joltPrefs => Hive.box<dynamic>(Jolt.storageKey);

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
  symbolScale,
  spacingScale,
}
