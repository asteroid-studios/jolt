import 'package:jolt/jolt.dart';

/// Set the default style for all child text and icons
class DefaultSymbolStyle extends StatelessWidget {
  /// Set the default style for all child text and icons
  const DefaultSymbolStyle({
    required this.child,
    required this.style,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The style to apply to all child text and icons
  final TextStyle Function(BuildContext) style;

  @override
  Widget build(BuildContext context) {
    final textStyle = style(context);
    return DefaultTextStyle.merge(
      style: textStyle,
      child: IconTheme.merge(
        data: IconThemeData(
          color: textStyle.color,
          size: textStyle.fontSize,
        ),
        child: child,
      ),
    );
  }
}
