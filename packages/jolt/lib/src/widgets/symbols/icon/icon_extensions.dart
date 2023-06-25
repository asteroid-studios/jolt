import 'package:jolt/jolt.dart';

///
extension IconExtension on IconData {
  ///
  Icon asIcon({
    double? size,
    Color? color,
    Color? colorDark,
    double scale = 1.0,
    bool flipHorizontal = false,
    bool flipVertical = false,
  }) =>
      Icon(
        this,
        size: size,
        color: color,
        colorDark: colorDark,
        scale: scale,
        flipHorizontal: flipHorizontal,
        flipVertical: flipVertical,
      );

  /// Return a Icon Widget with style of displayLarge.
  Widget asIconHeroLarge() => Icon(this).styleHeroLarge();

  /// Return a Icon Widget with style of display.
  Widget asIconHeroSmall() => Icon(this).styleHeroSmall();

  /// Return a Icon Widget with style of displaySmall.
  Widget asIconDisplayLarge() => Icon(this).styleDisplayLarge();

  /// Return a Icon Widget with style of display.
  Widget asIconDisplay() => Icon(this).styleDisplay();

  /// Return a Icon Widget with style of displaySmall.
  Widget asIconDisplaySmall() => Icon(this).styleDisplaySmall();

  /// Return a Icon Widget with style of headingLarge.
  Widget asIconHeadingLarge() => Icon(this).styleHeadingLarge();

  /// Return a Icon Widget with style of heading.
  Widget asIconHeading() => Icon(this).styleHeading();

  /// Return a Icon Widget with style of headingSmall.
  Widget asIconHeadingSmall() => Icon(this).styleHeadingSmall();

  /// Return a Icon Widget with style of bodyLarge.
  Widget asIconBodyLarge() => Icon(this).styleBodyLarge();

  /// Return a Icon Widget with style of body.
  Widget asIconBody() => Icon(this).styleBody();

  /// Return a Icon Widget with style of bodySmall.
  Widget asIconBodySmall() => Icon(this).styleBodySmall();

  /// Return a Icon Widget with style of labelLarge.
  Widget asIconLabelLarge() => Icon(this).styleLabelLarge();

  /// Return a Icon Widget with style of label.
  Widget asIconLabel() => Icon(this).styleLabel();

  /// Return a Icon Widget with style of labelSmall.
  Widget asIconLabelSmall() => Icon(this).styleLabelSmall();
}
