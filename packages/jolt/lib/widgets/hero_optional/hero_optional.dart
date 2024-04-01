import 'package:jolt/jolt.dart';

///
class HeroOptional extends StatelessWidget {
  /// When a tag is provided, the child will be wrapped in a [Hero] widget.
  ///
  /// If no tag is provided, the child will be returned as is.
  const HeroOptional({
    required this.tag,
    required this.child,
    this.createRectTween,
    this.flightShuttleBuilder,
    this.placeholderBuilder,
    this.transitionOnUserGestures = false,
    super.key,
  });

  ///
  final String? tag;

  ///
  final Widget child;

  ///
  final Tween<Rect?> Function(Rect?, Rect?)? createRectTween;

  ///
  final Widget Function(
    BuildContext,
    Animation<double>,
    HeroFlightDirection,
    BuildContext,
    BuildContext,
  )? flightShuttleBuilder;

  ///
  final Widget Function(BuildContext, Size, Widget)? placeholderBuilder;

  ///
  final bool transitionOnUserGestures;

  @override
  Widget build(BuildContext context) {
    if (tag == null) return child;
    return Hero(
      tag: tag!,
      createRectTween: createRectTween,
      flightShuttleBuilder: flightShuttleBuilder,
      placeholderBuilder: placeholderBuilder,
      transitionOnUserGestures: transitionOnUserGestures,
      child: child,
    );
  }
}
