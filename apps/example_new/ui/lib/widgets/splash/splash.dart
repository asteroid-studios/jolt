import 'dart:async';
import 'dart:math';

import 'package:ui/ui.dart';

///
class Splash extends StatefulWidget {
  ///
  const Splash({super.key});

  ///
  @override
  State<Splash> createState() => SplashState();
}

///
class SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  ///
  Offset offset = Offset.zero;

  ///
  Size size = Size.zero;

  late StreamSubscription<PointerDownEvent> _subscription;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _subscription = Interaction.of(context).pointerDownEvents.stream.listen((event) {
      if (_controller.isAnimating) _controller.reset();
      if (!mounted) return;
      final style = SplashStyle.defaultStyle(context, this);
      size = context.findRenderObject()?.paintBounds.size ?? Size.zero;
      offset = Offset(event.localPosition.dx, event.localPosition.dy / 2);
      _controller
          .animateTo(
            1,
            curve: Curves.ease,
            duration: style.duration ?? const Duration(milliseconds: 900),
          )
          .then((value) => _controller.reset());
    });
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = SplashStyle.defaultStyle(context, this);
    final scale = style.scale ?? 1;
    final maxOpacity = style.maximumOpacity ?? 0.1;

    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _RipplePainter(
              offset: style.offset ?? offset,
              circleRadius: _controller.value * max(size.width, size.height) * scale,
              fillColor: style.color?.withValues(
                alpha: 1 - max(1 - maxOpacity, _controller.value),
              ),
            ),
          );
        },
      ),
    );
  }
}

///
class _RipplePainter extends CustomPainter {
  ///
  const _RipplePainter({
    required this.fillColor,
    this.offset,
    this.circleRadius,
  });

  /// user tap locations [Offset]
  final Offset? offset;

  /// radius of circle which will be ripple color size [circleRadius]
  final double? circleRadius;

  /// fill color of ripple [fillColor]
  final Color? fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    // throw an [rippleColor == null error] if ripple color is null
    final paint = Paint()..isAntiAlias = true;
    if (fillColor != null) paint.color = fillColor!;

    // drawing canvas based on user click offset,radius and paint
    canvas.drawCircle(offset!, circleRadius!, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
