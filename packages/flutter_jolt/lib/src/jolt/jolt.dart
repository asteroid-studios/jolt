import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_theme_extensions.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';
import 'package:flutter_jolt/src/models/icons/icons.dart';
import 'package:flutter_jolt/src/models/theme/text_scale.dart';
import 'package:flutter_jolt/src/utils/local_storage.dart';
import 'package:flutter_jolt/src/widgets/jolt/device_info.dart';
import 'package:flutter_jolt/src/models/theme/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// The base Jolt widget which should wrap your [MaterialApp]/[CupertinoApp]
class Jolt extends StatefulWidget {
  /// Return your [MaterialApp]/[CupertinoApp] inside of this builder
  final Widget Function(BuildContext) builder;

  final JoltThemeExtensions? themeExtensions;

  /// Pass all the available themes for your app.
  final List<ThemeData>? themes;

  // TODO maybe these should just be part of the theme extensions for each one
  /// Pass overrides for the icons used by Jolt Widgets
  final IconOverrides? iconOverrides;

  /// Override the default TextScale for your app
  final TextScale textScale;

  const Jolt({
    required this.builder,
    this.textScale = TextScale.medium,
    this.themes,
    this.themeExtensions,
    this.iconOverrides,
    Key? key,
  })  :
        // Make sure themes is not an empty array
        assert((themes?.length ?? 1) > 0),
        super(key: key);

  @override
  State<Jolt> createState() => JoltState();
}

class JoltState extends State<Jolt> with WidgetsBindingObserver {
  @override
  void initState() {
    iconOverrides = widget.iconOverrides ?? IconOverrides();
    _initialisePlatformBrightness();
    _initialiseThemes();
    _initialiseTextScale();
    _initialisePackageInfo();
    _initialiseDeviceInfo();
    super.initState();
  }

  void _initialisePlatformBrightness() {
    final window = WidgetsBinding.instance.window;
    platformBrightness = window.platformBrightness;
    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      platformBrightness = window.platformBrightness;
      _refreshTheme();
    };
  }

  void _initialisePackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  void _initialiseDeviceInfo() async {
    deviceId = await getDeviceID();
  }

  void _initialiseThemes() {
    // Assign the available themes
    themeMode = ThemeMode.values.maybeByName(_joltPrefs.get('themeMode')) ??
        ThemeMode.system;
    themes = widget.themes ?? defaultThemes;
    // Copy all the extra info needed to each theme
    for (int i = 0; i < themes.length; i++) {
      if (widget.themeExtensions != null) {
        themes[i] = (widget.themeExtensions ?? const JoltThemeExtensions())
            .themeFromExtensions(themes[i]);
      }
    }
    _refreshTheme();
  }

  void _initialiseTextScale() {
    final storedValue = _joltPrefs.get('textScale').toString();
    textScale = TextScale.values.maybeByName(storedValue) ?? widget.textScale;
  }

  /// Set the current textScale
  void setTextScale(TextScale newTextScale) {
    setState(() {
      textScale = newTextScale;
    });
    _joltPrefs.put('textScale', newTextScale.name);
  }

  void setTheme(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
    _joltPrefs.put('themeMode', mode.name);
    _refreshTheme();
  }

  void _refreshTheme() {
    setState(() {
      themeData = themes.firstWhere(
          (theme) => theme.brightness == _brightnessFromThemeMode());
    });
  }

  Brightness _brightnessFromThemeMode() {
    switch (themeMode) {
      case ThemeMode.system:
        return platformBrightness;
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _JoltInherited(
      state: this,
      child: Theme(
        data: themeData,
        child: Builder(
          builder: widget.builder,
        ),
      ),
    );
  }

  String? deviceId;
  PackageInfo? packageInfo;

  late List<ThemeData> themes;
  late ThemeData themeData;
  late ThemeMode themeMode;
  late TextScale textScale;
  late IconOverrides iconOverrides;
  late Brightness platformBrightness;

  final _joltPrefs = Hive.box(joltStorageKey);

  /// A static method to make the jolt app state accessible
  static JoltState of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<_JoltInherited>()
              as _JoltInherited)
          .state;
}

// The inherited widget for JoltApp to make it's data available to all children below
class _JoltInherited extends InheritedWidget {
  const _JoltInherited({Key? key, required Widget child, required this.state})
      : super(key: key, child: child);
  final JoltState state;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

const defaultJoltColor = Color(0xFF24b47f);

final defaultThemes = [
  ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: defaultJoltColor,
      brightness: Brightness.light,
    ),
  ),
  ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: defaultJoltColor,
      brightness: Brightness.dark,
    ),
  ),
];
