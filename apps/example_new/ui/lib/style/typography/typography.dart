import 'package:ui/ui.dart';

part 'extensions.dart';

/// The default font-family used with Jolt.
const _fontFamily = 'Satoshi';

///
class TextStyleHero extends TextStyle {
  ///
  const TextStyleHero()
      : super(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w600,
          fontVariations: VariableFontWeight.w600,
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
          fontWeight: FontWeight.w600,
          fontVariations: VariableFontWeight.w600,
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
          fontWeight: FontWeight.w600,
          fontVariations: VariableFontWeight.w600,
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
          fontWeight: FontWeight.w500,
          fontVariations: VariableFontWeight.w500,
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
          fontWeight: FontWeight.w500,
          fontVariations: VariableFontWeight.w500,
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
