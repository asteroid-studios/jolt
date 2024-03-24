import 'package:ui/ui.dart';

// TODO Maybe I should use the themeProvider as an inherited widget and used in the normal way
// But also have the whole Jolt.theme.x way of doing things

///
class ThemeProvider extends StatefulWidget {
  ///
  const ThemeProvider({
    required this.child,
    super.key,
  });

  ///
  final Widget child;

  ///
  static Theme get theme => _ThemeProvider.instance.theme;

  ///
  static List<Theme> get themes => _ThemeProvider.instance.themes;

  ///
  static ThemeProviderState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedThemeProvider>()
        ?.state;
  }

  @override
  State<ThemeProvider> createState() => ThemeProviderState();
}

///
class ThemeProviderState extends State<ThemeProvider> {
  // Recursively rebuild all child elements when the theme changes.
  void _rebuildChildren(Element el) {
    el
      ..markNeedsBuild()
      ..visitChildren(_rebuildChildren);
  }

  ///
  void setTheme(Theme newTheme) {
    _ThemeProvider.instance.theme = newTheme;
    (context as Element).visitChildren(_rebuildChildren);
  }

  ///
  void toggleTheme() {
    final index = ThemeProvider.themes.indexOf(ThemeProvider.theme);
    final newIndex = index == ThemeProvider.themes.length - 1 ? 0 : index + 1;
    setTheme(ThemeProvider.themes[newIndex]);
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
  _ThemeProvider._();
  static final instance = _ThemeProvider._();

  Theme theme = DefaultThemeLight();
  List<Theme> themes = [DefaultThemeLight(), DefaultThemeDark()];

  Typography typography = const Typography();
}
