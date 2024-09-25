// ignore_for_file: prefer_const_constructors

import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

///
@Style()
class ButtonStyle<Button> {
  ///
  final double? iconSize;

  ///
  final TextStyle? labelStyle;

  /// Style the surface used for the button
  final SurfaceStyle? surfaceStyle;

  /// Default style for all Buttons
  static ButtonStyle defaultStyle(BuildContext context, Button button) {
    final padding = Spacing.sm;
    final horizontal = button.label != null ? padding * 2 : padding;
    return ButtonStyle(
      surfaceStyle: SurfaceStyle(
        padding: EdgeInsets.symmetric(vertical: padding, horizontal: horizontal),
        color: Colors.primary,
        // borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
