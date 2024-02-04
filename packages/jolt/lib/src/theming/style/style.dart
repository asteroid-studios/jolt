import 'package:flutter/widgets.dart';

/// All Widget Styles in Jolt should implement this class
///
/// A style must implement the [merge] method, to allow for merging of styles
abstract class Style<T extends Style<T>> {
  /// Merge this style with a higher priority style
  /// favouring the higher priority style
  T merge(T? style);

  /// Resolve a final style based on the style hierarchy
  static T resolveAll<T extends Style<T>>(
    BuildContext context, {
    required T widgetStyle,
    T? style,
  }) {
    // TODO replace with widget theme style.
    // final widgetThemeStyle = DefaultStyle.maybeOf<T>(context)?.style;
    final fallbackStyle = FallbackStyle.maybeOf<T>(context)?.style;
    final defaultStyle = DefaultStyle.maybeOf<T>(context)?.style;

    return widgetStyle
        // .merge(widgetThemeStyle)
        .merge(fallbackStyle)
        .merge(defaultStyle)
        .merge(style);
  }
}

///
extension StyleWidgetX on Widget {
  ///
  DefaultStyle<T> withStyle<T>(T style) => DefaultStyle<T>(
        style: style,
        child: this,
      );
}

/// A function that resolves a style from a [BuildContext]
typedef StyleResolver<T extends Style<T>> = T Function(BuildContext context);

///
class DefaultStyle<Style> extends InheritedWidget {
  ///
  const DefaultStyle({
    required this.style,
    required super.child,
    super.key,
  });

  ///
  final Style style;

  /// Helper method to access the nearest DefaultStyle in the widget tree
  static DefaultStyle<T>? maybeOf<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DefaultStyle<T>>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

///
class FallbackStyle<Style> extends InheritedWidget {
  ///
  const FallbackStyle({
    required this.style,
    required super.child,
    super.key,
  });

  ///
  final Style? style;

  /// Helper method to access the nearest DefaultStyle in the widget tree
  static FallbackStyle<T>? maybeOf<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FallbackStyle<T>>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
