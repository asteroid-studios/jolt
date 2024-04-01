import 'dart:ui';

import 'package:jolt/jolt.dart';

///
class Blur extends StatelessWidget {
  /// Blur everything below this widget.
  const Blur({
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.value = 5,
    super.key,
  });

  ///
  final Widget child;

  ///
  final double value;

  ///
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
        child: child,
      ),
    );
  }
}
