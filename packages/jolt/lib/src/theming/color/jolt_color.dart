import 'package:collection/collection.dart';

import 'package:jolt/jolt.dart';

/// A color that has a small table of related colors called a "swatch"
class JoltColor extends Color {
  /// Creates a swatch of colors
  ///
  /// - Provide a base [value] for the color.
  /// - [foreground] should contrast well on top of the base color
  /// - [onHovered] is what will be used when the user hovers over the color.
  /// - [onFocused] is what will be used when the color is focused.
  ///
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
    Color? foreground,
    Color? foregroundLight,
    Color? onDisabled,
    Color? onDragged,
    Color? onFocused,
    Color? onHovered,
    this.opacity = 1.0,
  })  : _foreground = foreground,
        _foregroundLight = foregroundLight,
        _onHovered = onHovered,
        _onFocused = onFocused,
        _onDisabled = onDisabled,
        _onDragged = onDragged,
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
  Color get foreground => _foreground ?? _defaultForeground;
  final Color? _foreground;

  /// A softer variation of the foreground color
  Color get foregroundLight => _foregroundLight ?? _defaultForegroundLight;
  final Color? _foregroundLight;

  /// The color to show when the user hovers over the base color.
  Color get onHovered =>
      (_onHovered ?? defaultHoveredOrFocused).withOpacity(_effectOpacity);
  final Color? _onHovered;

  /// The color to show when the base color is focused.
  Color get onFocused =>
      (_onFocused ?? defaultHoveredOrFocused).withOpacity(_effectOpacity);
  final Color? _onFocused;

  /// The color to show when the base color is disabled.
  Color get onDisabled =>
      (_onDisabled ?? defaultDraggedOrDisabled).withOpacity(_effectOpacity);
  final Color? _onDisabled;

  /// The color to show when the base color is dragged.
  Color get onDragged =>
      (_onDragged ?? defaultDraggedOrDisabled).withOpacity(_effectOpacity);
  final Color? _onDragged;

  double get _effectOpacity => opacity > 0 ? opacity : 1;

  /// The lightest shade.
  JoltColor get s50 => toJoltColor(Shade.s50).withOpacity(opacity);
  final Color _shade50;

  /// The second lightest shade.
  JoltColor get s100 => toJoltColor(Shade.s100).withOpacity(opacity);
  final Color _shade100;

  /// The third lightest shade.
  JoltColor get s200 => toJoltColor(Shade.s200).withOpacity(opacity);
  final Color _shade200;

  /// The fourth lightest shade.
  JoltColor get s300 => toJoltColor(Shade.s300).withOpacity(opacity);
  final Color _shade300;

  /// The fifth lightest shade.
  JoltColor get s400 => toJoltColor(Shade.s400).withOpacity(opacity);
  final Color _shade400;

  /// The middle shade
  JoltColor get s500 => toJoltColor(Shade.s500).withOpacity(opacity);
  final Color _shade500;

  /// The fifth darkest shade.
  JoltColor get s600 => toJoltColor(Shade.s600).withOpacity(opacity);
  final Color _shade600;

  /// The fourth darkest shade.
  JoltColor get s700 => toJoltColor(Shade.s700).withOpacity(opacity);
  final Color _shade700;

  /// The third darkest shade.
  JoltColor get s800 => toJoltColor(Shade.s800).withOpacity(opacity);
  final Color _shade800;

  /// The second darkest shade.
  JoltColor get s900 => toJoltColor(Shade.s900).withOpacity(opacity);
  final Color _shade900;

  /// The darkest shade.
  JoltColor get s950 => toJoltColor(Shade.s950).withOpacity(opacity);
  final Color _shade950;

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

  @override
  JoltColor withOpacity(double opacity) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'Opacity must be between 0 and 1',
    );
    final newValue = super.withOpacity(opacity);
    return copyWith(
      opacity: opacity,
      primary: newValue,
    );
  }

  /// Copy with new values.
  JoltColor copyWith({
    Color? primary,
    Color? foreground,
    Color? foregroundLight,
    Color? onHovered,
    Color? onFocused,
    Color? onDisabled,
    Color? onDragged,
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
      primary?.value ?? value,
      foreground: foreground ?? _foreground,
      foregroundLight: foregroundLight ?? _foregroundLight,
      onHovered: onHovered ?? _onHovered,
      onFocused: onFocused ?? _onFocused,
      onDisabled: onDisabled ?? _onDisabled,
      onDragged: onDragged ?? _onDragged,
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
      opacity: opacity ?? this.opacity,
    );
  }

  /// Create a new [JoltColor] from a [JoltColor].
  JoltColor toJoltColor(
    Shade value, {
    Shade? foreground,
    Shade? foregroundLight,
    Shade? onHovered,
    Shade? onFocused,
    Shade? onDisabled,
    Shade? onDragged,
    double opacity = 1.0,
  }) {
    // Returns a JoltColor rather than using copyWith so that foreground and
    // interaction state colors will be generated if left out.
    return JoltColor(
      _colorFromShade(value)!.value,
      foreground: _colorFromShade(foreground),
      foregroundLight: _colorFromShade(foregroundLight),
      onHovered: _colorFromShade(onHovered),
      onFocused: _colorFromShade(onFocused),
      onDisabled: _colorFromShade(onDisabled),
      onDragged: _colorFromShade(onDragged),
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

/// The shades available in a [JoltColor].
enum Shade {
  /// Pure white
  white,

  /// The lightest shade.
  s50,

  /// The second lightest shade.
  s100,

  /// The third lightest shade.
  s200,

  /// The fourth lightest shade.
  s300,

  /// The fifth lightest shade.
  s400,

  /// The middle shade
  s500,

  /// The fifth darkest shade.
  s600,

  /// The fourth darkest shade.
  s700,

  /// The third darkest shade.
  s800,

  /// The second darkest shade.
  s900,

  /// The darkest shade.
  s950,

  /// Pure black
  black,
}

extension _DefaultColorExtensions on JoltColor {
  /// Pure white
  Color get _white => const Color(0xFFFFFFFF);

  /// Pure black
  Color get _black => const Color(0xFF000000);

  /// Used for shade matching
  List<Color> get fullShades => [
        _white,
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
        _black,
      ];

  int get shadeIndex => fullShades.indexWhere((c) => c.value == value);

  int newShadeIndex(int n) => isLight ? shadeIndex + n : shadeIndex - n;

  Color get _defaultForeground {
    if (isLight) return _shade950;
    return _shade50;
  }

  Color get _defaultForegroundLight {
    // TODO This could clash is the value is 400 or 600
    if (isLight) return _shade400;
    return _shade600;
  }

  Color get defaultHoveredOrFocused {
    // If user has configured color wrong and value is not in shade list
    if (shadeIndex == -1) {
      if (isLight) return _shade600;
      return _shade400;
    }
    // Create a new index that is 2 shades lighter or darker
    // Return the first shade that is not null
    // fallbacks are if the current index is out of bounds

    // General concept -> if shade is closer to ends
    // make the difference more extreme, middle should be less
    final middle = fullShades.length / 2;
    final diff = fullShades.length / 4;
    final lowerEnd = middle - diff;
    final higherEnd = middle + diff;
    final isInMiddle = shadeIndex >= lowerEnd && shadeIndex <= higherEnd;
    final newIndex = isInMiddle ? 1 : 2;

    return fullShades.elementAtOrNull(newShadeIndex(newIndex)) ??
        fullShades.elementAtOrNull(newShadeIndex(1)) ??
        fullShades[shadeIndex];
  }

  Color get defaultDraggedOrDisabled {
    // If user has configured color wrong and value is not in shade list
    if (shadeIndex == -1) {
      if (isLight) return _shade400;
      return _shade600;
    }
    // Create a new index that is 2 shades lighter or darker
    // Return the first shade that is not null
    // fallbacks are if the current index is out of bounds
    return fullShades.elementAtOrNull(newShadeIndex(-2)) ??
        fullShades.elementAtOrNull(newShadeIndex(-1)) ??
        fullShades.elementAtOrNull(newShadeIndex(0)) ??
        _shade500;
  }

  Color? _colorFromShade(Shade? shade) {
    if (shade == null) return null;
    switch (shade) {
      case Shade.white:
        return _white;
      case Shade.s50:
        return _shade50;
      case Shade.s100:
        return _shade100;
      case Shade.s200:
        return _shade200;
      case Shade.s300:
        return _shade300;
      case Shade.s400:
        return _shade400;
      case Shade.s500:
        return _shade500;
      case Shade.s600:
        return _shade600;
      case Shade.s700:
        return _shade700;
      case Shade.s800:
        return _shade800;
      case Shade.s900:
        return _shade900;
      case Shade.s950:
        return _shade950;
      case Shade.black:
        return _black;
    }
  }
}
