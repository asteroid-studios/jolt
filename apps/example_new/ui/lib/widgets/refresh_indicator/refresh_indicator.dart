import 'dart:math';

import 'package:ui/ui.dart';

///
class RefreshIndicator extends StatelessWidget with ThemeValues {
  ///
  const RefreshIndicator({
    required this.onRefresh,
    this.safeArea = false,
    super.key,
  });

  ///
  final bool safeArea;

  ///
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return JoltRefreshIndicator(
      indicator: (bool refreshing, double offset) {
        return SafeArea(
          top: safeArea,
          bottom: false,
          left: false,
          right: false,
          child: Padding(
            padding: EdgeInsets.all(refreshing ? Spacing.lg : 0),
            child: ClipRect(
              child: refreshing
                  ? Text(
                      'Refreshing',
                      style: text.body.lg
                          .colored(color.surface.as.foregroundLight),
                    )
                  : Opacity(
                      opacity: min(1, max(0, 1 * -(offset / 100))),
                      child: Transform.rotate(
                        angle: -(offset * pi) / 60,
                        child: Icon(
                          IconsDuotone.arrowClockwise,
                          size: text.heading.sm.fontSize,
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
      onRefresh: onRefresh,
      backgroundColor: color.surface.weaken(),
    );
  }
}
