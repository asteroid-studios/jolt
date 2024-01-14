import 'package:jolt/jolt.dart';

/// A function which returns a Color from a Jolt Color
/// based on the current context.
typedef ColorResolver = Color Function(JoltColor color, BuildContext context);

// Some helpers for the default resolvers.
extension _DefaultColorExtensions on JoltColor {
  int newIndex(int n) => isLight ? shadeIndex + n : shadeIndex - n;

  Color newShade(int n) {
    final fallback = isLight ? shadesFull.last : shadesFull.first;
    return shadesFull.elementAtOrNull(newIndex(n)) ??
        shadesFull.elementAtOrNull(newIndex(1)) ??
        fallback;
  }

  bool get isMidShade => shadeIndex >= 3 && shadeIndex <= 7;
}

///
class ColorResolvers {
  ///
  const ColorResolvers({
    ColorResolver? background,
    ColorResolver? foreground,
    ColorResolver? border,
    // ColorResolver? shadowColorResolver,
    // ignore: avoid_field_initializers_in_const_classes
  })  : _backgroundColorResolver = background,
        _foregroundColorResolver = foreground,
        _borderColorResolver = border;
  // _shadowColorResolver = shadowColorResolver;

  /// Resolve the background color from
  /// the available shades and current context
  ColorResolver get backgroundColorResolver =>
      _backgroundColorResolver ?? defaultBackgroundResolver;
  final ColorResolver? _backgroundColorResolver;

  /// Resolve the foreground color from
  /// the available shades and current context
  ColorResolver get foregroundColorResolver =>
      _foregroundColorResolver ?? defaultForegroundResolver;
  final ColorResolver? _foregroundColorResolver;

  /// Resolve the border color from
  /// the available shades and current context
  ColorResolver get borderColorResolver =>
      _borderColorResolver ?? defaultBorderResolver;
  final ColorResolver? _borderColorResolver;

  ///
  // final Color? backgroundHoverOverride;

  ///
  // final Color? foregroundHoverOverride;
}

/// Return the appropriate shade of the color
/// based on the current interaction state
Color defaultBackgroundResolver(JoltColor color, BuildContext context) {
  final interaction = context.inherited.interactionState;

  if (interaction.isDisabled || interaction.isDragged) {
    return color.withOpacity(0.2);
  }
  if (interaction.isHovered || interaction.isFocused) {
    return color.newShade(color.isMidShade ? 1 : 2);
  }
  return color;
}

/// Return the appropriate shade of the color
/// based on the current interaction state
Color defaultBorderResolver(JoltColor color, BuildContext context) {
  final interaction = context.inherited.interactionState;
  if (interaction.isDisabled || interaction.isDragged) {
    return color.withOpacity(0.2);
  }
  if (interaction.isFocused) {
    return context.color.primary;
  }
  return color;
}

/// Return the appropriate shade of the color
/// based on the current interaction state
Color defaultForegroundResolver(JoltColor color, BuildContext context) {
  // TODO if is foreground light, then return the light color
  // return color.isLight ? color.s400 : color.s600;
  // return color.s500;
  return color.isLight ? color.s950 : color.s50;
}
