import 'package:jolt/jolt.dart';

/// Wrap a section of the widget tree with a theme which will be inherited by
/// all children.
class DefaultWidgetTheme extends InheritedTheme {
  /// Wrap a section of the widget tree with a theme which will be inherited by
  /// all children.
  const DefaultWidgetTheme({
    required this.data,
    required super.child,
    super.key,
  });

  /// The theme data to use for this section of the widget tree.
  final WidgetTheme data;

  /// Return the ThemeData from the closest instance of this class that encloses
  static WidgetTheme of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<DefaultWidgetTheme>();
    return theme?.data ?? const WidgetTheme();
  }

  @override
  bool updateShouldNotify(DefaultWidgetTheme oldWidget) =>
      data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DefaultWidgetTheme(data: data, child: child);
  }
}

/// Contains the default styling for all Jolt Widgets.
class WidgetTheme {
  /// Contains the default styling for all Jolt Widgets.
  const WidgetTheme({
    this.surfaceStyle = const SurfaceStyle(),
    this.button = const ButtonTheme(),
    this.textField = const TextFieldTheme(),
    this.progressIndicator = const ProgressIndicatorTheme(),
  });

  /// The theme of a surface.
  final SurfaceStyle surfaceStyle;

  /// The theme of a button
  final ButtonTheme button;

  /// The theme of a text field
  final TextFieldTheme textField;

  /// The theme of the circularIndicator
  final ProgressIndicatorTheme progressIndicator;
}
