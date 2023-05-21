import 'package:jolt/jolt.dart';

/// Get the parent Surface
class InheritedSurface extends InheritedTheme {
  /// Wrap a section of the widget tree with a theme which will be inherited by
  /// all children.
  const InheritedSurface({
    required this.background,
    required super.child,
    super.key,
  });

  /// The background of the surface.
  final Color background;

  /// Return the Surface from the closest instance of this class that encloses
  static InheritedSurface? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedSurface>();
  }

  @override
  bool updateShouldNotify(InheritedSurface oldWidget) =>
      background != oldWidget.background;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return InheritedSurface(background: background, child: child);
  }
}
