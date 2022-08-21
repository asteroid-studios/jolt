import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';
import 'package:flutter_jolt/src/models/color/semantic_color.dart';
import 'package:flutter_jolt/src/models/icons/icons.dart';
import 'package:flutter_jolt/src/models/theme/text_scale.dart';
import 'package:flutter_jolt/src/models/theme/theme_type.dart';
import 'package:flutter_jolt/src/widgets/jolt/device_info.dart';
import 'package:flutter_jolt/src/models/theme/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// The base Jolt widget which should wrap your [MaterialApp]/[CupertinoApp]
class Jolt extends StatefulWidget {
  /// Return your [MaterialApp]/[CupertinoApp] inside of this builder
  final Widget Function(BuildContext) builder;

  /// Pass any theme extensions which should apply to all themes;
  final List<ThemeExtension<dynamic>> Function(ThemeData)? themeExtensions;

  /// Pass all the available themes for your app.
  final List<ThemeData>? themes;

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
  })  : assert((themes?.length ?? 1) > 0),
        super(key: key);

  @override
  State<Jolt> createState() => JoltState();
}

class JoltState extends State<Jolt> with WidgetsBindingObserver {
  /// A static method to make the jolt app state accessable
  static JoltState of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<_JoltInherited>()
              as _JoltInherited)
          .state;

  @override
  void didChangePlatformBrightness() {
    if (themeType == ThemeType.system) {
      // TODO refreshTheme method
      // refreshTheme();
    }
    super.didChangePlatformBrightness();
  }

  @override
  void initState() {
    iconOverrides = widget.iconOverrides ?? IconOverrides();
    _initialiseThemes();
    _initialiseTextScale();
    _initialisePackageInfo();
    _initialiseDeviceInfo();
    super.initState();
  }

  void _initialisePackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  void _initialiseDeviceInfo() async {
    deviceId = await getDeviceID();
  }

  void _initialiseThemes() {
    // Assign the available themes
    themes = widget.themes ?? defaultThemes;
    // Copy all the extra info needed to each theme
    for (int i = 0; i < themes.length; i++) {
      final darkTheme = themes[i].brightness == Brightness.dark;
      themes[i] = themes[i].copyWith(
        // TODO work out how im going to get light and dark into google text themes
        // textTheme: TextTheme(
        // ),
        extensions: [
          darkTheme
              ? SemanticColors.darkDefaults
              : SemanticColors.lightDefaults,
          if (widget.themeExtensions != null)
            ...widget.themeExtensions!(themes[i]),
        ],
      );
    }
    themeData = themes.first; //TODO get theme from local storage
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
    _updateStoredValue('textScale', newTextScale.name);
  }

  void _updateStoredValue(String key, dynamic value) {
    _joltPrefs.put(key, value);
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
  late ThemeType themeType;
  late TextScale textScale;
  late IconOverrides iconOverrides;

  final _joltPrefs = Hive.box('joltDevicePreferences');
}

// The inherited widget for JoltApp to make it's data available to all children below
class _JoltInherited extends InheritedWidget {
  const _JoltInherited({Key? key, required Widget child, required this.state})
      : super(key: key, child: child);
  final JoltState state;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
