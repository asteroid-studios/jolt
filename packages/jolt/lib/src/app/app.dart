import 'package:flutter/cupertino.dart' show DefaultCupertinoLocalizations;
import 'package:flutter/material.dart' show DefaultMaterialLocalizations;
import 'package:flutter/widgets.dart';

import 'package:jolt/jolt.dart';

final _defaultThemes = [
  ThemeData(
    id: 'default_light',
    colorScheme: ColorScheme.light(),
  ),
  ThemeData(
    id: 'default_dark',
    colorScheme: ColorScheme.dark(),
  ),
];

/// The Jolt app.
class JoltApp extends StatefulWidget {
  /// The Jolt app.
  const JoltApp({
    required this.child,
    this.title,
    this.navigatorObservers,
    this.debugShowCheckedModeBanner = true,
    this.themes,
    super.key,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        routerConfig = null,
        backButtonDispatcher = null;

  /// The Jolt app.
  const JoltApp.router({
    this.title,
    this.routeInformationProvider,
    this.debugShowCheckedModeBanner = true,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.themes,
    super.key,
  })  : child = null,
        navigatorObservers = null;

  /// {@macro flutter.widgets.widgetsApp.title}
  final String? title;

  /// {@macro flutter.widgets.widgetsApp.debugShowCheckedModeBanner}
  final bool debugShowCheckedModeBanner;

  /// {@macro flutter.widgets.widgetsApp.navigatorObservers}
  final List<NavigatorObserver>? navigatorObservers;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// Pass your app's widget here.
  final Widget? child;

  /// The themes to use for the app
  final List<ThemeData>? themes;

  @override
  State<JoltApp> createState() => JoltAppState();
}

class JoltAppState extends State<JoltApp> with WidgetsBindingObserver {
  bool get _usesRouter =>
      widget.routerDelegate != null || widget.routerConfig != null;

  @override
  void initState() {
    _initialisePlatformBrightness();
    _initialiseThemes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizationsDelegates = [
      DefaultMaterialLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ];

    final app = _usesRouter
        ? WidgetsApp.router(
            color: theme.colorScheme.primary,
            title: widget.title ?? '',
            debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
            localizationsDelegates: localizationsDelegates,
            routerConfig: widget.routerConfig,
            routeInformationProvider: widget.routeInformationProvider,
            routeInformationParser: widget.routeInformationParser,
            routerDelegate: widget.routerDelegate,
            backButtonDispatcher: widget.backButtonDispatcher,
          )
        : WidgetsApp(
            color: theme.colorScheme.primary,
            home: widget.child,
            title: widget.title ?? '',
            localizationsDelegates: localizationsDelegates,
            debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
            navigatorObservers: widget.navigatorObservers ?? [],
          );

    return _JoltInherited(
      state: this,
      child: Theme(
        data: theme,
        child: app,
      ),
    );
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

  void _initialiseThemes() {
    // Assign the available themes
    themeMode =
        // ThemeMode.values.maybeByName(_joltPrefs.get(themeModeKey)) ??
        ThemeMode.system;
    themes = widget.themes ?? _defaultThemes;
    // // Copy all the extra info needed to each theme
    // for (int i = 0; i < themes.length; i++) {
    //   if (widget.themeExtensions != null) {
    //     themes[i] = (widget.themeExtensions ?? const JoltThemeExtensions())
    //         .themeFromExtensions(themes[i]);
    //   }
    // }
    _refreshTheme();
  }

  void setTheme(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
    // _joltPrefs.put(themeModeKey, mode.name);
    _refreshTheme();
  }

  void _refreshTheme() {
    setState(() {
      theme = themes.firstWhere(
        (theme) => theme.colorScheme.brightness == _brightnessFromThemeMode(),
      );
    });
  }

  late List<ThemeData> themes;
  late ThemeData theme;
  late ThemeMode themeMode;
  // late UIScale uiScale;
  late Brightness platformBrightness;

  // final _joltPrefs = Hive.box(joltStorageKey);

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

  /// A static method to make the jolt app state accessible
  static JoltAppState of(BuildContext context) {
    final joltInherited =
        context.dependOnInheritedWidgetOfExactType<_JoltInherited>();
    if (joltInherited == null) throw Exception('JoltApp not found');
    return joltInherited.state;
  }
}

// The inherited widget for JoltApp to make it's data available to all children below
class _JoltInherited extends InheritedWidget {
  const _JoltInherited({
    required this.state,
    required super.child,
  });

  final JoltAppState state;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      false; // TODO check
}
