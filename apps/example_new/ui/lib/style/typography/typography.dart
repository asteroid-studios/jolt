import 'package:ui/ui.dart';

part 'extensions.dart';

/// The default font-family used with Jolt.
const _fontFamily = 'Satoshi';
const _package = 'ui';
const _headingFontWeight = FontWeight.w700;
const _headingFontVariation = VariableFontWeight.w700;
const _bodyFontWeight = FontWeight.w500;
const _bodyFontVariation = VariableFontWeight.w500;

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
class Typography {
  ///
  const Typography();

  ///
  TextStyleHero get hero => const TextStyleHero();

  ///
  TextStyleDisplay get display => const TextStyleDisplay();

  ///
  TextStyleHeading get heading => const TextStyleHeading();

  ///
  TextStyleBody get body => const TextStyleBody();

  ///
  TextStyleLabel get label => const TextStyleLabel();
}
