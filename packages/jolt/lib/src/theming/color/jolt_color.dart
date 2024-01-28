import 'package:jolt/jolt.dart';
import 'package:jolt/src/theming/color/color_resolvers.dart';

const _pureWhite = const Color(0xFFFFFFFF);
const _pureBlack = const Color(0xFF000000);

/// A color that has a small table of related colors called a "swatch"
class JoltColor extends Color {
  /// Creates a swatch of colors
  ///
  /// - Provide a base [value] for the color.
  const JoltColor(
    super.value, {
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
    ColorResolvers? colorResolvers,
    this.opacity = 1.0,
  })  : _colorResolvers = colorResolvers ?? const ColorResolvers(),
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

  /// The lightest shade.
  JoltColor get s50 => _shiftPrimary(_shade50).withOpacity(opacity);
  final Color _shade50;

  /// The second lightest shade.
  JoltColor get s100 => _shiftPrimary(_shade100).withOpacity(opacity);
  final Color _shade100;

  /// The third lightest shade.
  JoltColor get s200 => _shiftPrimary(_shade200).withOpacity(opacity);
  final Color _shade200;

  /// The fourth lightest shade.
  JoltColor get s300 => _shiftPrimary(_shade300).withOpacity(opacity);
  final Color _shade300;

  /// The fifth lightest shade.
  JoltColor get s400 => _shiftPrimary(_shade400).withOpacity(opacity);
  final Color _shade400;

  /// The middle shade
  JoltColor get s500 => _shiftPrimary(_shade500).withOpacity(opacity);
  final Color _shade500;

  /// The fifth darkest shade.
  JoltColor get s600 => _shiftPrimary(_shade600).withOpacity(opacity);
  final Color _shade600;

  /// The fourth darkest shade.
  JoltColor get s700 => _shiftPrimary(_shade700).withOpacity(opacity);
  final Color _shade700;

  /// The third darkest shade.
  JoltColor get s800 => _shiftPrimary(_shade800).withOpacity(opacity);
  final Color _shade800;

  /// The second darkest shade.
  JoltColor get s900 => _shiftPrimary(_shade900).withOpacity(opacity);
  final Color _shade900;

  /// The darkest shade.
  JoltColor get s950 => _shiftPrimary(_shade950).withOpacity(opacity);
  final Color _shade950;

  /// Override the default color resolvers
  ///
  /// These are used to determine what colors to show on hover or focus
  /// for example
  final ColorResolvers _colorResolvers;

  /// The opacity of the color.
  @override
  final double opacity;

  /// Get a list of all the shades in the swatch.
  List<JoltColor> get shades => [
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

  /// This index of this shade relative to the others.
  int get shadeIndex {
    final index = shadesFull
        .indexWhere((c) => c.withOpacity(1).value == withOpacity(1).value);
    if (index == -1) return 0;
    return index;
  }

  /// Used for default Color resolvers
  ///
  /// Returns Color instead of JoltColor
  List<Color> get shadesFull => [
        if (_shade50 != _pureWhite) _pureWhite,
        _shade50,
        _shade100,
        _shade200,
        _shade300,
        _shade400,
        _shade500,
        _shade600,
        _shade700,
        _shade800,
        _shade900,
        _shade950,
        if (_shade950 != _pureBlack) _pureBlack,
      ];

  @override
  JoltColor withOpacity(double opacity) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'Opacity must be between 0 and 1',
    );
    final newValue = super.withOpacity(opacity);
    return copyWith(
      opacity: opacity,
      value: newValue,
    );
  }

  /// Copy with new values.
  JoltColor copyWith({
    Color? value,
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
    ColorResolvers? colorResolvers,
  }) {
    return JoltColor(
      value?.value ?? this.value,
      shade50: shade50 ?? _shade50,
      shade100: shade100 ?? _shade100,
      shade200: shade200 ?? _shade200,
      shade300: shade300 ?? _shade300,
      shade400: shade400 ?? _shade400,
      shade500: shade500 ?? _shade500,
      shade600: shade600 ?? _shade600,
      shade700: shade700 ?? _shade700,
      shade800: shade800 ?? _shade800,
      shade900: shade900 ?? _shade900,
      shade950: shade950 ?? _shade950,
      colorResolvers: colorResolvers ?? _colorResolvers,
      opacity: opacity ?? this.opacity,
    );
  }

  /// Create a new [JoltColor] from a [JoltColor].
  JoltColor _shiftPrimary(
    Color value, {
    double opacity = 1.0,
  }) {
    // Returns a JoltColor rather than using copyWith
    // so that default color resolvers can be used.
    return JoltColor(
      value.value,
      shade50: _shade50,
      shade100: _shade100,
      shade200: _shade200,
      shade300: _shade300,
      shade400: _shade400,
      shade500: _shade500,
      shade600: _shade600,
      shade700: _shade700,
      shade800: _shade800,
      shade900: _shade900,
      shade950: _shade950,
      opacity: opacity,
    );
  }
}

///
extension JoltColorX on JoltColor {
  ///
  ColorAs get as => ColorAs(color: this);
}

///
class ColorAs {
  ///
  const ColorAs({
    required JoltColor color,
  }) : _color = color;

  final JoltColor _color;

  /// Resolve the background color from context.
  Color background(BuildContext context) =>
      _color._colorResolvers.backgroundColorResolver.call(_color, context);

  /// Resolve the border color from context.
  Color border(BuildContext context) =>
      _color._colorResolvers.borderColorResolver.call(_color, context);

  /// Resolve the foreground color from context.
  Color foreground(BuildContext context) =>
      _color._colorResolvers.foregroundColorResolver.call(_color, context);
}

///
class ColorResolversFromColorWithContext {
  ///
  const ColorResolversFromColorWithContext({
    required JoltColor color,
    required BuildContext context,
  })  : _color = color,
        _context = context;

  final JoltColor _color;
  final BuildContext _context;

  /// Resolve the background color from context.
  Color get background =>
      _color._colorResolvers.backgroundColorResolver.call(_color, _context);

  /// Resolve the border color from context.
  Color get border =>
      _color._colorResolvers.borderColorResolver.call(_color, _context);

  /// Resolve the foreground color from context.
  Color get foreground =>
      _color._colorResolvers.foregroundColorResolver.call(_color, _context);
}
