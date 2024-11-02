import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

///
@Style()
class CardStyle {
  ///
  final SurfaceStyle? surfaceStyle;

  ///
  /// Default style for all Buttons
  static CardStyle defaultStyle(BuildContext context, Card card) {
    return CardStyle(
      surfaceStyle: SurfaceStyle(
        padding: EdgeInsets.all(Spacing.lg),
        borderRadius: BorderRadius.circular(8),
        resolver: (style, context) {
          return style?.copyWith(
            color: card.active ? Colors.primary : style.color,
            // border: card.active
            //     ? (style.border
            //       ?..add(
            //         SurfaceBorder.all(
            //           color: Colors.tertiary,
            //           gap: 4,
            //           width: 2,
            //         ),
            //       ))
            //     : style.border,
          );
        },
      ),
    );
  }
}
