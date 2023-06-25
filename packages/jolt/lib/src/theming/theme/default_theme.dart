import 'package:jolt/jolt.dart';

/// Wrap a section of the widget tree with a theme which will be inherited by
/// all children.
class DefaultTheme extends InheritedTheme {
  /// Wrap a section of the widget tree with a theme which will be inherited by
  /// all children.
  const DefaultTheme({
    required this.data,
    required super.child,
    super.key,
  });

  /// The theme data to use for this section of the widget tree.
  final Theme data;

  @override
  bool updateShouldNotify(DefaultTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DefaultTheme(data: data, child: child);
  }
}
