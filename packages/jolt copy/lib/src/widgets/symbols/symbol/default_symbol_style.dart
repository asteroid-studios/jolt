import 'package:jolt_copy/jolt.dart';

/// Set the default style for all child text and icons
class DefaultSymbolStyle extends StatelessWidget {
  /// Set the default style for all child text and icons
  const DefaultSymbolStyle({
    required this.child,
    required this.style,
    super.key,
  }) : important = false;

  /// Set the default style for all child text and icons
  /// Important means this style will be applied over other DefaultSymbolStyles
  /// without important set to true.
  const DefaultSymbolStyle.important({
    required this.child,
    required this.style,
    super.key,
  }) : important = true;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The style to apply to all child text and icons
  final TextStyle Function(BuildContext) style;

  /// If true, this style will be applied over other DefaultSymbolStyle
  /// widgets without important set to true.
  final bool important;

  @override
  Widget build(BuildContext context) {
    final importantStyling = _ImportantStyle.of(context);
    final style = this.style(context);
    final textStyle = style.merge(importantStyling);
    final defaultStyles = DefaultTextStyle.merge(
      style: textStyle,
      child: IconTheme.merge(
        data: IconThemeData(
          color: textStyle.color,
          size: textStyle.fontSize,
        ),
        child: child,
      ),
    );

    if (!important) return defaultStyles;

    // if important return the important style merged with previous important styling
    return _ImportantStyle(
      style: importantStyling?.merge(style) ?? style,
      child: defaultStyles,
    );
  }
}

// Rather than ignore the child style completely
// would be better to have the important style just override the specified params

// A widget used to mark a DefaultSymbolStyle as important and override
// non-important DefaultSymbolStyle widgets below it.
class _ImportantStyle extends InheritedTheme {
  const _ImportantStyle({
    required this.style,
    required super.child,
  });

  final TextStyle style;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _ImportantStyle(style: style, child: child);
  }

  // Get the important style from the nearest _ImportantStyle widget.
  static TextStyle? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ImportantStyle>()?.style;
  }

  @override
  bool updateShouldNotify(_ImportantStyle old) => style != old.style;
}
