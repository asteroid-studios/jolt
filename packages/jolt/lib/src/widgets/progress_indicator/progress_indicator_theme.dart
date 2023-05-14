import 'package:jolt/jolt.dart';

///
class ProgressIndicatorTheme {
  ///
  const ProgressIndicatorTheme({
    this.circularIndicatorIcon,
    this.circularIndicatorWidget,
    this.color,
    this.circularIndicatorSize,
    this.circularIndicatorDuration,
    this.linearIndicatorDuration,
    this.linearIndicatorWidth,
    this.linearIndicatorBackgroundOpacity = 0.2,
  });

  ///
  final IconData? circularIndicatorIcon;

  ///
  final double? circularIndicatorSize;

  ///
  final Color? color;

  ///
  final Duration? circularIndicatorDuration;

  /// A custom widget to spin.
  final Widget? circularIndicatorWidget;

  ///
  final Duration? linearIndicatorDuration;

  /// The widget of the linear indicator.
  final double? linearIndicatorWidth;

  ///
  final double linearIndicatorBackgroundOpacity;
}
