import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

///
@Style()
class ToggleStyle {
  ///
  final ButtonStyle? buttonStyle;

  ///
  static ToggleStyle defaultStyle(BuildContext context, ToggleState toggle) {
    return ToggleStyle(
      buttonStyle: ButtonStyle(
        // iconSize: Fonts.body.sm.fontSize,
        surfaceStyle: SurfaceStyle(
          // padding: EdgeInsets.all(4),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  ///
  static StyleResolver<ButtonStyle, Button> fromType(ToggleType type) {
    switch (type) {
      case ToggleType.outlined:
        return ButtonStyle.outlined;
      case ToggleType.ghost:
        return ButtonStyle.ghost;
    }
  }
}

///
enum ToggleType {
  ///
  outlined,

  ///
  ghost,
}
