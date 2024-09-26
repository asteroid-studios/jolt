// ignore_for_file: prefer_const_constructors

import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

///
@Style()
class ButtonStyle {
  ///
  final double? iconSize;

  /// The gap to show between the icon and label
  final Widget? dividerIconLabel;

  ///
  final TextStyle? labelStyle;

  /// Style the surface used for the button
  final SurfaceStyle? surfaceStyle;

  /// Default style for all Buttons
  static ButtonStyle defaultStyle(BuildContext context, Button button) {
    final padding = Spacing.sm;
    final horizontal = button.label != null ? padding * 2 : padding;
    return ButtonStyle(
      labelStyle: Fonts.body.w600,
      dividerIconLabel: Gap.xs(),
      surfaceStyle: SurfaceStyle(
        // TODO need to support copywith
        resolver: (style) {
          // TODO this kind of code will get repeated a lot, should create a default surface style resolver somewhere.
          final interaction = Interaction.of(context);
          return style?.merge(
            SurfaceStyle(color: interaction.hovered ? style.color?.darken() : style.color),
          );
        },
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
            resolver: (style) {
              final interaction = Interaction.of(context);
              return style?.merge(
                SurfaceStyle(
                  color: interaction.hovered ? style.color?.darken() : style.color?.withValues(alpha: 0),
                ),
              );
            },
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
            resolver: (style) {
              final interaction = Interaction.of(context);
              return style?.merge(
                SurfaceStyle(
                  color: interaction.hovered ? style.color?.darken() : style.color?.withValues(alpha: 0),
                ),
              );
            },
            foregroundColor: Colors.background.foreground,
          ),
        );
      };

  /// A button styled as a link
  static StyleResolver<ButtonStyle, Button> get link => (context, button) {
        final interaction = Interaction.of(context);
        return ButtonStyle(
          // TODO change to resolver
          labelStyle: TextStyle(decoration: interaction.hovered ? TextDecoration.underline : null),
          surfaceStyle: SurfaceStyle(
            resolver: (style) {
              return style?.merge(
                SurfaceStyle(
                  color: style.color?.withValues(alpha: 0),
                ),
              );
            },
            padding: EdgeInsets.all(Spacing.sm),
            foregroundColor: Colors.background.foreground,
          ),
        );
      };

  @override
  String toString() {
    return 'ButtonStyle(\niconSize: $iconSize,\n labelStyle: $labelStyle,\n surfaceStyle: $surfaceStyle\n)';
  }

  ///
  static StyleResolver<ButtonStyle, Button> fromType(ButtonType type) {
    switch (type) {
      case ButtonType.filled:
        return filled;
      case ButtonType.outlined:
        return outlined;
      case ButtonType.ghost:
        return ghost;
      case ButtonType.link:
        return link;
    }
  }
}

///
enum ButtonType {
  /// A filled button
  filled,

  /// An outlined button
  outlined,

  /// A transparent button
  ghost,

  /// A button styled as a link
  link,
}
