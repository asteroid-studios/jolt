import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class JoltText extends StatelessWidget {
  /// The text to display.
  ///
  /// This will be null if a [textSpan] is provided instead.
  final String? data;

  /// The text to display as a [InlineSpan].
  ///
  /// This will be null if [data] is provided instead.
  final InlineSpan? textSpan;

  /// JoltText is selectable by default
  ///
  /// Setting to false will wrap text with a SelectionArea.disabled
  final bool selectable;

  final int? maxLines;

  final Color? color;

  final AutoSizeGroup? autoSizeGroup;

  const JoltText(
    this.data, {
    this.selectable = true,
    this.maxLines,
    this.autoSizeGroup,
    this.color,
    super.key,
  })  : assert(
          data != null,
          'A non-null String must be provided to a Text widget.',
        ),
        textSpan = null;

  const JoltText.rich(
    this.textSpan, {
    this.selectable = true,
    this.maxLines,
    this.autoSizeGroup,
    this.color,
    super.key,
  })  : assert(
          textSpan != null,
          'A non-null TextSpan must be provided to a Text.rich widget.',
        ),
        data = null;

  @override
  Widget build(BuildContext context) {
    // final joltTextTheme = context.theme
    // TODO default text styles
    // TODO default color to parent of container
    // final effectiveTextStyle = context

    final textWidget = data != null
        ? AutoSizeText(
            data!,
            maxLines: maxLines,
            group: autoSizeGroup,
          )
        : AutoSizeText.rich(
            TextSpan(children: [textSpan!]),
            maxLines: maxLines,
            group: autoSizeGroup,
          );

    if (selectable) return textWidget;

    return SelectionContainer.disabled(
      child: textWidget,
    );
  }
}
