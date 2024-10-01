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
      unselectedHoverOpacity: 0.5,
      selectedColor: Colors.surface,
      // selectedColor: Colors.primary.withOpacity(0.2),
      resolver: (style, context) {
        return style?.merge(
          ToggleStyle(
            buttonStyle: ButtonStyle(
              surfaceStyle: SurfaceStyle(
                borderRadius: BorderRadius.circular(8),
                resolver: (surfaceStyle, context) {
                  // final interaction = Interaction.of(context);
                  final selectedColor = style.selectedColor;
                  return surfaceStyle?.merge(
                    SurfaceStyle(
                      foregroundOpacity: !toggle.selected ? style.unselectedHoverOpacity : null,
                      // foregroundOpacity: interaction.hovered && !toggle.selected ? defaultUnselectedHoverOpacity : null,
                      color: toggle.selected ? selectedColor : surfaceStyle.color,
                      border: toggle.selected
                          ? (surfaceStyle.border
                            ?..add(SurfaceBorder.all(
                              color: selectedColor,
                              width: 2,
                            )))
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
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
