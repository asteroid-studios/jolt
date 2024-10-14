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
      labelStyle: Fonts.body,
      dividerIconLabel: Gap.xs(),
      splash: disabled ? null : Splash.new,
      surfaceStyle: SurfaceStyle(
        padding: EdgeInsets.symmetric(vertical: padding, horizontal: horizontal),
        borderRadius: BorderRadius.circular(50),
        resolver: (style, context) {
          // TODO this kind of code will get repeated a lot, should create a default surface style resolver somewhere.
          final interaction = Interaction.of(context);
          return style?.copyWith(
            foregroundOpacity: disabled ? 0.3 : null,
            color: disabled
                ? style.color?.withOpacity(0.3)
                : interaction.hovered
                    ? style.color?.hovered
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
          );
        },
      ),
    );
  }

  /// A filled button style
  // Found the culprit! this is merging another resolver in!!
  static StyleResolver<ButtonStyle, Button> get filled => (context, button) => ButtonStyle();

  /// An outlined button style
  static StyleResolver<ButtonStyle, Button> get outlined => (context, button) {
        final surfaceColor = Surface.of(context).color;
        return ButtonStyle(
          surfaceStyle: SurfaceStyle(
            resolver: (style, context) {
              final interaction = Interaction.of(context);
              return style?.merge(
                SurfaceStyle(
                  color: interaction.hovered ? surfaceColor?.hovered : surfaceColor?.withOpacity(0),
                ),
              );
            },
            border: [SurfaceBorder.all()],
          ),
        );
      };

  /// A ghost button style
  static StyleResolver<ButtonStyle, Button> get ghost => (context, button) {
        final surfaceColor = Surface.of(context).color;
        final disabled = button.onTap == null;
        return ButtonStyle(
          splash: () => disabled ? null : Splash(style: SplashStyle.centered),
          surfaceStyle: SurfaceStyle(
            resolver: (style, context) {
              final interaction = Interaction.of(context);
              return style?.copyWith(
                color: !disabled && interaction.hovered ? surfaceColor?.hovered : surfaceColor?.withOpacity(0),
              );
            },
          ),
        );
      };

  /// A button styled as a link
  static StyleResolver<ButtonStyle, Button> get link => (context, button) {
        final surfaceColor = Surface.of(context).color;
        final interaction = Interaction.of(context);
        final disabled = button.onTap == null;
        return ButtonStyle(
          splash: () => disabled ? null : Splash(style: SplashStyle.centered),
          resolver: (style, context) {
            final linkStyle = TextStyle(
              decoration: !disabled && (interaction.hovered || interaction.focused || interaction.pressing)
                  ? TextDecoration.underline
                  : null,
            );
            return style?.merge(ButtonStyle(labelStyle: style.labelStyle?.merge(linkStyle) ?? linkStyle));
          },
          surfaceStyle: SurfaceStyle(
            resolver: (style, context) {
              return style?.copyWith(
                color: surfaceColor?.withOpacity(0),
                border: [],
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
