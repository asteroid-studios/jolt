import 'package:flutter/widgets.dart' as widgets show Icon;

import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:jolt/jolt.dart';

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
    this.scale = 1.0,
    this.ignoreIconScaleFactor = false,
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

  /// ignoreScaling will ignore the icon scaling factor
  final bool ignoreIconScaleFactor;

  /// Scale the icon by a factor, useful if using an icon set where the icons
  /// don't seem to match up exactly
  final double scale;

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
    final iconTheme = IconTheme.of(context);
    final color = context.color.responsive(this.color, colorDark: colorDark) ??
        iconTheme.color;
    final sizeScale =
        ignoreIconScaleFactor ? 1.0 : context.mediaQuery.textScaleFactor;
    final size = (this.size ?? iconTheme.size ?? 16) * sizeScale;
    final defaultColor = context.inherited.interactionState.isDisabled
        ? color?.withOpacity(0.5)
        : color;

    Widget iconWidget = icon is PhosphorIconData
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

    if (scale != 1.0) {
      iconWidget = Transform.scale(
        scale: scale,
        child: iconWidget,
      );
    }

    if (!flipHorizontal && !flipVertical) return iconWidget;

    return Transform.scale(
      scaleX: flipHorizontal ? -1 : 1,
      scaleY: flipVertical ? -1 : 1,
      child: iconWidget,
    );
  }
}
