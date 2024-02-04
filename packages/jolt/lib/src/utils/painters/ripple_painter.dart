import 'package:flutter/rendering.dart';

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
