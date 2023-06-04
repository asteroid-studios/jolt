import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:jolt/jolt.dart';
export 'package:jolt/src/app/models/jolt_app_state.dart';

/// The Hive key for storing Jolt preferences.
const joltStorageKey = 'joltPreferences';

/// Control the JoltApp
/// Eg:
/// - Set the theme
class JoltAppController extends ValueNotifier<JoltAppState> {
  ///
  JoltAppController({
    required List<ThemeData> themes,
    required PlatformDispatcher platformDispatcher,
    List<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    Locale? locale,
  }) : super(
          // Init state
          JoltAppState(
            themes: themes,
            supportedLocales: supportedLocales,
            theme: themes.first,
            primaryColor: themes.first.color.primary,
            themeMode: ThemeMode.system,
            highContrast: themes.first.color.highContrast,
            locale: locale ?? supportedLocales.first,
          ),
        ) {
    Future<void>.delayed(Duration.zero, () async {
      await Hive.initFlutter();
      // ignore: inference_failure_on_function_invocation
      await Hive.openBox(joltStorageKey);
      _initFromStorage();
    });
    // Init platform brightness
    _platformBrightness = platformDispatcher.platformBrightness;
    platformDispatcher.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      _platformBrightness = platformDispatcher.platformBrightness;
      _refreshTheme();
    };
  }

  void _initFromStorage() {
    // Initialise locale
    final savedLocale = _joltPrefs
        .get(
          _JoltPreferences.locale.name,
          defaultValue: value.locale.toLanguageTag(),
        )
        .toString();
    final locale = value.supportedLocales.firstWhere(
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
    final textScaleFactorMultiplier = _joltPrefs.get(
      _JoltPreferences.textScale.name,
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
      textScaleFactorMultiplier: textScaleFactorMultiplier,
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
  void setTextScaleFactorMultiplier(double multiplier) {
    value = value.copyWith(textScaleFactorMultiplier: multiplier);
    _save(_JoltPreferences.textScale, multiplier);
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

  Box<dynamic> get _joltPrefs => Hive.box<dynamic>(joltStorageKey);

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
