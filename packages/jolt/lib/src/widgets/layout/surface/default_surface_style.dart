import 'package:jolt/jolt.dart';

///
class DefaultSurfaceStyle extends InheritedTheme {
  ///
  const DefaultSurfaceStyle({
    required this.style,
    required super.child,
    super.key,
  });

  ///
  final SurfaceStyle style;

  @override
  bool updateShouldNotify(DefaultSurfaceStyle oldWidget) {
    return style != oldWidget.style;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DefaultSurfaceStyle(
      style: style,
      child: child,
    );
  }

  /// Return the closest SurfaceStyle from the currentContext
  static SurfaceStyle of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<DefaultSurfaceStyle>()
            ?.style ??
        context.inherited.widgetTheme.surfaceStyle;
  }

  /// Return the closest SurfaceStyle from the currentContext
  static SurfaceStyle? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DefaultSurfaceStyle>()
        ?.style;
  }

  /// Merge the current SurfaceStyle with a new one.
  static Widget merge({
    required SurfaceStyle Function(BuildContext) style,
    required Widget child,
    Key? key,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = DefaultSurfaceStyle.maybeOf(context);
        final newStyle = style(context);
        return DefaultSurfaceStyle(
          key: key,
          style: parent?.merge(newStyle) ?? newStyle,
          child: child,
        );
      },
    );
  }
}
