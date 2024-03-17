import 'package:flutter/services.dart';

import 'package:jolt_copy/jolt.dart';

/// Convenient extensions to help with layout.
extension LayoutWidgetX on Widget {
  /// Set the title for the window
  Widget setTitle(String? title) {
    if (title == null) return this;
    return Builder(
      builder: (context) {
        return Title(
          title: title,
          color: context.color.primary,
          child: this,
        );
      },
    );
  }

  /// Set the Annotated Region
  Widget setAnnotatedRegion({SystemUiOverlayStyle? style}) {
    return Builder(
      builder: (context) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: style ??
              (context.color.brightness == Brightness.light
                  ? SystemUiOverlayStyle.dark
                  : SystemUiOverlayStyle.light),
          child: this,
        );
      },
    );
  }

  /// Set everything within the widget to be part of a SelectionArea
  Widget setSelectionArea() {
    return SelectionArea(child: this);
  }
}

/// Convenient extensions to help with layout of multiple widgets.
extension LayoutWidgetsX on List<Widget> {
  /// Adds the separator between all widgets in the list
  List<Widget> withSeparator(Widget Function(int index) separator) {
    if (length > 1) {
      for (var i = length - 1; i > 0; i--) {
        insert(i, separator(i));
      }
    }
    return this;
  }
}
