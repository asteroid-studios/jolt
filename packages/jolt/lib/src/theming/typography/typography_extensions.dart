import 'dart:ui';

import 'package:jolt/jolt.dart';

///
extension TypographyContextX on BuildContext {
  /// Returns the current typography from the theme.
  Typography get style => theme.typography;
}

///
extension TypographyThemeDataX on ThemeData {
  /// Returns the current typography.
  Typography get style => typography;
}

///
extension TextStyleX on TextStyle {
  ///
  TextStyle withColor([Color? color]) => copyWith(color: color);

  ///
  TextStyle withSize([double? size]) => copyWith(fontSize: size);

  ///
  TextStyle withFontVariationsFromWeight() => copyWith(
        fontVariations: [
          ...?fontVariations,
          if (fontWeight != null)
            FontVariation(
              FontVariationAxis.weight,
              fontWeight!.value.toDouble(),
            ),
        ],
      );
}
