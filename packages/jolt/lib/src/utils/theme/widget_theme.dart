import 'package:jolt/jolt.dart';

export 'package:jolt/src/widgets/basics/surface/surface_theme.dart';
export 'package:jolt/src/widgets/button/button_theme.dart';
export 'package:jolt/src/widgets/text_field/text_field_theme.dart';
export 'package:jolt/src/widgets/progress_indicator/progress_indicator_theme.dart';

/// Wrap a section of the widget tree with a theme which will be inherited by
/// all children.
class WidgetTheme extends InheritedTheme {
  /// Wrap a section of the widget tree with a theme which will be inherited by
  /// all children.
  const WidgetTheme({
    required this.data,
    required super.child,
    super.key,
  });

  /// The theme data to use for this section of the widget tree.
  final WidgetThemeData data;

  /// Return the ThemeData from the closest instance of this class that encloses
  static WidgetThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<WidgetTheme>();
    return theme?.data ?? const WidgetThemeData();
  }

  @override
  bool updateShouldNotify(WidgetTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return WidgetTheme(data: data, child: child);
  }
}

/// Contains the default styling for all Jolt Widgets.
class WidgetThemeData {
  /// Contains the default styling for all Jolt Widgets.
  const WidgetThemeData({
    this.surface = const SurfaceTheme(),
    this.button = const ButtonTheme(),
    this.textField = const TextFieldTheme(),
    this.progressIndicator = const ProgressIndicatorTheme(),
  });

  /// The theme of a surface.
  final SurfaceTheme surface;

  /// The theme of a button
  final ButtonTheme button;

  /// The theme of a text field
  final TextFieldTheme textField;

  /// The theme of the circularIndicator
  final ProgressIndicatorTheme progressIndicator;
}
