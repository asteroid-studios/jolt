import 'package:flutter/rendering.dart';
import 'package:jolt/jolt.dart';
import 'package:flutter/services.dart';

// TODO add an option for haptic feedback
///
class JoltRefreshIndicator extends StatefulWidget {
  ///
  const JoltRefreshIndicator({
    required this.indicator,
    required this.onRefresh,
    this.refreshOffset = 48,
    this.backgroundColor,
    this.hapticFeedback = true,
    super.key,
  });

  ///
  // ignore: avoid_positional_boolean_parameters
  final Widget Function(bool refreshing, double offset) indicator;

  ///
  final Future<void> Function()? onRefresh;

  ///
  final Color? backgroundColor;

  ///
  final double refreshOffset;

  ///
  final bool hapticFeedback;

  @override
  State<JoltRefreshIndicator> createState() => _RefreshIndicatorState();
}

class _RefreshIndicatorState extends State<JoltRefreshIndicator> {
  bool readyToRefresh = false;
  bool refreshing = false;

  void triggerOnRefresh() {
    if (!refreshing) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => setState(() => refreshing = true));
      widget.onRefresh?.call().then((value) {
        setState(() {
          refreshing = false;
          readyToRefresh = false;
        });
      });
    }
  }

  void prepRefresh() {
    if (!readyToRefresh) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => readyToRefresh = true);
        if (widget.hapticFeedback) HapticFeedback.lightImpact();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onRefresh == null) return const SizedBox.shrink();

    // TODO https://linear.app/asteroid-studios/issue/AST-91/refresh-doesnt-work-on-android

    return ListenableBuilder(
      listenable: Scrollable.of(context).position,
      builder: (context, child) {
        // final physics = Scrollable.of(context).position.physics;
        // final isClamping = physics is ClampingScrollPhysics;
        // assert(!isClamping, 'The physics must not be ClampingScrollPhysics');
        final offset = Scrollable.maybeOf(context)?.position.pixels ?? 0;

        // If the indicator is in the refreshing state
        // and the user lets go of their finger,
        // then trigger the onRefresh callback
        if (readyToRefresh && offset >= 0) triggerOnRefresh();

        if (offset < 0 || readyToRefresh) {
          if (offset < -widget.refreshOffset) prepRefresh();
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
                    maxHeight: readyToRefresh ? double.infinity : offset.abs(),
                  ),
                  child: widget.indicator(readyToRefresh, offset),
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
