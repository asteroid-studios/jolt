import 'package:jolt/jolt.dart';

/// Extensions on Strings to wrap them with Text Widgets.
extension StringTextExtensions on String {
  /// Return a Text Widget with style of displayLarge.
  Widget asHero() => Text(this).styleHero();

  /// Return a Text Widget with style of displayLarge.
  Widget asHeroLarge() => Text(this).styleHeroLarge();

  /// Return a Text Widget with style of display.
  Widget asHeroSmall() => Text(this).styleHeroSmall();

  /// Return a Text Widget with style of displaySmall.
  Widget asDisplayLarge() => Text(this).styleDisplayLarge();

  /// Return a Text Widget with style of display.
  Widget asDisplay() => Text(this).styleDisplay();

  /// Return a Text Widget with style of displaySmall.
  Widget asDisplaySmall() => Text(this).styleDisplaySmall();

  /// Return a Text Widget with style of headingLarge.
  Widget asHeadingLarge() => Text(this).styleHeadingLarge();

  /// Return a Text Widget with style of heading.
  Widget asHeading() => Text(this).styleHeading();

  /// Return a Text Widget with style of headingSmall.
  Widget asHeadingSmall() => Text(this).styleHeadingSmall();

  /// Return a Text Widget with style of bodyLarge.
  Widget asBodyLarge() => Text(this).styleBodyLarge();

  /// Return a Text Widget with style of body.
  Widget asBody() => Text(this).styleBody();

  /// Return a Text Widget with a default style.
  Text asText() => Text(this);

  /// Return a TextSpan Widget with a default style.
  TextSpan asTextSpan() => TextSpan(text: this);

  /// Return a Text Widget with style of bodySmall.
  Widget asBodySmall() => Text(this).styleBodySmall();

  /// Return a Text Widget with style of labelLarge.
  Widget asLabelLarge() => Text(this).styleLabelLarge();

  /// Return a Text Widget with style of label.
  Widget asLabel() => Text(this).styleLabel();

  /// Return a Text Widget with style of labelSmall.
  Widget asLabelSmall() => Text(this).styleLabelSmall();
}
