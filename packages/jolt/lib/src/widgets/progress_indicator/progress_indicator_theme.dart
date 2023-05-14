import 'package:jolt/jolt.dart';

///
class ProgressIndicatorTheme {
  ///
  const ProgressIndicatorTheme({
    this.icon,
    this.widget,
    this.color,
    this.size,
    this.durationOfRotation,
  });

  ///
  final IconData? icon;

  ///
  final double? size;

  ///
  final Color? color;

  ///
  final Duration? durationOfRotation;

  /// A custom widget to spin.
  final Widget? widget;
}
