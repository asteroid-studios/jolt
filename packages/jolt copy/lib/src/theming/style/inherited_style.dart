import 'package:jolt_copy/jolt.dart';
import 'package:nested/nested.dart';

/// A function that resolves a style from a [BuildContext]
typedef StyleResolver<T extends Style<T>> = T Function(
  BuildContext context,
);

///
class _InheritedStyle<T extends Style<T>> extends InheritedWidget {
  ///
  const _InheritedStyle({
    required this.style,
    required super.child,
    super.key,
  });

  final StyleResolver<T> style;

  @override
  bool updateShouldNotify(covariant _InheritedStyle oldWidget) {
    return oldWidget.style != style;
  }
}

///
class DefaultStyle<T extends Style<T>> extends _InheritedStyle<T> {
  ///
  const DefaultStyle({
    required super.style,
    required super.child,
    super.key,
  });

  /// Helper method to access the nearest DefaultStyle in the widget tree
  static T? maybeOf<T extends Style<T>>(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<DefaultStyle<T>>()
      ?.style(context);
}

///
class BaseStyle<T extends Style<T>> extends _InheritedStyle<T> {
  ///
  const BaseStyle({
    required super.style,
    required super.child,
    super.key,
  });

  /// Helper method to access the nearest BaseStyle in the widget tree
  static T? maybeOf<T extends Style<T>>(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<BaseStyle<T>>()
      ?.style(context);
}

///
class _WidgetStyleScope<T extends Style<T>> extends _InheritedStyle<T> {
  ///
  const _WidgetStyleScope({
    required super.style,
    required super.child,
    super.key,
  });
}

///
class WidgetStyle<T extends Style<T>> extends SingleChildStatelessWidget {
  ///
  const WidgetStyle(
    this.style, {
    super.key,
    super.child,
  });

  ///
  final StyleResolver<T> style;

  /// Helper method to access the nearest WidgetStyle in the widget tree
  static T? maybeOf<T extends Style<T>>(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_WidgetStyleScope<T>>()
      ?.style(context);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return _WidgetStyleScope(
      style: style,
      child: child ?? const SizedBox.shrink(),
    );
  }
}

// This is how I will do the JoltApp implementation
void test2() {
  final styles = [
    WidgetStyle((context) => SurfaceStyle()),
    WidgetStyle((context) => ButtonStyle()),
  ];
}
