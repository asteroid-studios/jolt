import 'dart:math';

import 'package:ui/ui.dart';

///
class RefreshIndicator extends StatelessWidget {
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

  /// Trigger the refresh indicator programmatically
  ///
  /// Will only work if there is a [RefreshIndicator] present in the ScrollArea
  ///
  /// Useful to trigger a refresh from a button on Desktop or Web
  static void triggerRefresh(BuildContext context) {
    PrimaryScrollController.of(context).animateTo(
      -scrollOffset - 5,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  /// The distance after which the onRefresh will trigger
  static double get scrollOffset => 48;

  @override
  Widget build(BuildContext context) {
    return JoltRefreshIndicator(
      refreshOffset: scrollOffset,
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
                        color: Colors.background.foreground.withOpacity(0.5),
                      )
                    : Opacity(
                        key: const Key('trigger'),
                        opacity: min(1, max(0, 1 * -(offset / scrollOffset))),
                        child: Transform.rotate(
                          angle: -(offset * pi) / 60,
                          child: Icon(
                            IconsDuotone.arrowClockwise,
                            size: Fonts.heading.fontSize,
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
