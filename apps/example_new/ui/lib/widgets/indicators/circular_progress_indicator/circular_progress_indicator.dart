import 'package:flutter_animate/flutter_animate.dart';

import 'package:ui/ui.dart';

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
    // final theme = context.inherited.widgetTheme.progressIndicator;
    // // TODO change this to default to text color ie foreground.
    // // Same with the size.
    // final color = this.color ?? SurfaceColor.of(context).foreground(context);
    // final size = this.size ?? theme.circularIndicatorSize;
    // final icon =
    //     this.icon ?? theme.circularIndicatorIcon ?? IconsDuotone.circleNotch;
    final duration = this.duration ?? Duration(milliseconds: 2000);
    // final widget = this.widget ??
    //     theme.circularIndicatorWidget ??
    //     Icon(
    //       icon,
    //       color: color,
    //       size: size,
    //     );

    final widget = Icon(
      IconsDuotone.circleNotch,
      size: Fonts.heading.fontSize,
      color: color,
    );

    if (duration == Duration.zero) return widget;

    return widget.animate(onPlay: (controller) => controller.repeat()).rotate(duration: duration);
  }
}
