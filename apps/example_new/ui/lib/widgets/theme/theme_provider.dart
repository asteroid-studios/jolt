import 'package:collection/collection.dart';
import 'package:flutter/scheduler.dart';
import 'package:native_storage/native_storage.dart';
import 'package:ui/ui.dart';

///
class ThemeProvider extends StatefulWidget {
  /// You should only use one ThemeProvider per app,
  /// usually near the top of the widget tree
  ///
  /// It is only responsible for refreshing the theme when it changes
  const ThemeProvider({
    required this.builder,
    this.theme,
    super.key,
  });

  ///
  final Widget Function(BuildContext context) builder;

  ///
  final Theme? theme;

  ///
  static ThemeProviderState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_ThemeProviderScope>()
        ?.state;
  }

  ///
  static Brightness get systemBrightness =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  ///
  static Theme get globalTheme => _GlobalThemeProvider.instance.theme;

  @override
  State<ThemeProvider> createState() => ThemeProviderState();
}

const _themeIdKey = 'uiThemeId';
const _useSystemKey = 'uiThemeUseSystem';

///
class ThemeProviderState extends State<ThemeProvider> {
  ///
  late Theme theme;

  ///
  late bool usingSystemTheme;

  late bool _root;

  ///
  bool get isRoot => _root;

  NativeStorage get _storage => NativeStorage();

  @override
  void initState() {
    _root =
        context.getInheritedWidgetOfExactType<_ThemeProviderScope>() == null;
    usingSystemTheme =
        bool.tryParse(_storage.read(_useSystemKey) ?? '') ?? false;
    final themeId = _storage.read(_themeIdKey);
    if (widget.theme != null) {
      theme = widget.theme!;
    } else if (usingSystemTheme || themeId == null) {
      theme = _getSystemTheme();
    } else {
      theme = _getThemeById(themeId);
    }
    if (_root) {
      // Set global theme
      _GlobalThemeProvider.instance.theme = theme;
      // Listen to platform brightness changes
      SchedulerBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
          () => usingSystemTheme ? setSystemTheme() : null;
    }
    super.initState();
  }

  ///
  void setTheme(Theme newTheme) {
    if (_root) {
      _storage
        ..write(_themeIdKey, newTheme.id)
        ..write(_useSystemKey, false.toString());
      _GlobalThemeProvider.instance.theme = newTheme;
      setState(() {
        usingSystemTheme = false;
        theme = newTheme;
      });
      refreshTheme();
    }
  }

  ///
  void setSystemTheme() {
    if (_root) {
      _storage
        ..write(_useSystemKey, true.toString())
        ..delete(_themeIdKey);
      final newTheme = _getSystemTheme();
      _GlobalThemeProvider.instance.theme = newTheme;
      setState(() {
        usingSystemTheme = true;
        theme = newTheme;
      });
      refreshTheme();
    }
  }

  ///
  void toggleTheme() {
    final index = themes.indexOf(theme);
    final newIndex = index == themes.length - 1 ? 0 : index + 1;
    setTheme(themes[newIndex]);
  }

  static Theme _getSystemTheme() {
    return themes.firstWhereOrNull(
          (t) => t.isDark == ThemeProvider.systemBrightness.isDark,
        ) ??
        ThemeProvider.systemBrightness.defaultTheme;
  }

  static Theme _getThemeById(String id) {
    return themes.firstWhereOrNull((t) => t.id == id) ??
        ThemeProvider.systemBrightness.defaultTheme;
  }

  @override
  Widget build(BuildContext context) {
    return _ThemeProviderScope(
      state: this,
      child: Builder(
        builder: (context) => IconTheme(
          data: IconThemeData(
            color: context.color.background.as.foreground,
            size: Fonts.body.fontSize,
          ),
          child: DefaultTextStyle(
            style: Fonts.body.colored(context.color.background.as.foreground),
            child: widget.builder(context),
          ),
        ),
      ),
    );
  }
}

///
class _ThemeProviderScope extends InheritedWidget {
  ///
  const _ThemeProviderScope({
    required this.state,
    required super.child,
  });

  final ThemeProviderState state;

  @override
  bool updateShouldNotify(_ThemeProviderScope oldWidget) => true;
}

///
class _GlobalThemeProvider {
  _GlobalThemeProvider._();

  static final instance = _GlobalThemeProvider._();

  Theme theme = themes.first;
}

extension _ThemeProviderStateX on ThemeProviderState {
  void _rebuildChildren(Element el) {
    el
      ..markNeedsBuild()
      ..visitChildren(_rebuildChildren);
  }

  void refreshTheme() {
    _rebuildChildren(context as Element);
  }
}

extension _DefaultThemeX on Brightness {
  Theme get defaultTheme =>
      this == Brightness.light ? DefaultThemeLight() : DefaultThemeDark();

  bool get isDark => this == Brightness.dark;
}
