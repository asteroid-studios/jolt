import 'package:jolt/jolt.dart';

part 'extensions.dart';

/// The default font-family used with Jolt.
const _fontFamily = 'Satoshi';

///
class HeroTextStyle extends TextStyleC {
  ///
  const HeroTextStyle(super.context)
      : super(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w600,
          fontVariations: VariableFontWeight.w600,
          fontSize: 96,
        );

  ///
  TextStyleC get lg => copyWith(fontSize: 128);

  ///
  TextStyleC get md => this;

  ///
  TextStyleC get sm => copyWith(fontSize: 72);
}

///
class DisplayTextStyle extends TextStyleC {
  ///
  const DisplayTextStyle(super.context)
      : super(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w600,
          fontVariations: VariableFontWeight.w600,
          fontSize: 48,
        );

  ///
  TextStyleC get lg => copyWith(fontSize: 60);

  ///
  TextStyleC get md => this;

  ///
  TextStyleC get sm => copyWith(fontSize: 36);
}

///
class HeadingTextStyle extends TextStyleC {
  ///
  const HeadingTextStyle(super.context)
      : super(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w600,
          fontVariations: VariableFontWeight.w600,
          fontSize: 24,
        );

  ///
  TextStyleC get lg => copyWith(fontSize: 28);

  ///
  TextStyleC get md => this;

  ///
  TextStyleC get sm => copyWith(fontSize: 20);
}

///
class BodyTextStyle extends TextStyleC {
  ///
  const BodyTextStyle(super.context)
      : super(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w400,
          fontVariations: VariableFontWeight.w400,
          fontSize: 16,
        );

  ///
  TextStyleC get lg => copyWith(fontSize: 18);

  ///
  TextStyleC get md => this;

  ///
  TextStyleC get sm => copyWith(fontSize: 14);
}

///
class LabelTextStyle extends TextStyleC {
  ///
  const LabelTextStyle(super.context)
      : super(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w400,
          fontVariations: VariableFontWeight.w400,
          fontSize: 12,
        );

  ///
  TextStyleC get lg => copyWith(fontSize: 13);

  ///
  TextStyleC get md => this;

  ///
  TextStyleC get sm => copyWith(fontSize: 11);
}

///
class Typography {
  ///
  const Typography([this.context]);

  ///
  final BuildContext? context;

  ///
  HeroTextStyle get hero => HeroTextStyle(context);

  ///
  DisplayTextStyle get display => DisplayTextStyle(context);

  ///
  HeadingTextStyle get heading => HeadingTextStyle(context);

  ///
  BodyTextStyle get body => BodyTextStyle(context);

  ///
  LabelTextStyle get label => LabelTextStyle(context);
}
