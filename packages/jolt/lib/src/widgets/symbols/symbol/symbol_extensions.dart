import 'package:jolt/jolt.dart';

///
extension TypographyWidgetX on Widget {
  /// Return a Text Widget with a passed style.
  Widget text(TextStyle style) => SymbolTheme(style: (_) => style, child: this);

  /// Return a Text Widget with style of heroLarge.
  Widget textHeroLarge() => SymbolTheme(
        style: (context) => context.style.heroLarge,
        child: this,
      );

  /// Return a Text Widget with style of hero.
  Widget textHero() => SymbolTheme(
        style: (context) => context.style.hero,
        child: this,
      );

  /// Return a Text Widget with style of heroSmall.
  Widget textHeroSmall() => SymbolTheme(
        style: (context) => context.style.heroSmall,
        child: this,
      );

  /// Return a Text Widget with style of displayLarge.
  Widget textDisplayLarge() => SymbolTheme(
        style: (context) => context.style.displayLarge,
        child: this,
      );

  /// Return a Text Widget with style of display.
  Widget textDisplay() => SymbolTheme(
        style: (context) => context.style.display,
        child: this,
      );

  /// Return a Text Widget with style of displaySmall.
  Widget textDisplaySmall() => SymbolTheme(
        style: (context) => context.style.displaySmall,
        child: this,
      );

  /// Return a Text Widget with style of headingLarge.
  Widget textHeadingLarge() => SymbolTheme(
        style: (context) => context.style.headingLarge,
        child: this,
      );

  /// Return a Text Widget with style of heading.
  Widget textHeading() => SymbolTheme(
        style: (context) => context.style.heading,
        child: this,
      );

  /// Return a Text Widget with style of headingSmall.
  Widget textHeadingSmall() => SymbolTheme(
        style: (context) => context.style.headingSmall,
        child: this,
      );

  /// Return a Text Widget with style of bodyLarge.
  Widget textBodyLarge() => SymbolTheme(
        style: (context) => context.style.bodyLarge,
        child: this,
      );

  /// Return a Text Widget with style of body.
  Widget textBody() => SymbolTheme(
        style: (context) => context.style.body,
        child: this,
      );

  /// Return a Text Widget with style of bodySmall.
  Widget textBodySmall() => SymbolTheme(
        style: (context) => context.style.bodySmall,
        child: this,
      );

  /// Return a Text Widget with style of labelLarge.
  Widget textLabelLarge() => SymbolTheme(
        style: (context) => context.style.labelLarge,
        child: this,
      );

  /// Return a Text Widget with style of label.
  Widget textLabel() => SymbolTheme(
        style: (context) => context.style.label,
        child: this,
      );

  /// Return a Text Widget with style of labelSmall.
  Widget textLabelSmall() => SymbolTheme(
        style: (context) => context.style.labelSmall,
        child: this,
      );
}
