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
    final defaultColor = context.color.isDark ? (colorDark ?? color) : color;

    if (icon is PhosphorIconData) {
      return PhosphorIcon(
        icon as PhosphorIconData,
        color: defaultColor,
        size: size,
        semanticLabel: semanticLabel,
      );
    }
    return widgets.Icon(
      icon,
      color: defaultColor,
      size: size,
      semanticLabel: semanticLabel,
    );
  }
}
