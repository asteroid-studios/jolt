import 'package:jolt/jolt.dart';

///
extension TypographyWidgetX on Widget {
  /// Return a Text Widget with style of heroLarge.
  Widget heroLarge() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.heroLarge, child: this),
      );

  /// Return a Text Widget with style of hero.
  Widget hero() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.hero, child: this),
      );

  /// Return a Text Widget with style of heroSmall.
  Widget heroSmall() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.heroSmall, child: this),
      );

  /// Return a Text Widget with style of displayLarge.
  Widget displayLarge() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.displayLarge, child: this),
      );

  /// Return a Text Widget with style of display.
  Widget display() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.display, child: this),
      );

  /// Return a Text Widget with style of displaySmall.
  Widget displaySmall() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.displaySmall, child: this),
      );

  /// Return a Text Widget with style of headingLarge.
  Widget headingLarge() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.headingLarge, child: this),
      );

  /// Return a Text Widget with style of heading.
  Widget heading() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.heading, child: this),
      );

  /// Return a Text Widget with style of headingSmall.
  Widget headingSmall() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.headingSmall, child: this),
      );

  /// Return a Text Widget with style of bodyLarge.
  Widget bodyLarge() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.bodyLarge, child: this),
      );

  /// Return a Text Widget with style of body.
  Widget body() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.body, child: this),
      );

  /// Return a Text Widget with style of bodySmall.
  Widget bodySmall() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.bodySmall, child: this),
      );

  /// Return a Text Widget with style of labelLarge.
  Widget labelLarge() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.labelLarge, child: this),
      );

  /// Return a Text Widget with style of label.
  Widget label() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.label, child: this),
      );

  /// Return a Text Widget with style of labelSmall.
  Widget labelSmall() => Builder(
        builder: (context) =>
            SymbolTheme(style: context.style.labelSmall, child: this),
      );
}
