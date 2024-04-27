import 'package:ui/ui.dart';

///
class LoadMoreIndicator extends StatelessWidget {
  ///
  const LoadMoreIndicator({
    required this.onLoadMore,
    this.backgroundColor,
    super.key,
  });

  ///
  final Color? backgroundColor;

  ///
  final Future<void> Function()? onLoadMore;

  @override
  Widget build(BuildContext context) {
    return JoltLoadMoreIndicator(
      indicator: (bool loading) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: loading
              ? Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: backgroundColor,
                    padding: EdgeInsets.all(Spacing.lg),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                )
              : SizedBox(),
        );
      },
      onLoadMore: onLoadMore,
    );
  }
}
