import 'package:flutter/widgets.dart' as widgets show Row;

import 'package:jolt/jolt.dart';

///
class Row extends StatelessWidget {
  ///
  const Row({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.spacing = 0,
    this.separator,
    this.textDirection,
    this.padding,
    super.key,
  });

  ///
  final List<Widget> children;

  ///
  final MainAxisAlignment mainAxisAlignment;

  ///
  final MainAxisSize mainAxisSize;

  ///
  final CrossAxisAlignment crossAxisAlignment;

  ///
  final TextDirection? textDirection;

  ///
  final VerticalDirection verticalDirection;

  ///
  final EdgeInsets? padding;

  ///
  final double spacing;

  /// Return a widget, to be used in between each child widget
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    List<Widget> buildChildren() {
      if (spacing == 0 && separator == null) {
        return children;
      }
      final childrenList = <Widget>[];
      final spacer = separator ?? SizedBox(width: spacing);
      for (var i = 0; i < children.length; i++) {
        childrenList.add(children[i]);
        if (i < children.length - 1) {
          childrenList.add(spacer);
        }
      }
      return childrenList;
    }

    final row = widgets.Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: buildChildren(),
    );
    if (padding != null) {
      return Padding(
        padding: padding!,
        child: row,
      );
    }
    return row;
  }
}
