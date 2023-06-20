import 'package:jolt/jolt.dart';

/// Extensions on Strings to wrap them with Text Widgets.
extension StringTextExtensions on String {
  /// Return a Text Widget with style of displayLarge.
  Widget hero() => Text(this).hero();

  /// Return a Text Widget with style of displayLarge.
  Widget heroLarge() => Text(this).heroLarge();

  /// Return a Text Widget with style of display.
  Widget heroSmall() => Text(this).heroSmall();

  /// Return a Text Widget with style of displaySmall.
  Widget displayLarge() => Text(this).displayLarge();

  /// Return a Text Widget with style of display.
  Widget display() => Text(this).display();

  /// Return a Text Widget with style of displaySmall.
  Widget displaySmall() => Text(this).displaySmall();

  /// Return a Text Widget with style of headingLarge.
  Widget headingLarge() => Text(this).headingLarge();

  /// Return a Text Widget with style of heading.
  Widget heading() => Text(this).heading();

  /// Return a Text Widget with style of headingSmall.
  Widget headingSmall() => Text(this).headingSmall();

  /// Return a Text Widget with style of bodyLarge.
  Widget bodyLarge() => Text(this).bodyLarge();

  /// Return a Text Widget with style of body.
  Widget body() => Text(this).body();

  // Body ALIAS
  /// Return a Text Widget with style of body.
  Widget text() => body();

  /// Return a Text Widget with style of bodySmall.
  Widget bodySmall() => Text(this).bodySmall();

  /// Return a Text Widget with style of labelLarge.
  Widget labelLarge() => Text(this).labelLarge();

  /// Return a Text Widget with style of label.
  Widget label() => Text(this).label();

  /// Return a Text Widget with style of labelSmall.
  Widget labelSmall() => Text(this).labelSmall();
}
