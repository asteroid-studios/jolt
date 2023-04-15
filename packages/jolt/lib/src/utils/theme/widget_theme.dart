import 'package:jolt/src/widgets/surface/surface_theme.dart';

export 'package:jolt/src/widgets/surface/surface_theme.dart';

/// Contains the default styling for all Jolt Widgets.
class WidgetTheme {
  /// Contains the default styling for all Jolt Widgets.
  const WidgetTheme({
    this.surface = const SurfaceTheme(),
  });

  /// The theme of a surface.
  final SurfaceTheme surface;
}
