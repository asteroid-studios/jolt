import 'package:ui/ui.dart';

///
class Fonts {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Fonts._();

  ///
  static TextStyleHero get hero => const Typography().hero;

  ///
  static TextStyleDisplay get display => const Typography().display;

  ///
  static TextStyleHeading get heading => const Typography().heading;

  ///
  static TextStyleBody get body => const Typography().body;

  ///
  static TextStyleLabel get label => const Typography().label;
}
