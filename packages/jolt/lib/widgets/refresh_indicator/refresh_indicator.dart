import 'package:jolt/jolt.dart';

// TODO make a load more which is the same thing in reverse.

///
class JoltRefreshIndicator extends StatefulWidget {
  ///
  const JoltRefreshIndicator({
    required this.indicator,
    required this.onRefresh,
    this.refreshOffset = 100,
    this.backgroundColor,
    super.key,
  });

  ///
  // ignore: avoid_positional_boolean_parameters
  final Widget Function(bool refreshing) indicator;

  ///
  final Future<void> Function()? onRefresh;

  ///
  final Color? backgroundColor;

  ///
  final double refreshOffset;

  @override
  State<JoltRefreshIndicator> createState() => _RefreshIndicatorState();
}

class _RefreshIndicatorState extends State<JoltRefreshIndicator> {
  bool refreshing = false;

  void refresh() {
    if (!refreshing) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => refreshing = true);
        widget.onRefresh?.call().then((value) {
          setState(() => refreshing = false);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onRefresh == null) return const SizedBox.shrink();
    return ListenableBuilder(
      listenable: Scrollable.of(context).position,
      builder: (context, child) {
        final offset = Scrollable.of(context).position.pixels;
        // if(position.pixels)
        if (offset < 0 || refreshing) {
          if (offset < -widget.refreshOffset) refresh();
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Transform.translate(
                  offset: Offset(0, offset / 2),
                  child: Transform.scale(
                    scale: 2,
                    child: Container(
                      color: widget.backgroundColor,
                      height: offset.abs(),
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: Container(
                  color: widget.backgroundColor,
                  constraints: BoxConstraints(
                    maxHeight: refreshing ? double.infinity : offset.abs(),
                  ),
                  child: Center(
                    child: widget.indicator(refreshing),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
