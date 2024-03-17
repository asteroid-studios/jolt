import 'package:jolt_copy/jolt.dart';

///
extension IconExtension on IconData {
  ///
  Icon asIcon({
    double? size,
    Color? color,
    double scale = 1.0,
    bool flipHorizontal = false,
    bool flipVertical = false,
  }) =>
      Icon(
        this,
        size: size,
        color: color,
        scale: scale,
        flipHorizontal: flipHorizontal,
        flipVertical: flipVertical,
      );

  /// Return a Icon Widget with style of displayLarge.
  Widget asIconHeroLarge() => Icon(this).withStyleHeroLarge();

  /// Return a Icon Widget with style of display.
  Widget asIconHeroSmall() => Icon(this).withStyleHeroSmall();

  /// Return a Icon Widget with style of displaySmall.
  Widget asIconDisplayLarge() => Icon(this).withStyleDisplayLarge();

  /// Return a Icon Widget with style of display.
  Widget asIconDisplay() => Icon(this).withStyleDisplay();

  /// Return a Icon Widget with style of displaySmall.
  Widget asIconDisplaySmall() => Icon(this).withStyleDisplaySmall();

  /// Return a Icon Widget with style of headingLarge.
  Widget asIconHeadingLarge() => Icon(this).withStyleHeadingLarge();

  /// Return a Icon Widget with style of heading.
  Widget asIconHeading() => Icon(this).withStyleHeading();

  /// Return a Icon Widget with style of headingSmall.
  Widget asIconHeadingSmall() => Icon(this).withStyleHeadingSmall();

  /// Return a Icon Widget with style of bodyLarge.
  Widget asIconBodyLarge() => Icon(this).withStyleBodyLarge();

  /// Return a Icon Widget with style of body.
  Widget asIconBody() => Icon(this).withStyleBody();

  /// Return a Icon Widget with style of bodySmall.
  Widget asIconBodySmall() => Icon(this).withStyleBodySmall();

  /// Return a Icon Widget with style of labelLarge.
  Widget asIconLabelLarge() => Icon(this).withStyleLabelLarge();

  /// Return a Icon Widget with style of label.
  Widget asIconLabel() => Icon(this).withStyleLabel();

  /// Return a Icon Widget with style of labelSmall.
  Widget asIconLabelSmall() => Icon(this).withStyleLabelSmall();
}
