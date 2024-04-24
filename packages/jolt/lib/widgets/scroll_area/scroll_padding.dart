import 'package:jolt/jolt.dart';

///
class ScrollPadding extends InheritedWidget {
  ///
  factory ScrollPadding({
    required BuildContext context,
    required Widget child,
    Key? key,
    double? start,
    double? end,
  }) {
    final current = ScrollPadding.of(context);
    return ScrollPadding._(
      key: key,
      start: current.start + (start ?? 0),
      end: current.end + (end ?? 0),
      child: child,
    );
  }

  ///
  const ScrollPadding._({
    required super.child,
    double? start,
    double? end,
    super.key,
  })  : start = start ?? 0,
        end = end ?? 0;

  ///
  final double start;

  ///
  final double end;

  ///
  static ({double start, double end}) of(BuildContext context) {
    final padding = context.dependOnInheritedWidgetOfExactType<ScrollPadding>();
    return (start: padding?.start ?? 0, end: padding?.end ?? 0);
  }

  @override
  bool updateShouldNotify(ScrollPadding oldWidget) =>
      start != oldWidget.start || end != oldWidget.end;
}
