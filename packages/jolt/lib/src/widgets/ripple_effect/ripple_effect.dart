import 'package:jolt/jolt.dart';

///
class TouchRippleEffect extends StatefulWidget {
  ///
  const TouchRippleEffect({
    required this.backgroundColor,
    required this.borderRadius,
    this.child,
    this.width,
    this.height,
    this.rippleDuration,
    super.key,
  });

  /// child widget [child]
  final Widget? child;

  /// The background color behind the RippleEffect
  final Color backgroundColor;

  /// if you have border of child widget then you should apply [borderRadius]
  final BorderRadius borderRadius;

  /// animation duration of touch effect. [rippleDuration]
  final Duration? rippleDuration;

  /// TouchRippleEffect widget width size [width]
  final double? width;

  /// TouchRippleEffect widget height size [height]
  final double? height;

  @override
  State<TouchRippleEffect> createState() => _TouchRippleEffectState();
}

class _TouchRippleEffectState extends State<TouchRippleEffect>
    with SingleTickerProviderStateMixin {
  // by default offset will be 0,0
  // it will be set when user tap on widget
  Offset _tapOffset = Offset.zero;

  // globalKey variable declared
  final _globalKey = GlobalKey();

  // animation global variable declared and
  // type cast is double
  late Animation<double> _anim;

  // animation controller global variable declared
  late AnimationController _animationController;

  /// width of user child widget
  double _mWidth = 0;

  // height of user child widget
  double _mHeight = 0;

  // tween animation global variable declared and
  // type cast is double
  late Tween<double> _tweenAnim;

  // animation count of Tween anim.
  // by default value is 0.
  double _animRadiusValue = 0;

  bool animating = false;

  final _defaultDuration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    // animation controller initialized
    _animationController = AnimationController(
      vsync: this,
      duration: widget.rippleDuration ?? _defaultDuration,
    );
    // animation controller listener added or initialized
    _animationController.addListener(_update);
  }

  // update animation when started
  void _update() {
    setState(() {
      // [_anim.value] setting to [_animRadiusValue] global variable
      _animRadiusValue = _anim.value;
    });
    // animation status function calling
    _animStatus();
  }

  // checking animation status is completed
  void _animStatus() {
    if (_anim.status == AnimationStatus.completed) {
      setState(() {
        _animRadiusValue = 0;
      });
      // stopping animation after completed
      _animationController.stop();
    }
  }

  @override
  void dispose() {
    // disposing [_animationController] when parent exist of close
    _animationController.dispose();
    super.dispose();
  }

  // animation initialize reset and start
  void _animate() {
    // [Tween] animation initialize to global variable
    _tweenAnim = Tween(
      begin: 0,
      end: (widget.width ?? _mWidth * 2) + (widget.height ?? _mHeight * 2),
    );

    // adding [_animationController] to [_tweenanim] to animate
    _anim = _tweenAnim.animate(_animationController);

    // resetting [_animationController] before start
    _animationController
      ..reset()

      // starting [_animationController] to start animation
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    late Color rippleColor;
    var rippleOpacity = 0.07;

    if (widget.backgroundColor is JoltColor) {
      final background = widget.backgroundColor as JoltColor;
      if (background == context.color.background ||
          background == context.color.surface ||
          background == context.color.neutral) {
        rippleColor = context.color.primary;
      } else {
        rippleOpacity = 0.1;
        rippleColor = background.foreground;
      }
    } else {
      rippleColor = context.color.primary;
    }

    return Listener(
      onPointerUp: (event) {
        setState(() => animating = false);
        _animationController.reset();
      },
      onPointerCancel: (event) {
        setState(() => animating = false);
        _animationController.reset();
      },
      onPointerDown: (details) {
        if (!animating) {
          // Start animating
          setState(() => animating = true);

          // getting tap [localPosition] of user
          final lp = details.localPosition;
          setState(() {
            /// setting [Offset] of user tap to [_tapOffset] global variable
            _tapOffset = Offset(lp.dx, lp.dy);
          });

          // getting [size] of child widget
          final size = _globalKey.currentContext!.size!;

          // child widget [width] initialize to [_width] global variable
          _mWidth = size.width;

          // child widget [height] initialize to [_height] global variable
          _mHeight = size.height;

          // starting animation
          _animate();
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,

        // added globalKey for getting child widget size
        key: _globalKey,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          // when color == null then color will be transparent
          // otherwise color will be backgroundColor
          color: Colors.transparent,

          // borderRadius of container if user passed
          borderRadius: widget.borderRadius,
        ),
        child: Stack(
          children: [
            // added child widget of user
            widget.child!,
            Opacity(
              opacity: rippleOpacity,
              child: CustomPaint(
                // ripplePainter is CustomPainter for circular ripple draw
                painter: RipplePainter(
                  offset: _tapOffset,
                  circleRadius: _animRadiusValue,
                  fillColor: rippleColor,
                ),
              ),
            ),
            Opacity(
              opacity: rippleOpacity,
              child: CustomPaint(
                // ripplePainter is CustomPainter for circular ripple draw
                painter: RipplePainter(
                  offset: _tapOffset,
                  circleRadius: _animRadiusValue / 1.5,
                  fillColor: rippleColor,
                ),
              ),
            ),
            Opacity(
              opacity: rippleOpacity,
              child: CustomPaint(
                // ripplePainter is CustomPainter for circular ripple draw
                painter: RipplePainter(
                  offset: _tapOffset,
                  circleRadius: _animRadiusValue / 2,
                  fillColor: rippleColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
class RipplePainter extends CustomPainter {
  ///
  const RipplePainter({
    required this.fillColor,
    this.offset,
    this.circleRadius,
  });

  /// user tap locations [Offset]
  final Offset? offset;

  /// radius of circle which will be ripple color size [circleRadius]
  final double? circleRadius;

  /// fill color of ripple [fillColor]
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    // throw an [rippleColor == null error] if ripple color is null
    final paint = Paint()
      ..color = fillColor
      ..isAntiAlias = true;

    // drawing canvas based on user click offset,radius and paint
    canvas.drawCircle(offset!, circleRadius!, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
