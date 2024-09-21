import 'package:ui/ui.dart';

/// A color that has a small table of related colors called a "swatch"
class ColorSwatch extends Color {
  ///
  const ColorSwatch(
    super.value, {
    required this.name,
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
    required this.shade950,
  });

  /// The lightest shade.
  final Color shade50;

  /// The second lightest shade.
  final Color shade100;

  /// The third lightest shade.
  final Color shade200;

  /// The fourth lightest shade.
  final Color shade300;

  /// The fifth lightest shade.
  final Color shade400;

  /// The middle shade
  final Color shade500;

  /// The fifth darkest shade.
  final Color shade600;

  /// The fourth darkest shade.
  final Color shade700;

  /// The third darkest shade.
  final Color shade800;

  /// The second darkest shade.
  final Color shade900;

  /// The darkest shade.
  final Color shade950;

  ///
  final String name;

  ///
  List<Color> get shades => [
        shade50,
        shade100,
        shade200,
        shade300,
        shade400,
        shade500,
        shade600,
        shade700,
        shade800,
        shade900,
        shade950,
      ];
}

///
extension ColorSwatchX on Color {
  ///
  ColorSwatch get swatch => this is ColorSwatch
      ? this as ColorSwatch
      : ColorSwatch(
          value,
          name: 'Generated Swatch',
          shade50: shade50,
          shade100: shade100,
          shade200: shade200,
          shade300: shade300,
          shade400: shade400,
          shade500: shade500,
          shade600: shade600,
          shade700: shade700,
          shade800: shade800,
          shade900: shade900,
          shade950: shade950,
        );

  ///
  Color get shade50 => withLightness(0.98);

  ///
  Color get shade100 => withLightness(0.93);

  ///
  Color get shade200 => withLightness(0.85);

  ///
  Color get shade300 => withLightness(0.8);

  ///
  Color get shade400 => withLightness(0.65);

  ///
  Color get shade500 => withLightness(0.55);

  ///
  Color get shade600 => withLightness(0.38);

  ///
  Color get shade700 => withLightness(0.3);

  ///
  Color get shade800 => withLightness(0.2);

  ///
  Color get shade900 => withLightness(0.12);

  ///
  Color get shade950 => withLightness(0.05);

  ///
  List<Color> get shades => [
        shade50,
        shade100,
        shade200,
        shade300,
        shade400,
        shade500,
        shade600,
        shade700,
        shade800,
        shade900,
        shade950,
      ];
}
