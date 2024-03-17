import 'package:jolt_copy/jolt.dart';

/// Wrap a section of the widget tree with a theme which will be inherited by
/// all children.
class DefaultScaling extends StatelessWidget {
  /// Wrap a section of the widget tree with a theme which will be inherited by
  /// all children.
  const DefaultScaling({
    required this.scaling,
    required this.child,
    super.key,
  });

  /// The theme data to use for this section of the widget tree.
  final Scaling scaling;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Return the ThemeData from the closest instance of this class that encloses
  static Scaling of(BuildContext context) {
    final scaling =
        context.dependOnInheritedWidgetOfExactType<_InheritedScaling>();
    return scaling?.defaultScaling.scaling ?? const Scaling();
  }

  @override
  Widget build(BuildContext context) {
    final view = MediaQueryData.fromView(context.view.value);
    return _InheritedScaling(
      defaultScaling: this,
      child: MediaQuery(
        // Create a new textScale factor which combines
        // the platform and app values
        data: context.mediaQuery.copyWith(
          textScaleFactor: view.textScaleFactor * scaling.symbolScale,
        ),
        child: child,
      ),
    );
  }
}

class _InheritedScaling extends InheritedTheme {
  const _InheritedScaling({
    required this.defaultScaling,
    required super.child,
  });

  final DefaultScaling defaultScaling;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DefaultScaling(
      scaling: defaultScaling.scaling,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(_InheritedScaling old) =>
      defaultScaling.scaling != old.defaultScaling.scaling;
}
