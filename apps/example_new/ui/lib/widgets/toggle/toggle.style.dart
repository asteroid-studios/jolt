import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

///
@Style()
class ToggleStyle {
  ///
  final ButtonStyle? buttonStyle;

  ///
  final Color? selectedColor;

  ///
  final double? unselectedHoverOpacity;

  ///
  static ToggleStyle defaultStyle(BuildContext context, ToggleState toggle) {
    return ToggleStyle(
      unselectedHoverOpacity: 0.4,
      selectedColor: Colors.primary,
      buttonStyle: ButtonStyle(
        splash: () => const SizedBox(),
        surfaceStyle: SurfaceStyle(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      resolver: (style, context) {
        final selectedColor = style?.selectedColor;
        return style?.copyWith(
          buttonStyle: style.buttonStyle?.copyWith(
            surfaceStyle: style.buttonStyle?.surfaceStyle?.copyWith(
              resolver: (surfaceStyle, context) {
                return surfaceStyle?.copyWith(
                  foregroundOpacity: !toggle.selected ? style.unselectedHoverOpacity : null,
                  color: toggle.selected ? selectedColor : surfaceStyle.color,
                  border: toggle.selected ? (surfaceStyle.border?..add(SurfaceBorder.all(color: selectedColor))) : null,
                );
              },
            ),
          ),
        );
      },
    );
  }

  ///
  static StyleResolver<ButtonStyle, Button> fromType(ToggleType type) {
    switch (type) {
      case ToggleType.filled:
        return ButtonStyle.filled;
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

  ///
  filled,
}
