import 'package:collection/collection.dart';

import 'package:jolt/jolt.dart';

/// A function which returns a SurfaceColor from a Jolt Color
/// and some InteractionState
typedef SurfaceAdapter = SurfaceColor Function(
  JoltColor color,
  InteractionState? state,
);

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
    SurfaceAdapter? surfaceAdapter,
    this.opacity = 1.0,
  })  : _surfaceAdapter = surfaceAdapter,
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
  JoltColor get s50 => toJoltColor(_shade50).withOpacity(opacity);
  final Color _shade50;

  /// The second lightest shade.
  JoltColor get s100 => toJoltColor(_shade100).withOpacity(opacity);
  final Color _shade100;

  /// The third lightest shade.
  JoltColor get s200 => toJoltColor(_shade200).withOpacity(opacity);
  final Color _shade200;

  /// The fourth lightest shade.
  JoltColor get s300 => toJoltColor(_shade300).withOpacity(opacity);
  final Color _shade300;

  /// The fifth lightest shade.
  JoltColor get s400 => toJoltColor(_shade400).withOpacity(opacity);
  final Color _shade400;

  /// The middle shade
  JoltColor get s500 => toJoltColor(_shade500).withOpacity(opacity);
  final Color _shade500;

  /// The fifth darkest shade.
  JoltColor get s600 => toJoltColor(_shade600).withOpacity(opacity);
  final Color _shade600;

  /// The fourth darkest shade.
  JoltColor get s700 => toJoltColor(_shade700).withOpacity(opacity);
  final Color _shade700;

  /// The third darkest shade.
  JoltColor get s800 => toJoltColor(_shade800).withOpacity(opacity);
  final Color _shade800;

  /// The second darkest shade.
  JoltColor get s900 => toJoltColor(_shade900).withOpacity(opacity);
  final Color _shade900;

  /// The darkest shade.
  JoltColor get s950 => toJoltColor(_shade950).withOpacity(opacity);
  final Color _shade950;

  // The user passed function to turn this color
  // into a SurfaceColor from interaction state
  final SurfaceColor Function(JoltColor color, InteractionState? state)?
      _surfaceAdapter;

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
    SurfaceAdapter? surfaceAdapter,
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
      opacity: opacity ?? this.opacity,
      surfaceAdapter: surfaceAdapter ?? _surfaceAdapter,
    );
  }

  /// Create a new [JoltColor] from a [JoltColor].
  JoltColor toJoltColor(
    Color value, {
    double opacity = 1.0,
  }) {
    // Returns a JoltColor rather than using copyWith
    // so that surfaceAdapter will be generated
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

  /// Convert this color into a SurfaceColor from InteractionState
  SurfaceColor surface({InteractionState? state}) {
    return defaultSurfaceAdapter(state).merge(
      _surfaceAdapter?.call(this, state),
    );
  }
}

///
extension JoltColorX on JoltColor {
  ///
  Color get defaultForeground {
    if (isLight) return _shade950;
    return _shade50;
  }

  ///
  Color get defaultForegroundLight {
    // TODO This could clash is the value is 400 or 600
    if (isLight) return _shade400;
    return _shade600;
  }
}

extension _DefaultColorExtensions on JoltColor {
  SurfaceColor defaultSurfaceAdapter(InteractionState? state) {
    // TODO implement the default surface adapter.
    Color background = this;
    var foregroundColor = defaultForeground;
    var foregroundLightColor = defaultForegroundLight;
    if (state.isDisabled) {
      foregroundColor = foregroundColor.withOpacity(0.5);
      foregroundLightColor = foregroundLightColor.withOpacity(0.8);
    }
    if (state.isHovered) {
      background = defaultHoveredOrFocused;
    }
    if (state.isFocused) {
      background = defaultHoveredOrFocused;
    }
    // It's important not to pass a default border color
    // Because that will be primary in case of being focused.
    return SurfaceColor(
      background: background,
      foreground: foregroundColor,
      foregroundLight: foregroundLightColor,
    );
  }

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
}
