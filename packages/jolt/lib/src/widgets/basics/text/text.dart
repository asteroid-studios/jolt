import 'dart:ui' as ui show TextHeightBehavior;
import 'dart:ui';

import 'package:flutter/widgets.dart' as widgets show Text;

import 'package:jolt/jolt.dart';

export 'package:jolt/src/widgets/basics/text/text_extensions.dart';

/// A run of text
class Text extends StatelessWidget {
  /// Creates a text widget.
  const Text(
    String this.data, {
    super.key,
    this.style,
    this.color,
    this.colorDark,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.selectionColor,
    this.options,
  }) : textSpan = null;

  /// Creates a text widget with an [InlineSpan].
  const Text.rich(
    InlineSpan this.textSpan, {
    super.key,
    this.style,
    this.color,
    this.colorDark,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.selectionColor,
    this.options,
  }) : data = null;

  /// The text to display.
  ///
  /// This will be null if a [textSpan] is provided instead.
  final String? data;

  /// Override the color for the text
  final Color? color;

  /// Override the color for the text when the theme is dark
  final Color? colorDark;

  /// Override the weight for the text
  final FontWeight? fontWeight;

  /// The text to display as a [InlineSpan].
  ///
  /// This will be null if [data] is provided instead.
  final InlineSpan? textSpan;

  /// If non-null, the style to use for this text.
  ///
  /// If the style's "inherit" property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// How visual overflow should be handled.
  ///
  /// If this is null [TextStyle.overflow] will be used, otherwise the value
  /// from the nearest [DefaultTextStyle] ancestor will be used.
  final TextOverflow? overflow;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  /// {@macro flutter.widgets.Text.semanticsLabel}
  final String? semanticsLabel;

  /// The color to use when painting the selection.
  ///
  /// This is ignored if [SelectionContainer.maybeOf] returns null
  /// in the [BuildContext] of the [Text] widget.
  ///
  /// If null, the ambient [DefaultSelectionStyle] is used (if any); failing
  /// that, the selection color defaults to [DefaultSelectionStyle.defaultColor]
  /// (semi-transparent grey).
  final Color? selectionColor;

  /// Additional options for styling text.
  final TextOptions? options;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = style ?? DefaultTextStyle.of(context).style;
    final fontWeight = this.fontWeight ?? defaultTextStyle.fontWeight;
    final defaultColor = context.color.darkWithFallback(colorDark, color);
    return widgets.Text(
      data ?? '',
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      selectionColor: selectionColor,
      style: defaultTextStyle.copyWith(
        color: defaultColor,
        fontWeight: fontWeight,
        fontVariations: [
          ...?defaultTextStyle.fontVariations,
          // Support for variable fonts from font weight
          if (fontWeight != null)
            FontVariation(
              FontVariationAxis.weight,
              fontWeight.value.toDouble(),
            ),
        ],
      ),
      // Pass text options
      textDirection: options?.textDirection,
      locale: options?.locale,
      softWrap: options?.softWrap,
      textScaleFactor: options?.textScaleFactor,
      textWidthBasis: options?.textWidthBasis,
      textHeightBehavior: options?.textHeightBehavior,
    );
  }
}

/// Additional options for styling text.
class TextOptions {
  /// Additional options for styling text.
  TextOptions({
    this.softWrap,
    this.textDirection,
    this.textScaleFactor,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.strutStyle,
    this.locale,
  });

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  ///
  /// The value given to the constructor as textScaleFactor. If null, will
  /// use the [MediaQueryData.textScaleFactor] obtained from the ambient
  /// [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
  final double? textScaleFactor;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final ui.TextHeightBehavior? textHeightBehavior;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  final Locale? locale;
}
