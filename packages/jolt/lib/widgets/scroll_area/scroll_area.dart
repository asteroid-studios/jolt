import 'package:jolt/jolt.dart';

/// A version of CustomScrollView that will take a list of any kind of widget
///
/// If a passed widget is not a sliver, it will be wrapped in a sliver.
class ScrollArea extends CustomScrollView {
  /// Create a new ScrollView
  const ScrollArea({
    required List<Widget> children,
    super.key,
    super.controller,
    super.scrollDirection,
    super.physics,
    super.primary = true,
    super.anchor,
    super.cacheExtent,
    super.center,
    super.clipBehavior,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.reverse,
    super.scrollBehavior,
    super.semanticChildCount,
    super.shrinkWrap,
  }) : super(slivers: children);

  @override
  List<Widget> buildSlivers(BuildContext context) {
    final caps = ScrollAreaCaps.of(context);
    final start = caps?.start ?? [];
    final end = caps?.end ?? [];
    return [
      if (start.isNotEmpty) ...start.map((c) => JoltSliver(child: c)),
      ...super.buildSlivers(context).map((child) => JoltSliver(child: child)),
      if (end.isNotEmpty) ...end.map((c) => JoltSliver(child: c)),
    ];
  }
}

///
class ScrollAreaCaps extends InheritedWidget {
  ///
  const ScrollAreaCaps({
    required super.child,
    this.start = const [],
    this.end = const [],
    super.key,
  });

  /// Widgets to place at the start of the scroll area
  final List<Widget> start;

  /// Widgets to place at the end of the scroll area
  final List<Widget> end;

  ///
  static ScrollAreaCaps? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ScrollAreaCaps>();
  }

  @override
  bool updateShouldNotify(ScrollAreaCaps oldWidget) =>
      start != oldWidget.start || end != oldWidget.end;
}
