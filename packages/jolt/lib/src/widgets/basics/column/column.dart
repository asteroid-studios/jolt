import 'package:flutter/widgets.dart' as widgets show Column;

import 'package:collection/collection.dart';

import 'package:jolt/jolt.dart';

///
class Column extends StatelessWidget {
  ///
  const Column({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
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
      final spacer = separator ?? SizedBox(height: spacing);
      for (var i = 0; i < children.length; i++) {
        childrenList.add(children[i]);
        if (i < children.length - 1) {
          childrenList.add(spacer);
        }
      }
      return childrenList;
    }

    final column = widgets.Column(
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
        child: column,
      );
    }
    return column;
  }
}
