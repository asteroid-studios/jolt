import 'package:jolt/jolt.dart';

/// All Widget Styles in Jolt should implement this class
///
/// A style must implement the [merge] method, to allow for merging of styles
abstract class Style<T> {
  /// Merge this style with a higher priority style
  /// favouring the higher priority style
  T merge(T? style);

  /// Resolve a final style based on the style hierarchy
  static T resolveAll<T extends Style<T>>(
    BuildContext context, {
    required T rootStyle,
    T? inlineStyle,
  }) {
    final baseStyle = BaseStyle.maybeOf<T>(context);
    final widgetStyle = WidgetStyle.maybeOf<T>(context);
    final defaultStyle = DefaultStyle.maybeOf<T>(context);

    return rootStyle
        .merge(baseStyle)
        .merge(widgetStyle)
        .merge(defaultStyle)
        .merge(inlineStyle);
  }
}

///
extension StyleWidgetX on Widget {
  ///
  DefaultStyle<T> withStyle<T extends Style<T>>(StyleResolver<T> style) =>
      DefaultStyle<T>(
        style: style,
        child: this,
      );
}
