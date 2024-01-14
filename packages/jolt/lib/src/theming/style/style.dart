import 'package:flutter/widgets.dart';
import 'package:jolt/src/widgets/layout/surface/surface_style_new.dart';

/// All Widget Styles in Jolt should implement this class
///
/// A style must implement the [merge] method, to allow for merging of styles
abstract class Style<T extends Style<T>> {
  /// Merge this style with a higher priority style
  /// favouring the higher priority style
  T merge(T? style);

  /// Resolve a final style based on the style hierarchy
  static T? resolveAll<T extends Style<T>>(
    BuildContext context, {
    required T widgetStyle,
    T? style,
  }) {
    // TODO replace with widget theme style.
    final widgetThemeStyle = DefaultStyle.of<T>(context).style;
    final defaultStyle = DefaultStyle.of<T>(context).style;
    return widgetStyle.merge(widgetThemeStyle).merge(defaultStyle).merge(style);
  }
}

/// A function that resolves a style from a [BuildContext]
typedef StyleResolver<T extends Style<T>> = T Function(BuildContext context);

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultStyle(
      style: SurfaceStyle(),
      child: Builder(
        builder: (context) {
          // TODO test
          final style = DefaultStyle.of<SurfaceStyle>(context).style;
          return const Placeholder();
        },
      ),
    );
  }
}

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
  static DefaultStyle<T> of<T>(BuildContext context) {
    final inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<DefaultStyle<T>>();
    if (inheritedWidget == null) {
      throw FlutterError(
          'StyleInheritedWidget.of() called with a context that does not contain an StyleInheritedWidget<$T>.');
    }
    return inheritedWidget;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

/// A function that builds a style from a [BuildContext]
typedef StyleBuilder<T extends Style<T>> = T Function(BuildContext context);

// TODO Better DefaultStyle widget, allow with FallbackStyle widget for use in widgets like Surface

// TODO also consider allowing a list of styles, rather than a single one.