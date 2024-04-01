import 'dart:math';

import 'package:ui/ui.dart';

///
class RefreshIndicator extends StatelessWidget with ThemeValues {
  ///
  const RefreshIndicator({
    required this.onRefresh,
    this.backgroundColor,
    super.key,
  });

  ///
  final Color? backgroundColor;

  ///
  final Future<void> Function()? onRefresh;

  static void triggerRefresh(BuildContext context) {
    PrimaryScrollController.of(context).animateTo(
      -50,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return JoltRefreshIndicator(
      indicator: (bool refreshing, double offset) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(refreshing ? Spacing.lg : 0),
            child: ClipRect(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: refreshing
                    ? CircularProgressIndicator(
                        key: const Key('refreshing'),
                        color: color.background.as.foreground.withOpacity(0.5),
                      )
                    : Opacity(
                        key: const Key('trigger'),
                        opacity: min(1, max(0, 1 * -(offset / 48))),
                        child: Transform.rotate(
                          angle: -(offset * pi) / 60,
                          child: Icon(
                            IconsDuotone.arrowClockwise,
                            size: text.heading.fontSize,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        );
      },
      onRefresh: onRefresh,
      backgroundColor: backgroundColor,
    );
  }
}
