import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portal/flutter_portal.dart';

import 'package:jolt/jolt.dart';

export 'package:flutter/material.dart' show MaterialPageRoute;

/// The Jolt app.
class JoltApp extends StatefulWidget {
  /// The Jolt app.
  const JoltApp({
    required this.child,
    this.title,
    this.navigatorObservers,
    this.debugShowCheckedModeBanner = true,
    this.locale,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.localizationsDelegates,
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
    this.locale,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.localizationsDelegates,
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

  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale? locale;

  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  final List<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// {@macro flutter.widgets.widgetsApp.supportedLocales}
  final List<Locale> supportedLocales;

  @override
  State<JoltApp> createState() => _JoltAppState();
}

class _JoltAppState extends State<JoltApp> with WidgetsBindingObserver {
  late JoltAppController controller;

  @override
  void initState() {
    controller = JoltAppController(
      locale: widget.locale,
      supportedLocales: widget.supportedLocales,
      platformDispatcher: WidgetsBinding.instance.platformDispatcher,
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

  void popFocus() {
    // This logic is to make sure
    // the wrong focus scope isn't popped
    final primaryFocus = FocusManager.instance.primaryFocus;
    final deepParent = primaryFocus?.parent?.parent?.parent;
    if (primaryFocus != null &&
        deepParent != null &&
        deepParent.debugLabel != 'Shortcuts') {
      primaryFocus.unfocus();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Combine the Localizations for Material with the ones contributed
  // by the localizationsDelegates parameter, if any. Only the first delegate
  // of a particular LocalizationsDelegate.type is loaded so the
  // localizationsDelegate parameter can be used to override
  // _MaterialLocalizationsDelegate.
  List<LocalizationsDelegate<dynamic>> get _localizationsDelegates {
    return <LocalizationsDelegate<dynamic>>[
      ...?widget.localizationsDelegates,
      // DefaultMaterialLocalizations.delegate,
      // DefaultCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
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
                locale: controller.locale,
                supportedLocales: widget.supportedLocales,
                localizationsDelegates: _localizationsDelegates,
                routerConfig: widget.routerConfig,
                routeInformationProvider: widget.routeInformationProvider,
                routeInformationParser: widget.routeInformationParser,
                routerDelegate: widget.routerDelegate,
                backButtonDispatcher: widget.backButtonDispatcher,
              )
            : WidgetsApp(
                color: theme.colorScheme.primary,
                home: child,
                title: widget.title ?? '',
                locale: controller.locale,
                supportedLocales: widget.supportedLocales,
                localizationsDelegates: _localizationsDelegates,
                debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
                navigatorObservers: widget.navigatorObservers ?? [],
                pageRouteBuilder: <T>(
                  RouteSettings settings,
                  WidgetBuilder builder,
                ) {
                  return MaterialPageRoute<T>(
                    settings: settings,
                    builder: builder,
                  );
                },
              );

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Localizations(
            locale: controller.locale,
            delegates: _localizationsDelegates,
            child: Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (context) {
                    return Portal(
                      child: _JoltInherited(
                        controller: controller,
                        child: Themes(
                          theme: theme,
                          scaling: ScalingData(
                            spacingScale:
                                controller.spacingScaleFactorMultiplier,
                            textScale: controller.textScaleFactorMultiplier,
                          ),
                          widgetTheme: widget.widgetTheme,
                          child: SelectionArea(
                            focusNode: FocusNode(canRequestFocus: false),
                            child: GestureDetector(
                              onTap: popFocus,
                              child: OverlayStack(
                                key: joltOverlayKey,
                                child: app,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
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
