import 'package:jolt/jolt.dart';

/// Wrap a section of the widget tree with a theme which will be inherited by
/// all children.
class Scaling extends InheritedTheme {
  /// Wrap a section of the widget tree with a theme which will be inherited by
  /// all children.
  const Scaling({
    required this.data,
    required super.child,
    super.key,
  });

  /// The theme data to use for this section of the widget tree.
  final ScalingData data;

  /// Return the ThemeData from the closest instance of this class that encloses
  static ScalingData of(BuildContext context) {
    final scaling = context.dependOnInheritedWidgetOfExactType<Scaling>();
    return scaling?.data ?? const ScalingData();
  }

  @override
  bool updateShouldNotify(Scaling oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return Scaling(data: data, child: child);
  }
}

///
class ScalingData {
  ///
  const ScalingData({
    this.textScale = 1.0,
    this.spacingScale = 1.0,
  });

  ///
  final double textScale;

  ///
  final double spacingScale;
}
