import 'package:jolt/jolt.dart';

/// Extensions on Strings to wrap them with Text Widgets.
extension StringTextExtensions on String {
  /// Return a Text Widget with style of displayLarge.
  Widget asHero() => Text(this).withStyleHero();

  /// Return a Text Widget with style of displayLarge.
  Widget asHeroLarge() => Text(this).withStyleHeroLarge();

  /// Return a Text Widget with style of display.
  Widget asHeroSmall() => Text(this).withStyleHeroSmall();

  /// Return a Text Widget with style of displaySmall.
  Widget asDisplayLarge() => Text(this).withStyleDisplayLarge();

  /// Return a Text Widget with style of display.
  Widget asDisplay() => Text(this).withStyleDisplay();

  /// Return a Text Widget with style of displaySmall.
  Widget asDisplaySmall() => Text(this).withStyleDisplaySmall();

  /// Return a Text Widget with style of headingLarge.
  Widget asHeadingLarge() => Text(this).withStyleHeadingLarge();

  /// Return a Text Widget with style of heading.
  Widget asHeading() => Text(this).withStyleHeading();

  /// Return a Text Widget with style of headingSmall.
  Widget asHeadingSmall() => Text(this).withStyleHeadingSmall();

  /// Return a Text Widget with style of bodyLarge.
  Widget asBodyLarge() => Text(this).withStyleBodyLarge();

  /// Return a Text Widget with style of body.
  Widget asBody() => Text(this).withStyleBody();

  /// Return a Text Widget with a default style.
  Text asText([TextStyle? textStyle]) => Text(this, style: textStyle);

  /// Return a TextSpan Widget with a default style.
  TextSpan asTextSpan() => TextSpan(text: this);

  /// Return a Text Widget with style of bodySmall.
  Widget asBodySmall() => Text(this).withStyleBodySmall();

  /// Return a Text Widget with style of labelLarge.
  Widget asLabelLarge() => Text(this).withStyleLabelLarge();

  /// Return a Text Widget with style of label.
  Widget asLabel() => Text(this).withStyleLabel();

  /// Return a Text Widget with style of labelSmall.
  Widget asLabelSmall() => Text(this).withStyleLabelSmall();
}
