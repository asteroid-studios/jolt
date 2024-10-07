import 'package:flutter/widgets.dart' as widgets;
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ui/ui.dart';

///
class Icon extends StatelessWidget {
  ///
  const Icon(
    this.icon, {
    this.color,
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
    final scaledSize = MediaQuery.textScalerOf(context).scale(size ?? iconTheme.size ?? 16);
    final color = this.color ?? iconTheme.color;

    final iconWidget = icon is PhosphorIconData
        ? PhosphorIcon(
            icon as PhosphorIconData,
            color: color,
            size: scaledSize,
            semanticLabel: semanticLabel,
          )
        : widgets.Icon(
            icon,
            color: color,
            size: scaledSize,
            semanticLabel: semanticLabel,
          );

    return iconWidget;

    // TODO come back to all this.

    // if (scale != 1.0) {
    //   iconWidget = Transform.scale(
    //     scale: scale,
    //     child: iconWidget,
    //   );
    // }

    // if (!flipHorizontal && !flipVertical) return iconWidget;

    // return Transform.scale(
    //   scaleX: flipHorizontal ? -1 : 1,
    //   scaleY: flipVertical ? -1 : 1,
    //   child: iconWidget,
    // );
  }
}
