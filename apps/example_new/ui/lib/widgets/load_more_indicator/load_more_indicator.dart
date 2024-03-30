import 'package:ui/ui.dart';

///
class LoadMoreIndicator extends StatelessWidget with ThemeValues {
  ///
  const LoadMoreIndicator({
    required this.onLoadMore,
    this.safeArea = false,
    super.key,
  });

  ///
  final bool safeArea;

  ///
  final Future<void> Function()? onLoadMore;

  @override
  Widget build(BuildContext context) {
    return JoltLoadMoreIndicator(
      indicator: (bool loading) {
        return AnimatedOpacity(
          opacity: loading ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: SafeArea(
            top: false,
            bottom: safeArea,
            left: false,
            right: false,
            child: Container(
              color: color.surface.weaken(),
              padding: EdgeInsets.all(Spacing.lg),
              child: Text(
                'Loading more',
                style: text.body.lg.colored(color.surface.as.foregroundLight),
              ),
            ),
          ),
        );
      },
      onLoadMore: onLoadMore,
    );
  }
}
