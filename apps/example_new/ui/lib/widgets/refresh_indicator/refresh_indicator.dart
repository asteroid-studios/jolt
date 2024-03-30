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
      indicator: (bool refreshing) {
        return Container(
          // color: Colors.red.withOpacity(0.2),
          child: SafeArea(
            top: safeArea,
            bottom: false,
            left: false,
            right: false,
            child: Padding(
              padding: EdgeInsets.all(refreshing ? Spacing.lg : 0),
              child: Text(
                refreshing ? 'Refreshing' : 'Refresh?',
                style: text.body.lg.colored(color.surface.as.foregroundLight),
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
