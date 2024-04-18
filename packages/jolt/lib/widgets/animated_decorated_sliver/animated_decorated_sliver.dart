import 'package:jolt/jolt.dart';

///
class AnimatedDecoratedSliver extends ImplicitlyAnimatedWidget {
  ///
  const AnimatedDecoratedSliver({
    required this.sliver,
    required super.duration,
    this.decoration,
    super.curve,
    super.onEnd,
    super.key,
  });

  ///
  final Widget sliver;

  ///
  final Decoration? decoration;

  @override
  AnimatedWidgetBaseState<AnimatedDecoratedSliver> createState() =>
      _AnimatedContainerState();
}

class _AnimatedContainerState
    extends AnimatedWidgetBaseState<AnimatedDecoratedSliver> {
  DecorationTween? _decoration;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _decoration = visitor(_decoration, widget.decoration,
            (dynamic value) => DecorationTween(begin: value as Decoration))
        as DecorationTween?;
  }

  @override
  Widget build(BuildContext context) {
    final animation = this.animation;
    return DecoratedSliver(
      decoration: _decoration?.evaluate(animation) ??
          widget.decoration ??
          const BoxDecoration(),
      sliver: widget.sliver,
    );
  }
}
