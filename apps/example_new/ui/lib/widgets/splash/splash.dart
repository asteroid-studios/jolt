import 'dart:async';
import 'dart:math';

import 'package:ui/ui.dart';

///
class Splash extends StatefulWidget {
  ///
  const Splash({this.style, super.key});

  ///
  final StyleResolver<SplashStyle, SplashState>? style;

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

  late SplashStyle _style;
  StreamSubscription<PointerDownEvent>? _subscription;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      if (!mounted) return;
      _subscription = Interaction.of(context).pointerDownEvents?.stream.listen((event) {
        if (!mounted) return;
        if (_controller.isAnimating) _controller.reset();
        size = context.findRenderObject()?.paintBounds.size ?? Size.zero;
        offset = Offset(event.localPosition.dx, event.localPosition.dy / 2);
        _controller
            .animateTo(
              1,
              curve: Curves.ease,
              duration: _style.duration ?? const Duration(milliseconds: 900),
            )
            .then((value) => _controller.reset());
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = SplashStyle.defaultStyle(context, this);
    final inlineStyle = widget.style?.call(context, this);
    _style = defaultStyle.resolve(context, inlineStyle);
    final scale = _style.scale ?? 1;
    final maxOpacity = _style.maximumOpacity ?? 0.1;
    final interaction = Interaction.of(context);

    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          var value = _controller.value;
          if (!_controller.isAnimating && interaction.pressing) {
            value = 1;
          }
          return CustomPaint(
            painter: _RipplePainter(
              offset: _style.offset ?? offset,
              circleRadius: value * max(size.width, size.height) * scale,
              fillColor: _style.color?.withOpacity(
                1 -
                    max(
                      1 - maxOpacity,
                      interaction.pressing ? 0 : _controller.value,
                    ),
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
