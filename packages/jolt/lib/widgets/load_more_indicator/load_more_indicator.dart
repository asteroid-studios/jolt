// Wondering if I can listen check when scroll position is at the end and trigger then

import 'package:jolt/jolt.dart';

///
class JoltLoadMoreIndicator extends StatefulWidget {
  ///
  const JoltLoadMoreIndicator({
    required this.indicator,
    required this.onLoadMore,
    super.key,
  });

  ///
  // ignore: avoid_positional_boolean_parameters
  final Widget Function(bool loading) indicator;

  ///
  final Future<void> Function()? onLoadMore;

  @override
  State<JoltLoadMoreIndicator> createState() => _LoadMoreIndicatorState();
}

class _LoadMoreIndicatorState extends State<JoltLoadMoreIndicator> {
  // Last position defaults to a negative value
  // to make sure load more is triggered if the page is not full on load.
  double lastPosition = -50;
  bool loadingMore = false;
  bool loaded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      setState(() => loaded = true);
    });
    super.initState();
  }

  void loadMore(double position) {
    if (loaded && !loadingMore && (position - lastPosition).abs() > 10) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          loadingMore = true;
          lastPosition = position;
        });
        widget.onLoadMore?.call().then((value) {
          setState(() => loadingMore = false);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onLoadMore == null) return const SizedBox.shrink();
    return ListenableBuilder(
      listenable: Scrollable.of(context).position,
      builder: (context, child) {
        final position = Scrollable.maybeOf(context)?.position;
        final hasDimensions = position?.hasContentDimensions ?? false;
        final scrollExtent = hasDimensions
            ? position?.maxScrollExtent ?? double.infinity
            : double.infinity;
        final offset = position?.pixels ?? 0;
        if (offset >= scrollExtent - 20) loadMore(offset);
        return widget.indicator(loadingMore);
      },
    );
  }
}
