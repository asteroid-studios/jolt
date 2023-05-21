import 'package:flutter/widgets.dart';

/// A color that has a small table of related colors called a "swatch"
class JoltColor extends Color {
  /// Creates a swatch of colors
  ///
  /// - Provide a base [value] for the color.
  /// - [onTop] should contrast well on top of the base color
  /// - [onHover] is what will be used when the user hovers over the color.
  /// - [onFocus] is what will be used when the color is focused.
  ///
  const JoltColor(
    super.value, {
    required Color onTop,
    required Color onHover,
    required Color onFocus,
    required Color shade50,
    required Color shade100,
    required Color shade200,
    required Color shade300,
    required Color shade400,
    required Color shade500,
    required Color shade600,
    required Color shade700,
    required Color shade800,
    required Color shade900,
    required Color shade950,
    this.opacity = 1.0,
  })  : _onTop = onTop,
        _onHover = onHover,
        _onFocus = onFocus,
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

  /// A color which will contrast well on top of the base color.
  Color get onTop => _onTop.withOpacity(opacity);
  final Color _onTop;

  /// The color to show when the user hovers over the base color.
  Color get onHover => _onHover.withOpacity(opacity);
  final Color _onHover;

  /// The color to show when the base color is focused.
  Color get onFocus => _onFocus.withOpacity(opacity);
  final Color _onFocus;

  /// The lightest shade.
  Color get s50 => _shade50.withOpacity(opacity);
  final Color _shade50;

  /// The second lightest shade.
  Color get s100 => _shade100.withOpacity(opacity);
  final Color _shade100;

  /// The third lightest shade.
  Color get s200 => _shade200.withOpacity(opacity);
  final Color _shade200;

  /// The fourth lightest shade.
  Color get s300 => _shade300.withOpacity(opacity);
  final Color _shade300;

  /// The fifth lightest shade.
  Color get s400 => _shade400.withOpacity(opacity);
  final Color _shade400;

  /// The middle shade
  Color get s500 => _shade500.withOpacity(opacity);
  final Color _shade500;

  /// The fifth darkest shade.
  Color get s600 => _shade600.withOpacity(opacity);
  final Color _shade600;

  /// The fourth darkest shade.
  Color get s700 => _shade700.withOpacity(opacity);
  final Color _shade700;

  /// The third darkest shade.
  Color get s800 => _shade800.withOpacity(opacity);
  final Color _shade800;

  /// The second darkest shade.
  Color get s900 => _shade900.withOpacity(opacity);
  final Color _shade900;

  /// The darkest shade.
  Color get s950 => _shade950.withOpacity(opacity);
  final Color _shade950;

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
    Color? onHover,
    Color? onTop,
    Color? onFocus,
    Color? shade50,
    Color? shade100,
    Color? shade200,
    Color? shade300,
    Color? shade400,
    Color? shade500,
    Color? shade600,
    Color? shade700,
    Color? shade800,
    Color? shade900,
    Color? shade950,
    double? opacity,
  }) {
    return JoltColor(
      primary ?? value,
      onHover: onHover ?? _onHover,
      onTop: onTop ?? _onTop,
      onFocus: onFocus ?? _onFocus,
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
