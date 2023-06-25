import 'package:jolt/jolt.dart';

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