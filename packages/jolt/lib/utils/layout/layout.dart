import 'package:jolt/jolt.dart';

///
extension JoltListLayoutX on Iterable<Widget> {
  ///
  List<Widget> withExpanded() {
    return map((widget) => Expanded(child: widget)).toList();
  }

  ///
  List<Widget> withSeparator(Widget separator) {
    final widgets = <Widget>[];
    for (final widget in this) {
      widgets
        ..add(widget)
        ..add(separator);
    }
    widgets.removeLast();
    return widgets;
  }
}
