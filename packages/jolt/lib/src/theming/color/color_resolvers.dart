import 'package:jolt/jolt.dart';

/// Return the appropriate shade of the color
/// based on the current interaction state
Color defaultBackgroundResolver(JoltColor color, BuildContext context) {
  // TODO if user has defined their own color resolver, get from context and use that instead

  final interaction = context.inherited.interactionState;

  if (interaction.isDisabled || interaction.isDragged) {
    // TODO does this make sense if transparent? maybe should be math.min
    return color.withOpacity(0.2);
  }
  if (interaction.isHovered || interaction.isFocused) {
    if (color.opacity == 0) {
      // TODO test
      return context.color.surface;
    }

    if (color.opacity > 0 && color.opacity < 0.5) return color.withOpacity(0.7);

    return color.newShade(context).withOpacity(1);
  }
  return color;
}

/// Return the appropriate shade of the color
/// based on the current interaction state
Color defaultBorderResolver(JoltColor color, BuildContext context) {
  // TODO if user has defined their own color resolver, get from context and use that instead

  final interaction = context.inherited.interactionState;
  if (interaction.isDisabled || interaction.isDragged) {
    // TODO does this make sense if transparent? maybe should be math.min
    return color.withOpacity(0.2);
  }
  if (interaction.isFocused) {
    // TODO if a colorful color, return white or black instead
    return context.color.primary;
  }
  if (interaction.isHovered) {
    if (color.opacity > 0 && color.opacity < 0.5) return color.withOpacity(0.7);
    return color.newShade(context).withOpacity(1);
  }
  return color;
}

/// Return the appropriate shade of the color
/// based on the current interaction state
Color defaultForegroundResolver(JoltColor color, BuildContext context) {
  // TODO if user has defined their own color resolver, get from context and use that instead

  final interaction = context.inherited.interactionState;
  late Color foregroundColor;
  if (color.opacity == 0) {
    foregroundColor = context.color.background.as.foreground(context);
  } else if (color.opacity < 0.5 &&
      !interaction.isHovered &&
      !interaction.isFocused) {
    foregroundColor = color.withOpacity(1);
  } else {
    foregroundColor =
        color.isLight ? color.s950.withOpacity(1) : color.s50.withOpacity(1);
  }
  // TODO if is foreground light, then return the light color
  // return color.isLight ? color.s400 : color.s600;
  // return color.s500;
  if (interaction.isDisabled || interaction.isDragged) {
    return foregroundColor.withOpacity(0.5);
  }
  return foregroundColor;
}

/// A function which returns a Color from a Jolt Color
/// based on the current context.
typedef ColorResolver = Color Function(JoltColor color, BuildContext context);

// Some helpers for the default resolvers.
extension _DefaultColorExtensions on JoltColor {
  int newIndex(int n) {
    final index = withOpacity(1).isLight ? shadeIndex + n : shadeIndex - n;
    if (index < 0 || index > shadesFull.length - 1) return newIndex(n - 1);
    // print('index: $index, old: ${this.shadeIndex}');
    // TODO not working with transparent. index always 0
    return index;
  }

  Color newShade(BuildContext context) {
    final isMaxInverse = (shadeIndex < 2 && context.color.isDark) ||
        (shadeIndex > 8 && context.color.isLight);

    final isMaxBrightness = (shadeIndex > 8 && context.color.isDark) ||
        (shadeIndex < 2 && context.color.isLight);

    final n = isMaxInverse
        ? 3
        : isMaxBrightness
            ? 2
            : 1;

    final fallback = isLight ? shadesFull.last : shadesFull.first;
    return shadesFull.elementAtOrNull(newIndex(n)) ?? fallback;
  }
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
