import 'package:flutter/cupertino.dart' show DefaultCupertinoLocalizations;
import 'package:flutter/material.dart'
    show DefaultMaterialLocalizations, MaterialPageRoute;

import 'package:jolt/jolt.dart';

/// The Jolt app.
class JoltApp extends StatefulWidget {
  /// The Jolt app.
  const JoltApp({
    required this.child,
    this.title,
    this.navigatorObservers,
    this.debugShowCheckedModeBanner = true,
    this.themes,
    this.widgetTheme,
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
    this.widgetTheme,
    super.key,
  })  : child = null,
        navigatorObservers = null;

  /// {@macro flutter.widgets.widgetsApp.title}
  final String? title;

  /// Styling for all Jolt widgets.
  final WidgetThemeData Function(ThemeData)? widgetTheme;

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
  State<JoltApp> createState() => _JoltAppState();
}

class _JoltAppState extends State<JoltApp> with WidgetsBindingObserver {
  late JoltAppController controller;

  @override
  void initState() {
    controller = JoltAppController(
      window: WidgetsBinding.instance.window,
      themes: widget.themes ??
          [
            ThemeData(
              id: 'default_light',
              colorScheme: ColorScheme.light(),
            ),
            ThemeData(
              id: 'default_dark',
              colorScheme: ColorScheme.dark(),
            ),
          ],
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizationsDelegates = [
      DefaultMaterialLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ];

    return MediaQuery.fromWindow(
      child: ValueListenableBuilder<ThemeData>(
        valueListenable: controller,
        child: widget.child,
        builder: (BuildContext context, ThemeData theme, Widget? child) {
          final usesRouter =
              widget.routerDelegate != null || widget.routerConfig != null;
          final app = usesRouter
              ? WidgetsApp.router(
                  color: theme.colorScheme.primary,
                  title: widget.title ?? '',
                  debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
                  localizationsDelegates: localizationsDelegates,
                  routerConfig: widget.routerConfig,
                  useInheritedMediaQuery: true,
                  routeInformationProvider: widget.routeInformationProvider,
                  routeInformationParser: widget.routeInformationParser,
                  routerDelegate: widget.routerDelegate,
                  backButtonDispatcher: widget.backButtonDispatcher,
                )
              : WidgetsApp(
                  color: theme.colorScheme.primary,
                  home: child,
                  title: widget.title ?? '',
                  useInheritedMediaQuery: true,
                  localizationsDelegates: localizationsDelegates,
                  debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
                  navigatorObservers: widget.navigatorObservers ?? [],
                  pageRouteBuilder:
                      <T>(RouteSettings settings, WidgetBuilder builder) {
                    return MaterialPageRoute<T>(
                        settings: settings, builder: builder);
                  },
                );
          return _JoltInherited(
            controller: controller,
            child: Themes(
              theme: theme,
              scaling: ScalingData(
                spacingScale: controller.spacingScaleFactorMultiplier,
                textScale: controller.textScaleFactorMultiplier,
              ),
              widgetTheme: widget.widgetTheme,
              child: app,
            ),
          );
        },
      ),
    );
  }
}

// The inherited widget for JoltApp to make it's methods available
// to all children below
class _JoltInherited extends InheritedWidget {
  const _JoltInherited({
    required this.controller,
    required super.child,
  });

  final JoltAppController controller;

  static _JoltInherited of(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<_JoltInherited>();
    if (inherited == null) throw Exception('JoltApp not found');
    return inherited;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

///
extension JoltControllerExtension on BuildContext {
  /// The JoltAppController.
  JoltAppController get jolt => _JoltInherited.of(this).controller;
}
