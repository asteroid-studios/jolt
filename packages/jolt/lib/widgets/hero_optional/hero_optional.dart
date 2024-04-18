import 'package:jolt/jolt.dart';
import 'package:flutter/widgets.dart' as widgets show Hero;

///
class Hero extends StatelessWidget {
  /// When a tag is provided, the child will be wrapped in a [Hero] widget.
  ///
  /// If no tag is provided, the child will be returned as is.
  const Hero({
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
    final ignoreHero = IgnoreHeroScope.of(context);
    if (tag == null || tag!.isEmpty || ignoreHero) return child;
    return widgets.Hero(
      tag: tag!,
      createRectTween: createRectTween,
      flightShuttleBuilder: flightShuttleBuilder,
      placeholderBuilder: placeholderBuilder,
      transitionOnUserGestures: transitionOnUserGestures,
      child: child,
    );
  }
}

///
class IgnoreHeroScope extends InheritedWidget {
  ///
  const IgnoreHeroScope({
    required super.child,
    this.ignoreHeroes = true,
    super.key,
  });

  ///
  final bool ignoreHeroes;

  ///
  static bool of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<IgnoreHeroScope>();
    return scope?.ignoreHeroes ?? false;
  }

  @override
  bool updateShouldNotify(IgnoreHeroScope oldWidget) =>
      oldWidget.ignoreHeroes != ignoreHeroes;
}
