import 'package:flutter/widgets.dart' as widgets show Icon;

import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:jolt/jolt.dart';

///
extension IconExtension on IconData {
  ///
  Icon icon({
    double? size,
    Color? color,
    Color? colorDark,
    bool flipHorizontal = false,
    bool flipVertical = false,
  }) =>
      Icon(
        this,
        size: size,
        color: color,
        colorDark: colorDark,
        flipHorizontal: flipHorizontal,
        flipVertical: flipVertical,
      );
}

///
class Icon extends StatelessWidget {
  ///
  const Icon(
    this.icon, {
    this.color,
    this.colorDark,
    this.size,
    this.flipHorizontal = false,
    this.flipVertical = false,
    this.semanticLabel,
    super.key,
  });

  // TODO make composable icon stack a thing. to combine icons together.

  ///
  final IconData icon;

  ///
  final Color? color;

  ///
  final Color? colorDark;

  ///
  final double? size;

  ///
  final bool flipHorizontal;

  ///
  final bool flipVertical;

  // TODO add rotation as well

  /// Semantic label for the icon.
  ///
  /// Announced in accessibility modes (e.g TalkBack/VoiceOver).
  /// This label does not show in the UI.
  ///
  ///  * [SemanticsProperties.label], which is set to [semanticLabel] in the
  ///    underlying	 [Semantics] widget.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final passedColor = context.color.isDark ? (colorDark ?? color) : color;
    final defaultColor = context.inherited.interactionState.isDisabled
        ? passedColor?.withOpacity(0.5)
        : passedColor;

    final iconWidget = icon is PhosphorIconData
        ? PhosphorIcon(
            icon as PhosphorIconData,
            color: defaultColor,
            size: size,
            semanticLabel: semanticLabel,
          )
        : widgets.Icon(
            icon,
            color: defaultColor,
            size: size,
            semanticLabel: semanticLabel,
          );

    if (!flipHorizontal && !flipVertical) return iconWidget;

    return Transform.scale(
      scaleX: flipHorizontal ? -1 : 1,
      scaleY: flipVertical ? -1 : 1,
      child: iconWidget,
    );
  }
}
