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
    this.opacity = 1.0,
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
  Color get highlight => Color(_shadeHighlight).withOpacity(opacity);
  final int _shadeHighlight;

  /// The lightest shade.
  Color get s50 => Color(_shade50).withOpacity(opacity);
  final int _shade50;

  /// The second lightest shade.
  Color get s100 => Color(_shade100).withOpacity(opacity);
  final int _shade100;

  /// The third lightest shade.
  Color get s200 => Color(_shade200).withOpacity(opacity);
  final int _shade200;

  /// The fourth lightest shade.
  Color get s300 => Color(_shade300).withOpacity(opacity);
  final int _shade300;

  /// The fifth lightest shade.
  Color get s400 => Color(_shade400).withOpacity(opacity);
  final int _shade400;

  /// The middle shade. you only need to specify this
  /// if it is different from the primary shade.
  Color get s500 => _shade500 != null ? Color(_shade500!) : this;
  final int? _shade500;

  /// The fifth darkest shade.
  Color get s600 => Color(_shade600).withOpacity(opacity);
  final int _shade600;

  /// The fourth darkest shade.
  Color get s700 => Color(_shade700).withOpacity(opacity);
  final int _shade700;

  /// The third darkest shade.
  Color get s800 => Color(_shade800).withOpacity(opacity);
  final int _shade800;

  /// The second darkest shade.
  Color get s900 => Color(_shade900).withOpacity(opacity);
  final int _shade900;

  /// The darkest shade.
  Color get s950 => Color(_shade950).withOpacity(opacity);
  final int _shade950;

  /// The opacity of the color.
  @override
  final double opacity;

  /// Get a list of all the shades in the swatch.
  List<Color> get shades => [
        s50,
        s100,
        s200,
        s300,
        s400,
        s500,
        s600,
        s700,
        s800,
        s900,
        s950,
      ];

  @override
  JoltColor withOpacity(double opacity) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'Opacity must be between 0 and 1',
    );
    final newValue = super.withOpacity(opacity).value;
    return copyWith(
      opacity: opacity,
      primary: newValue,
    );
  }

  /// Copy with new values.
  JoltColor copyWith({
    int? primary,
    int? highlight,
    int? shade50,
    int? shade100,
    int? shade200,
    int? shade300,
    int? shade400,
    int? shade500,
    int? shade600,
    int? shade700,
    int? shade800,
    int? shade900,
    int? shade950,
    double? opacity,
  }) {
    return JoltColor(
      primary ?? value,
      highlight: highlight ?? _shadeHighlight,
      shade50: shade50 ?? _shade50,
      shade100: shade100 ?? _shade100,
      shade200: shade200 ?? _shade200,
      shade300: shade300 ?? _shade300,
      shade400: shade400 ?? _shade400,
      shade500: shade500 ?? _shade500!,
      shade600: shade600 ?? _shade600,
      shade700: shade700 ?? _shade700,
      shade800: shade800 ?? _shade800,
      shade900: shade900 ?? _shade900,
      shade950: shade950 ?? _shade950,
      opacity: opacity ?? this.opacity,
    );
  }
}
