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
        return AnimatedOpacity(
          opacity: loading ? 0.5 : 0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: backgroundColor,
            padding: EdgeInsets.all(Spacing.lg),
            child: const Center(child: CircularProgressIndicator()),
          ),
        );
      },
      onLoadMore: onLoadMore,
    );
  }
}
