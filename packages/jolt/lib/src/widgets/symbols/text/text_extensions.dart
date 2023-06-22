import 'package:jolt/jolt.dart';

/// Extensions on Strings to wrap them with Text Widgets.
extension StringTextExtensions on String {
  /// Return a Text Widget with style of displayLarge.
  Widget textHero() => Text(this).textHero();

  /// Return a Text Widget with style of displayLarge.
  Widget textHeroLarge() => Text(this).textHeroLarge();

  /// Return a Text Widget with style of display.
  Widget textHeroSmall() => Text(this).textHeroSmall();

  /// Return a Text Widget with style of displaySmall.
  Widget textDisplayLarge() => Text(this).textDisplayLarge();

  /// Return a Text Widget with style of display.
  Widget textDisplay() => Text(this).textDisplay();

  /// Return a Text Widget with style of displaySmall.
  Widget textDisplaySmall() => Text(this).textDisplaySmall();

  /// Return a Text Widget with style of headingLarge.
  Widget textHeadingLarge() => Text(this).textHeadingLarge();

  /// Return a Text Widget with style of heading.
  Widget textHeading() => Text(this).textHeading();

  /// Return a Text Widget with style of headingSmall.
  Widget textHeadingSmall() => Text(this).textHeadingSmall();

  /// Return a Text Widget with style of bodyLarge.
  Widget textBodyLarge() => Text(this).textBodyLarge();

  /// Return a Text Widget with style of body.
  Widget textBody() => Text(this).textBody();

  // Body ALIAS
  /// Return a Text Widget with style of body.
  Widget text() => textBody();

  /// Return a Text Widget with style of bodySmall.
  Widget textBodySmall() => Text(this).textBodySmall();

  /// Return a Text Widget with style of labelLarge.
  Widget textLabelLarge() => Text(this).textLabelLarge();

  /// Return a Text Widget with style of label.
  Widget textLabel() => Text(this).textLabel();

  /// Return a Text Widget with style of labelSmall.
  Widget textLabelSmall() => Text(this).textLabelSmall();
}
