import 'package:jolt/jolt.dart';

// Define a default backup theme
final _defaultLightTheme = ThemeData(
  id: 'default_light',
  colorScheme: ColorScheme.light(),
);

/// Wrap a section of the widget tree with a theme which will be inherited by
/// all children.
class Theme extends StatelessWidget {
  /// Wrap a section of the widget tree with a theme which will be inherited by
  /// all children.
  const Theme({
    required this.data,
    required this.child,
    this.textScaleFactorMultiplier = 1,
    super.key,
  });

  /// The text scale factor multiplier to use
  /// for this section of the widget tree.
  final double textScaleFactorMultiplier;

  /// The theme data to use for this section of the widget tree.
  final ThemeData data;

  /// The widget to wrap with the theme.
  final Widget child;

  /// Return the ThemeData from the closest instance of this class that encloses
  static ThemeData of(BuildContext context) {
    final inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    final theme = inheritedTheme?.theme.data ?? _defaultLightTheme;
    return theme;
  }

  @override
  Widget build(BuildContext context) {
    // Set the default color for text and icons to be either:
    // - The default color from the typography class
    // - The darkest neutral color from the color scheme
    final defaultColor = data.typography.defaultColor ??
        data.colorScheme.reversible.neutral.s900;

    return _InheritedTheme(
      theme: this,
      // Set the background color based on the theme
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: data.colorScheme.background,
        child: DefaultTextStyle(
          style: TextStyle(
            color: defaultColor,
            fontSize: data.typography.body.fontSize,
          ),
          // Set the default icons based on the theme
          child: MediaQuery(
            data: context.mediaQuery.copyWith(
              textScaleFactor: context.mediaQuery.textScaleFactor *
                  textScaleFactorMultiplier,
            ),
            child: IconTheme(
              data: IconThemeData(
                color: defaultColor,
                size: data.typography.body.fontSize,
              ),
              // Set the default text selection style based on the theme
              child: DefaultSelectionStyle(
                cursorColor: data.colorScheme.primary,
                selectionColor: data.colorScheme.primary.withOpacity(0.3),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InheritedTheme extends InheritedTheme {
  const _InheritedTheme({
    required this.theme,
    required super.child,
  });

  final Theme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return Theme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}
