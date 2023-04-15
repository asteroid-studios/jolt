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
  }) : super(themes.first) {
    themeMode = ThemeMode.system;
    _platformBrightness = window.platformBrightness;
    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      _platformBrightness = window.platformBrightness;
      _refreshTheme();
    };
    _refreshTheme();
  }

  void _refreshTheme() {
    final theme = themes.firstWhereOrNull(
          (theme) => theme.colorScheme.brightness == _brightnessFromThemeMode(),
        ) ??
        themes.first;
    value = theme;
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

  /// Change the theme.
  void setTheme(ThemeMode mode) {
    themeMode = mode;
    _refreshTheme();
  }

  /// The list of themes.
  final List<ThemeData> themes;

  /// The current theme mode.
  late ThemeMode themeMode;
  late Brightness _platformBrightness;
  final _joltPrefs = Hive.box(joltStorageKey);
}
