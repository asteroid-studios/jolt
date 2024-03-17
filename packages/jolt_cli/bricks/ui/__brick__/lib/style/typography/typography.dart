import 'package:jolt/jolt.dart';

part 'extensions.dart';

/// The default font-family used with Jolt.
const _fontFamily = 'Satoshi';

///
class HeroTextStyle extends ContextualTextStyle {
  ///
  const HeroTextStyle([BuildContext? context])
      : super(
          context: context,
          fontVariations: VariableFontWeight.w600,
          fontFamily: _fontFamily,
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
class DisplayTextStyle extends ContextualTextStyle {
  ///
  const DisplayTextStyle([BuildContext? context])
      : super(
          context: context,
          fontVariations: VariableFontWeight.w600,
          fontFamily: _fontFamily,
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
class HeadingTextStyle extends ContextualTextStyle {
  ///
  const HeadingTextStyle([BuildContext? context])
      : super(
          context: context,
          fontVariations: VariableFontWeight.w600,
          fontFamily: _fontFamily,
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
class BodyTextStyle extends ContextualTextStyle {
  ///
  const BodyTextStyle([BuildContext? context])
      : super(
          context: context,
          fontVariations: VariableFontWeight.w400,
          fontFamily: _fontFamily,
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
class LabelTextStyle extends ContextualTextStyle {
  ///
  const LabelTextStyle([BuildContext? context])
      : super(
          context: context,
          fontVariations: VariableFontWeight.w400,
          fontFamily: _fontFamily,
          fontSize: 10,
        );

  ///
  TextStyle get lg => copyWith(fontSize: 12);

  ///
  TextStyle get md => this;

  ///
  TextStyle get sm => copyWith(fontSize: 8);
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
