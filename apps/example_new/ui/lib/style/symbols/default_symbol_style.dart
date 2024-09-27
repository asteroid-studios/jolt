import 'package:ui/ui.dart';

///
class DefaultSymbolStyle extends StatelessWidget {
  ///
  const DefaultSymbolStyle({
    required this.child,
    required this.style,
    this.merge = true,
    super.key,
  });

  ///
  final TextStyle style;

  ///
  final Widget child;

  /// Whether to merge the style with the parent style.
  final bool merge;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultSymbolStyle(
      duration: Durations.themeTransition,
      style: style,
      merge: merge,
      child: child,
    );
  }
}
