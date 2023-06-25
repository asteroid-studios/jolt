import 'package:flutter/material.dart' as m
    show ColorScheme, MaterialPageRoute, Theme, ThemeData;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portal/flutter_portal.dart';

import 'package:jolt/jolt.dart';

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
    this.breakpoints,
    this.builder,
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
    this.breakpoints,
    this.builder,
    super.key,
  })  : child = null,
        navigatorObservers = null;

  /// {@macro flutter.widgets.widgetsApp.title}
  final String? title;

  /// Define the breakpoints for the app
  final BreakpointsData? breakpoints;

  /// Styling for all Jolt widgets.
  final WidgetTheme Function(BuildContext)? widgetTheme;

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
  final List<Theme>? themes;

  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale? locale;

  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  final List<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// {@macro flutter.widgets.widgetsApp.builder}
  final Widget Function(BuildContext, Widget?)? builder;

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
      breakpoints: widget.breakpoints ?? const BreakpointsData(),
      locale: widget.locale,
      supportedLocales: widget.supportedLocales,
      platformDispatcher: WidgetsBinding.instance.platformDispatcher,
      themes: widget.themes ?? _defaultThemes,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void popFocus() {
    final primaryFocus = FocusManager.instance.primaryFocus;
    final enclosingScope = primaryFocus?.enclosingScope;
    // This logic is to make sure the wrong focus scope isn't popped
    if (enclosingScope != null &&
        enclosingScope.debugLabel != 'Root Focus Scope') {
      primaryFocus!.unfocus();
    }
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
    Widget wrapChild(Widget? child) {
      return GestureDetector(
        onTap: popFocus,
        child: widget.builder?.call(context, child) ??
            child ??
            const SizedBox.shrink(),
      );
    }

    return ValueListenableBuilder<JoltAppState>(
      valueListenable: controller,
      child: widget.child,
      builder: (BuildContext context, JoltAppState state, Widget? child) {
        final usesRouter =
            widget.routerDelegate != null || widget.routerConfig != null;

        final app = usesRouter
            ? WidgetsApp.router(
                color: state.theme.colorScheme.primary,
                title: widget.title ?? '',
                debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
                locale: state.locale,
                supportedLocales: widget.supportedLocales,
                localizationsDelegates: _localizationsDelegates,
                routerConfig: widget.routerConfig,
                routeInformationProvider: widget.routeInformationProvider,
                routeInformationParser: widget.routeInformationParser,
                routerDelegate: widget.routerDelegate,
                backButtonDispatcher: widget.backButtonDispatcher,
                builder: (context, child) => wrapChild(child),
              )
            : WidgetsApp(
                color: state.theme.colorScheme.primary,
                builder: (context, child) => wrapChild(child),
                home: child,
                title: widget.title ?? '',
                locale: state.locale,
                supportedLocales: widget.supportedLocales,
                localizationsDelegates: _localizationsDelegates,
                debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
                navigatorObservers: widget.navigatorObservers ?? [],
                pageRouteBuilder: <T>(
                  RouteSettings settings,
                  WidgetBuilder builder,
                ) {
                  return m.MaterialPageRoute<T>(
                    settings: settings,
                    builder: builder,
                  );
                },
              );

        return Portal(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Localizations(
              locale: state.locale,
              delegates: _localizationsDelegates,
              child: _DefaultStyles(
                theme: state.theme,
                widgetTheme: widget.widgetTheme,
                scaling: Scaling(
                  spacingScale: state.spacingScaleFactorMultiplier,
                  textScale: state.textScaleFactorMultiplier,
                ),
                child: _JoltInherited(
                  controller: controller,
                  child: Overlay(
                    initialEntries: [
                      OverlayEntry(
                        builder: (context) {
                          return OverlayStack(
                            key: joltOverlayKey,
                            child: app,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      controller.value != (oldWidget as _JoltInherited).controller.value;
}

///
extension JoltControllerExtension on BuildContext {
  /// The JoltAppController.
  JoltAppController get jolt => _JoltInherited.of(this).controller;
}

///
class _DefaultStyles extends StatelessWidget {
  ///
  const _DefaultStyles({
    required this.child,
    required this.theme,
    required this.scaling,
    this.widgetTheme,
  });

  ///
  final WidgetTheme Function(BuildContext)? widgetTheme;

  ///
  final Scaling scaling;

  ///
  final Theme theme;

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    m.ThemeData materialThemeData(ColorScheme color) {
      return m.ThemeData(
        scaffoldBackgroundColor: color.background,
        colorScheme: m.ColorScheme(
          brightness: color.brightness,
          primary: color.primary,
          onPrimary: color.primary.foreground,
          secondary: color.secondary,
          onSecondary: color.secondary.foreground,
          surface: color.surface,
          onSurface: color.surface.foreground,
          background: color.background,
          onBackground: color.background.foreground,
          error: color.error,
          onError: color.error.foreground,
        ),
      );
    }

    return DefaultScaling(
      scaling: scaling,
      child: DefaultTheme(
        data: theme,
        // After setting the theme, use a builder
        // to make the theme available below
        child: Builder(
          builder: (context) {
            // Set a material theme for very basic material cupport
            return m.Theme(
              data: materialThemeData(context.color),
              // Set the default Widget theme
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: context.color.background,
                // Set the default Widget theme
                child: DefaultWidgetTheme(
                  data: widgetTheme?.call(context) ??
                      context.inherited.widgetTheme,
                  // Set the default symbol style (Text and Icons)
                  child: DefaultSymbolStyle(
                    style: (context) => context.style.body.copyWith(
                      color: context.color.surface.foreground,
                    ),
                    // Set the default selection style
                    child: DefaultSelectionStyle(
                      cursorColor: context.color.primary,
                      selectionColor: context.color.primary.withOpacity(0.3),
                      child: child,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

final _defaultThemes = [
  Theme(
    id: 'default_light',
    colorScheme: ColorScheme.light(),
  ),
  Theme(
    id: 'default_dark',
    colorScheme: ColorScheme.dark(),
  ),
];
