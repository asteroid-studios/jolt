// ignore_for_file: prefer_const_constructors

import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

///
@Style()
class ButtonStyle {
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
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  /// A filled button style
  static StyleResolver<ButtonStyle, Button> get filled => defaultStyle;

  /// An outlined button style
  static StyleResolver<ButtonStyle, Button> get outlined => (context, button) {
        return ButtonStyle(
          surfaceStyle: SurfaceStyle(
            color: Colors.background,
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.outline,
            ),
          ),
        );
      };

  /// A ghost button style
  static StyleResolver<ButtonStyle, Button> get ghost => (context, button) {
        return ButtonStyle(
          surfaceStyle: SurfaceStyle(
            color: Colors.transparent,
            foregroundColor: Colors.background.foreground,
          ),
        );
      };

  /// A button styled as a link
  static StyleResolver<ButtonStyle, Button> get link => (context, button) {
        return ButtonStyle(
          // TODO only add on hover
          labelStyle: const TextStyle(decoration: TextDecoration.underline),
          surfaceStyle: SurfaceStyle(
            color: Colors.transparent,
            foregroundColor: Colors.background.foreground,
          ),
        );
      };

  @override
  String toString() {
    return 'ButtonStyle(\niconSize: $iconSize,\n labelStyle: $labelStyle,\n surfaceStyle: $surfaceStyle\n)';
  }
}
