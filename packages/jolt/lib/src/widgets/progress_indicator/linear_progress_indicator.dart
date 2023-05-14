import 'package:flutter_animate/flutter_animate.dart';

import 'package:jolt/jolt.dart';

///
class LinearProgressIndicator extends StatelessWidget {
  ///
  const LinearProgressIndicator({
    this.width,
    this.color,
    this.backgroundOpacity,
    this.duration,
    super.key,
  });

  ///
  final double? width;

  ///
  final Color? color;

  ///
  final double? backgroundOpacity;

  ///
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final theme = context.widgetTheme.progressIndicator;
    final width = this.width ?? theme.linearIndicatorWidth ?? 4;
    final backgroundOpacity =
        this.backgroundOpacity ?? theme.linearIndicatorBackgroundOpacity;
    final color = this.color ?? theme.color ?? context.color.primary;
    final duration = this.duration ??
        theme.circularIndicatorDuration ??
        const Duration(milliseconds: 1000);
    return Container(
      color: color.withOpacity(backgroundOpacity),
      height: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: color,
              height: width,
              width: constraints.maxWidth / 2,
            ).animate(onPlay: (controller) => controller.repeat()).moveX(
                  duration: duration,
                  begin: -constraints.maxWidth / 2,
                  end: constraints.maxWidth,
                );
          },
        ),
      ),
    );
  }
}
