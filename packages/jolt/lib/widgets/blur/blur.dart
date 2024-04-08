import 'dart:ui';

import 'package:jolt/jolt.dart';

///
class Blur extends StatelessWidget {
  /// Blur everything below this widget.
  const Blur({
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.blur = 5,
    super.key,
  });

  ///
  final Widget child;

  ///
  final double blur;

  ///
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      ),
    );
  }
}

///
extension JoltBlurX on Widget {
  ///
  Widget withBlur({
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    double blur = 5,
  }) =>
      Blur(
        borderRadius: borderRadius,
        blur: blur,
        child: this,
      );
}
