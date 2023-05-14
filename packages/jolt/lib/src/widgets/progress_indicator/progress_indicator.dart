import 'package:flutter_animate/flutter_animate.dart';

import 'package:jolt/jolt.dart';

///
class ProgressIndicator extends StatelessWidget {
  ///
  const ProgressIndicator({
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
    final theme = context.widgetTheme.progressIndicator;
    final icon = this.icon ?? theme.icon ?? Icons.duotone.circleNotch;
    final color = this.color ?? theme.color ?? context.color.primary;
    final size = this.size ?? theme.size;
    final duration = this.duration ??
        theme.durationOfRotation ??
        const Duration(milliseconds: 1500);
    final widget = this.widget ??
        theme.widget ??
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
