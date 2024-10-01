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

  /// Add a splash effect to the button
  final Widget? Function()? splash;

  /// Default style for all Buttons
  static ButtonStyle defaultStyle(BuildContext context, Button button) {
    final padding = Spacing.sm;
    final horizontal = button.label != null ? padding * 2 : padding;
    final disabled = button.onTap == null;

    return ButtonStyle(
      labelStyle: Fonts.body.w600,
      dividerIconLabel: Gap.xs(),
      splash: disabled ? null : Splash.new,
      surfaceStyle: SurfaceStyle(
        padding: EdgeInsets.symmetric(vertical: padding, horizontal: horizontal),
        borderRadius: BorderRadius.circular(50),
        // TODO need to support copywith
        resolver: (style, context) {
          // TODO this kind of code will get repeated a lot, should create a default surface style resolver somewhere.
          final interaction = Interaction.of(context);
          return style?.merge(
            SurfaceStyle(
              foregroundOpacity: disabled ? 0.3 : null,
              color: disabled
                  ? style.color?.withOpacity(0.3)
                  : interaction.hovered
                      ? style.color?.weaken(5)
                      : style.color,
              border: interaction.focused
                  ? (style.border
                    ?..add(
                      SurfaceBorder.all(
                        color: Colors.tertiary,
                        gap: 4,
                        width: 2,
                      ),
                    ))
                  : style.border,
            ),
          );
        },
      ),
    );
  }

  /// A filled button style
  static StyleResolver<ButtonStyle, Button> get filled => defaultStyle;

  /// An outlined button style
  static StyleResolver<ButtonStyle, Button> get outlined => (context, button) {
        return ButtonStyle(
          surfaceStyle: SurfaceStyle(
            resolver: (style, context) {
              final interaction = Interaction.of(context);
              return style?.merge(
                SurfaceStyle(
                  color: interaction.hovered
                      // TODO this should get parent color and darken
                      ? style.color?.withOpacity(0.5)
                      : style.color?.withOpacity(0),
                ),
              );
            },
            border: [SurfaceBorder.all()],
          ),
        );
      };

  /// A ghost button style
  static StyleResolver<ButtonStyle, Button> get ghost => (context, button) {
        return ButtonStyle(
          splash: () => Splash(style: SplashStyle.centered),
          surfaceStyle: SurfaceStyle(
            resolver: (style, context) {
              final interaction = Interaction.of(context);
              return style?.merge(
                SurfaceStyle(
                  color: interaction.hovered
                      // TODO this should get parent color and darken
                      ? style.color?.withOpacity(0.5)
                      : style.color?.withOpacity(0),
                ),
              );
            },
          ),
        );
      };

  /// A button styled as a link
  static StyleResolver<ButtonStyle, Button> get link => (context, button) {
        final interaction = Interaction.of(context);
        return ButtonStyle(
          resolver: (style, context) {
            return style?.merge(
              ButtonStyle(
                labelStyle: style.labelStyle?.copyWith(
                  decoration: interaction.hovered || interaction.focused || interaction.pressing
                      ? TextDecoration.underline
                      : null,
                ),
              ),
            );
          },
          splash: () => Splash(style: SplashStyle.centered),
          surfaceStyle: SurfaceStyle(
            padding: EdgeInsets.all(Spacing.sm),
            resolver: (style, context) {
              return style?.merge(
                SurfaceStyle(
                  color: style.color?.withOpacity(0),
                  border: [],
                ),
              );
            },
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
