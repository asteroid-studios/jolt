import 'package:jolt/jolt.dart';

/// A function that resolves a style from a [BuildContext]
typedef StyleResolver<T> = T Function(BuildContext context);

///
class InheritedStyle<T> extends InheritedWidget {
  ///
  const InheritedStyle({
    required this.style,
    required super.child,
    super.key,
  });

  ///
  final StyleResolver<T> style;

  @override
  bool updateShouldNotify(covariant InheritedStyle<T> oldWidget) {
    return oldWidget.style != style;
  }

  /// Helper method to access the nearest DefaultStyle in the widget tree
  static T? maybeOf<T>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedStyle<T>>()?.style(
            context,
          );
}
