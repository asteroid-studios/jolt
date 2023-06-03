import 'dart:ui';

import 'package:jolt/jolt.dart';

///
extension Defaults on BuildContext {
  ///
  DefaultMapping get defaults => DefaultMapping(this);
}

///
extension TextStyleHelper on TextStyle {
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

///
class DefaultMapping {
  ///
  const DefaultMapping(this.context);

  ///
  final BuildContext context;

  /// Default horizontal padding
  double get horizontalPadding => context.sizing.sm;

  /// Default vertical padding
  double get verticalPadding => context.sizing.xs;
}
