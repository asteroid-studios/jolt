import 'package:flutter_animate/flutter_animate.dart';

import 'package:jolt/jolt.dart';

///
class LinearProgressIndicator extends StatelessWidget {
  ///
  const LinearProgressIndicator({
    this.lineWidth,
    this.color,
    this.backgroundOpacity,
    this.duration,
    super.key,
  });

  ///
  final double? lineWidth;

  ///
  final Color? color;

  ///
  final double? backgroundOpacity;

  ///
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final theme = context.inherited.widgetTheme.progressIndicator;
    final width = lineWidth ?? theme.linearIndicatorWidth;
    final backgroundOpacity =
        this.backgroundOpacity ?? theme.linearIndicatorBackgroundOpacity;
    final color = this.color ?? theme.color ?? context.color.primary;
    final duration = this.duration ?? theme.linearIndicatorDuration;
    final borderRadius =
        theme.linearIndicatorBorderRadius ?? context.borderRadius.zero;
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color.withOpacity(backgroundOpacity),
        ),
        height: width,
        child: Align(
          alignment: Alignment.centerLeft,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: color,
                ),
                height: width,
                width: constraints.maxWidth * 0.75,
              ).animate(onPlay: (controller) => controller.repeat()).moveX(
                    duration: duration,
                    begin: -constraints.maxWidth * 0.75,
                    end: constraints.maxWidth,
                  );
            },
          ),
        ),
      ),
    );
  }
}
