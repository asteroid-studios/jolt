import 'package:flutter/widgets.dart';

/// A color that has a small table of related colors called a "swatch"
class JoltColor extends Color {
  /// Creates a swatch of colors
  ///
  /// - The **primary** color is the default color for the swatch.
  ///
  /// - The **highlight** color is the color which has the
  /// highest contrast with the default color.
  ///
  /// - **shade50** should be the lightest shade.
  ///
  /// - **shade950** should be the darkest.
  ///
  /// - **shade500** is optional, and will default to the **primary** color.
  const JoltColor(
    super.primary, {
    /// Test
    required int highlight,
    required int shade50,
    required int shade100,
    required int shade200,
    required int shade300,
    required int shade400,
    required int shade600,
    required int shade700,
    required int shade800,
    required int shade900,
    required int shade950,
    int? shade500,
  })  : _shadeHighlight = highlight,
        _shade50 = shade50,
        _shade100 = shade100,
        _shade200 = shade200,
        _shade300 = shade300,
        _shade400 = shade400,
        _shade500 = shade500,
        _shade600 = shade600,
        _shade700 = shade700,
        _shade800 = shade800,
        _shade900 = shade900,
        _shade950 = shade950;

  /// A shade which has the highest contrast with the default shade.
  Color get highlight => Color(_shadeHighlight);
  final int _shadeHighlight;

  /// The lightest shade.
  Color get s50 => Color(_shade50);
  final int _shade50;

  /// The second lightest shade.
  Color get s100 => Color(_shade100);
  final int _shade100;

  /// The third lightest shade.
  Color get s200 => Color(_shade200);
  final int _shade200;

  /// The fourth lightest shade.
  Color get s300 => Color(_shade300);
  final int _shade300;

  /// The fifth lightest shade.
  Color get s400 => Color(_shade400);
  final int _shade400;

  /// The middle shade. you only need to specify this
  /// if it is different from the primary shade.
  Color get s500 => _shade500 != null ? Color(_shade500!) : this;
  final int? _shade500;

  /// The fifth darkest shade.
  Color get s600 => Color(_shade600);
  final int _shade600;

  /// The fourth darkest shade.
  Color get s700 => Color(_shade700);
  final int _shade700;

  /// The third darkest shade.
  Color get s800 => Color(_shade800);
  final int _shade800;

  /// The second darkest shade.
  Color get s900 => Color(_shade900);
  final int _shade900;

  /// The darkest shade.
  Color get s950 => Color(_shade950);
  final int _shade950;
}