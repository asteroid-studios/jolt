import 'package:ui/ui.dart';

///
class ThemeProvider extends StatefulWidget {
  /// You should only use one ThemeProvider per app,
  /// usually near the top of the widget tree
  ///
  /// It is only responsible for refreshing the theme when it changes
  const ThemeProvider({
    required this.child,
    super.key,
  });

  ///
  final Widget child;

  // TODO when using default text style and icon style, use media query to set this
  ///
  static double get scalingFactor => _ThemeProvider.instance.scalingFactor;

  ///
  static Theme get theme => _ThemeProvider.instance.theme;

  ///
  static ThemeProviderState? of(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<_InheritedThemeProvider>()
        ?.state;
  }

  @override
  State<ThemeProvider> createState() => ThemeProviderState();
}

///
class ThemeProviderState extends State<ThemeProvider> {
  ///
  void setTheme(Theme newTheme) {
    _ThemeProvider.instance.theme = newTheme;
    refreshTheme();
  }

  ///
  void toggleTheme() {
    final index = themes.indexOf(ThemeProvider.theme);
    final newIndex = index == themes.length - 1 ? 0 : index + 1;
    setTheme(themes[newIndex]);
  }

  ///
  void setScalingFactor(double factor) {
    _ThemeProvider.instance.scalingFactor = factor;
    refreshTheme();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedThemeProvider(state: this, child: widget.child);
  }
}

class _InheritedThemeProvider extends InheritedWidget {
  const _InheritedThemeProvider({
    required this.state,
    required super.child,
  });

  final ThemeProviderState state;

  @override
  bool updateShouldNotify(_) => false;
}

///
class _ThemeProvider {
  _ThemeProvider._() {
    // TODO initialise from shared preferences
  }
  static final instance = _ThemeProvider._();

  double scalingFactor = 1;

  Theme theme = themes.firstOrNull ?? DefaultThemeLight();

  Typography typography = const Typography();
}

extension _ThemeProviderStateX on ThemeProviderState {
  void _rebuildChildren(Element el) {
    el
      ..markNeedsBuild()
      ..visitChildren(_rebuildChildren);
  }

  void refreshTheme() {
    (context as Element).visitChildren(_rebuildChildren);
  }
}
