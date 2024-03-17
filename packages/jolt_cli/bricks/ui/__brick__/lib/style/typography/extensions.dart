part of 'typography.dart';

///
extension TypographyX on BuildContext {
  ///
  Typography get text => Typography(this);
}

///
extension TextStyleX on TextStyle {
  ///
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  ///
  TextStyle get w100 => copyWith(fontVariations: VariableFontWeight.w100);

  ///
  TextStyle get w200 => copyWith(fontVariations: VariableFontWeight.w200);

  ///
  TextStyle get w300 => copyWith(fontVariations: VariableFontWeight.w300);

  ///
  TextStyle get w400 => copyWith(fontVariations: VariableFontWeight.w400);

  ///
  TextStyle get w500 => copyWith(fontVariations: VariableFontWeight.w500);

  ///
  TextStyle get w600 => copyWith(fontVariations: VariableFontWeight.w600);

  ///
  TextStyle get w700 => copyWith(fontVariations: VariableFontWeight.w700);

  ///
  TextStyle get w800 => copyWith(fontVariations: VariableFontWeight.w800);

  ///
  TextStyle get w900 => copyWith(fontVariations: VariableFontWeight.w900);
}

///
extension ContextualTextStyleX on ContextualTextStyle {
  ///
  TextStyle get primary => copyWith(
      // TODO fix up once color is linked up
      // color: context?.color.primary,
      );

  ///
  TextStyle get secondary => copyWith(
      // TODO fix up once color is linked up
      // color: context?.color.secondary,
      );

  ///
  TextStyle get tertiary => copyWith(
      // TODO fix up once color is linked up
      // color: context?.color.tertiary,
      );
}

// TODO put back DefaultSymbolStyle extensions
// TODO put back String extensions
