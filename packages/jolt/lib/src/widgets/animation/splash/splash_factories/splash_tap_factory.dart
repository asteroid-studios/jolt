import 'dart:math';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jolt/jolt.dart';

///
class SplashTapFactory extends HookWidget {
  ///
  const SplashTapFactory({
    this.child,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 900),
    super.key,
  });

  /// Duration that the ripple animation will run for.
  final Duration duration;

  /// The curve to apply when animating the splash.
  final Curve curve;

  ///
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final color =
        DefaultTextStyle.of(context).style.color ?? context.color.primary;
    final offset = useState(Offset.zero);
    final size = useState(Size.zero);
    final splashController = useAnimationController();
    return Listener(
      onPointerDown: (event) {
        if (splashController.isAnimating) splashController.reset();
        size.value = context.findRenderObject()?.paintBounds.size ?? Size.zero;
        offset.value = event.localPosition;
        splashController
            .animateTo(1, curve: curve, duration: duration)
            .then((value) => splashController.reset());
      },
      child: AnimatedBuilder(
        animation: splashController,
        child: child,
        builder: (context, child) {
          return CustomPaint(
            painter: RipplePainter(
              offset: offset.value,
              circleRadius: splashController.value *
                  max(size.value.width, size.value.height) *
                  2,
              fillColor: color.withOpacity(
                1 - max(0.6, splashController.value),
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }
}
