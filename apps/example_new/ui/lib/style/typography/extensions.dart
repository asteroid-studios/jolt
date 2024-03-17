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
}

///
extension ContextualTextStyleX on TextStyleC {
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
