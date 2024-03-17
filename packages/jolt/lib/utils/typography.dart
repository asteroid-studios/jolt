import 'package:jolt/jolt.dart';

///
class VariableFontWeight {
  ///
  static const w100 = [FontVariation('wght', 100)];

  ///
  static const w200 = [FontVariation('wght', 200)];

  ///
  static const w300 = [FontVariation('wght', 300)];

  ///
  static const w400 = [FontVariation('wght', 400)];

  ///
  static const w500 = [FontVariation('wght', 500)];

  ///
  static const w600 = [FontVariation('wght', 600)];

  ///
  static const w700 = [FontVariation('wght', 700)];

  ///
  static const w800 = [FontVariation('wght', 800)];

  ///
  static const w900 = [FontVariation('wght', 900)];
}

///
class TextStyleC extends TextStyle {
  ///
  const TextStyleC(
    this.context, {
    super.color,
    super.fontFamily,
    super.fontSize,
    super.fontStyle,
    super.fontVariations,
    super.fontWeight,
    super.height,
    super.background,
    super.shadows,
    super.backgroundColor,
    super.foreground,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.locale,
    super.wordSpacing,
    super.letterSpacing,
    super.textBaseline,
    super.fontFeatures,
    super.fontFamilyFallback,
    super.inherit,
    super.leadingDistribution,
    super.overflow,
    super.package,
  });

  ///
  final BuildContext? context;

  @override
  TextStyleC copyWith({
    Paint? background,
    Color? backgroundColor,
    Color? color,
    String? debugLabel,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    List<FontFeature>? fontFeatures,
    double? fontSize,
    FontStyle? fontStyle,
    List<FontVariation>? fontVariations,
    FontWeight? fontWeight,
    Paint? foreground,
    double? height,
    bool? inherit,
    TextLeadingDistribution? leadingDistribution,
    double? letterSpacing,
    Locale? locale,
    TextOverflow? overflow,
    String? package,
    List<Shadow>? shadows,
    TextBaseline? textBaseline,
    double? wordSpacing,
  }) {
    return TextStyleC(
      context,
      background: background ?? this.background,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      color: color ?? this.color,
      debugLabel: debugLabel ?? this.debugLabel,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      fontSize: fontSize ?? this.fontSize,
      fontStyle: fontStyle ?? this.fontStyle,
      fontVariations: fontVariations ?? this.fontVariations,
      fontWeight: fontWeight ?? this.fontWeight,
      foreground: foreground ?? this.foreground,
      height: height ?? this.height,
      inherit: inherit ?? this.inherit,
      leadingDistribution: leadingDistribution ?? this.leadingDistribution,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      locale: locale ?? this.locale,
      overflow: overflow ?? this.overflow,
      package: package,
      shadows: shadows ?? this.shadows,
      textBaseline: textBaseline ?? this.textBaseline,
      wordSpacing: wordSpacing ?? this.wordSpacing,
    );
  }
}
