import 'package:ui/ui.dart';

/// The default font-family used with Jolt.
const _fontFamily = 'Satoshi';
const _package = 'ui';
const _headingFontWeight = FontWeight.w700;
const _headingFontVariation = VariableFontWeight.w700;
const _bodyFontWeight = FontWeight.w500;
const _bodyFontVariation = VariableFontWeight.w500;

///
class Fonts {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Fonts._();

  ///
  static TextStyleHero get hero => const TextStyleHero();

  ///
  static TextStyleDisplay get display => const TextStyleDisplay();

  ///
  static TextStyleHeading get heading => const TextStyleHeading();

  ///
  static TextStyleBody get body => const TextStyleBody();

  ///
  static TextStyleLabel get label => const TextStyleLabel();
}

///
class TextStyleHero extends TextStyle {
  ///
  const TextStyleHero()
      : super(
          fontFamily: _fontFamily,
          package: _package,
          fontWeight: _headingFontWeight,
          fontVariations: _headingFontVariation,
          fontSize: 96,
        );

  ///
  TextStyle get lg => copyWith(fontSize: 128);

  ///
  TextStyle get md => this;

  ///
  TextStyle get sm => copyWith(fontSize: 72);
}

///
class TextStyleDisplay extends TextStyle {
  ///
  const TextStyleDisplay()
      : super(
          fontFamily: _fontFamily,
          package: _package,
          fontWeight: _headingFontWeight,
          fontVariations: _headingFontVariation,
          fontSize: 48,
        );

  ///
  TextStyle get lg => copyWith(fontSize: 60);

  ///
  TextStyle get md => this;

  ///
  TextStyle get sm => copyWith(fontSize: 36);
}

///
class TextStyleHeading extends TextStyle {
  ///
  const TextStyleHeading()
      : super(
          fontFamily: _fontFamily,
          package: _package,
          fontWeight: _headingFontWeight,
          fontVariations: _headingFontVariation,
          fontSize: 24,
        );

  ///
  TextStyle get lg => copyWith(fontSize: 28);

  ///
  TextStyle get md => this;

  ///
  TextStyle get sm => copyWith(fontSize: 20);
}

///
class TextStyleBody extends TextStyle {
  ///
  const TextStyleBody()
      : super(
          fontFamily: _fontFamily,
          package: _package,
          fontWeight: _bodyFontWeight,
          fontVariations: _bodyFontVariation,
          fontSize: 16,
        );

  ///
  TextStyle get lg => copyWith(fontSize: 18);

  ///
  TextStyle get md => this;

  ///
  TextStyle get sm => copyWith(fontSize: 14);
}

///
class TextStyleLabel extends TextStyle {
  ///
  const TextStyleLabel()
      : super(
          fontFamily: _fontFamily,
          package: _package,
          fontWeight: _bodyFontWeight,
          fontVariations: _bodyFontVariation,
          fontSize: 12,
        );

  ///
  TextStyle get lg => copyWith(fontSize: 13);

  ///
  TextStyle get md => this;

  ///
  TextStyle get sm => copyWith(fontSize: 11);
}

///
extension StringTextX on String {
  ///
  Text get text => Text(this);
}

///
extension TextStyleX on TextStyle {
  ///
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  ///
  TextStyle get bold => w600;

  ///
  TextStyle get w100 => copyWith(
        fontWeight: FontWeight.w100,
        fontVariations: VariableFontWeight.w100,
      );

  ///
  TextStyle get w200 => copyWith(
        fontWeight: FontWeight.w200,
        fontVariations: VariableFontWeight.w200,
      );

  ///
  TextStyle get w300 => copyWith(
        fontWeight: FontWeight.w300,
        fontVariations: VariableFontWeight.w300,
      );

  ///
  TextStyle get w400 => copyWith(
        fontWeight: FontWeight.w400,
        fontVariations: VariableFontWeight.w400,
      );

  ///
  TextStyle get w500 => copyWith(
        fontWeight: FontWeight.w500,
        fontVariations: VariableFontWeight.w500,
      );

  ///
  TextStyle get w600 => copyWith(
        fontWeight: FontWeight.w600,
        fontVariations: VariableFontWeight.w600,
      );

  ///
  TextStyle get w700 => copyWith(
        fontWeight: FontWeight.w700,
        fontVariations: VariableFontWeight.w700,
      );

  ///
  TextStyle get w800 => copyWith(
        fontWeight: FontWeight.w800,
        fontVariations: VariableFontWeight.w800,
      );

  ///
  TextStyle get w900 => copyWith(
        fontWeight: FontWeight.w900,
        fontVariations: VariableFontWeight.w900,
      );

  ///
  TextStyle colored(
    Color color, {
    Color? dark,
  }) {
    return copyWith(color: Colors.isDark ? dark ?? color : color);
  }
}
