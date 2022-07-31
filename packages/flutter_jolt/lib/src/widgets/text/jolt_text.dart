import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';

/// A text widget which utilises the textScale stored by Jolt
class JoltText extends StatelessWidget {
  /// The required text value for this widget
  final String text;

  /// The default style is context.textStyle.body
  final TextStyle? style;

  /// The default style is context.textStyle.body
  final Color? color;

  /// JoltText is selectable by default
  final bool selectable;

  /// The default textAlign is left aligned
  final TextAlign? textAlign;

  /// JoltText scales according to context.textScale by default
  final bool scaleText;

  /// JoltText does not autoSize by default
  /// You can not autoSize selectable text
  final AutoSize? autoSize;

  final TextOverflow overflow;

  const JoltText(
    this.text, {
    this.selectable = true,
    this.scaleText = true,
    this.overflow = TextOverflow.ellipsis,
    this.autoSize,
    this.style,
    this.color,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = (style ?? context.textStyle.body)?.copyWith(color: color);
    final textScaleFactor = scaleText ? context.textScale.value : null;
    if (autoSize != null) {
      return AutoSizeText(
        text,
        textScaleFactor: textScaleFactor,
        style: textStyle,
        textAlign: textAlign,
        group: autoSize!.group,
        minFontSize: autoSize!.minFontSize,
        maxLines: autoSize!.maxLines,
        stepGranularity: autoSize!.stepGranularity,
        overflow: overflow,
      );
    }
    if (selectable) {
      return SelectableText(
        text,
        textScaleFactor: textScaleFactor,
        style: textStyle,
        textAlign: textAlign,
      );
    }
    return Text(
      text,
      textScaleFactor: textScaleFactor,
      style: textStyle,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}

class AutoSize {
  /// Assign the same [AutoSizeGroup] to multiple texts to syncronise their sizing
  final AutoSizeGroup? group;

  /// Assign a minimum font size
  final double minFontSize;

  /// Define the size of the steps between font sizes
  final double stepGranularity;

  final int? maxLines;

  AutoSize({
    this.group,
    this.maxLines,
    this.minFontSize = 12,
    this.stepGranularity = 1,
  });
}
