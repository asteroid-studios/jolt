import 'package:ui/ui.dart';

///
class DefaultSymbolStyle extends StatelessWidget {
  ///
  const DefaultSymbolStyle({
    required this.child,
    required this.style,
    this.merge = true,
    this.iconSize,
    super.key,
  });

  ///
  final TextStyle style;

  ///
  final Widget child;

  /// Whether to merge the style with the parent style.
  final bool merge;

  ///
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultSymbolStyle(
      duration: Theme.transitionDuration,
      curve: Theme.transitionCurve,
      style: style,
      merge: merge,
      iconSize: iconSize,
      child: child,
    );
  }
}
