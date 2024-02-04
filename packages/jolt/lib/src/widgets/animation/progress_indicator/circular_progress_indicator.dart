import 'package:flutter_animate/flutter_animate.dart';

import 'package:jolt/jolt.dart';

///
class CircularProgressIndicator extends StatelessWidget {
  ///
  const CircularProgressIndicator({
    this.icon,
    this.widget,
    this.color,
    this.size,
    this.duration,
    super.key,
  });

  ///
  final Color? color;

  ///
  final IconData? icon;

  ///
  final Widget? widget;

  ///
  final Duration? duration;

  ///
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = context.inherited.widgetTheme.progressIndicator;
    // TODO change this to default to text color ie foreground.
    // Same with the size.
    final color = this.color ?? SurfaceColor.of(context).as.foreground(context);
    final size = this.size ?? theme.circularIndicatorSize;
    final icon =
        this.icon ?? theme.circularIndicatorIcon ?? IconsDuotone.circleNotch;
    final duration = this.duration ?? theme.circularIndicatorDuration;
    final widget = this.widget ??
        theme.circularIndicatorWidget ??
        Icon(
          icon,
          color: color,
          size: size,
        );

    if (duration == Duration.zero) return widget;

    return widget
        .animate(onPlay: (controller) => controller.repeat())
        .rotate(duration: duration);
  }
}
