import 'package:jolt/jolt.dart';

///
class TextFieldTheme {
  ///
  const TextFieldTheme({
    this.labelType = TextFieldLabel.floating,
    this.style,
    this.hintStyle,
    this.fixedLabelStyle,
    this.floatingLabelStyle,
    this.cursorColor,
    this.surface,
  });

  ///
  final SurfaceTheme? surface;

  /// When a label is a floating, it will start where the hint would be
  /// and then float up to the top of the TextField when the focused.
  ///
  /// A fixed label will always be above the TextField.
  final TextFieldLabel labelType;

  /// The style of the text being edited.
  final TextStyle? style;

  /// The style of the hint/placeholder text.
  final TextStyle? hintStyle;

  /// The style of the label when it is fixed above the textfield.
  final TextStyle? fixedLabelStyle;

  /// The style of the label when it is floating at the top of the textfield.
  final TextStyle? floatingLabelStyle;

  /// The color of the cursor.
  final Color? cursorColor;
}

/// The type of label to use for the TextField.
enum TextFieldLabel {
  /// The label will be fixed above the TextField.
  fixed,

  /// The label will float at the top of the TextField.
  floating,
}
