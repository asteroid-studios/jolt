import 'package:jolt/jolt.dart';

export 'package:jolt/src/widgets/basics/symbol/symbol_extensions.dart';

/// Set the default style for all child text and icons
class SymbolTheme extends StatelessWidget {
  /// Set the default style for all child text and icons
  const SymbolTheme({
    required this.child,
    required this.style,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The style to apply to all child text and icons
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: style,
      child: IconTheme.merge(
        data: IconThemeData(
          color: style.color,
          size: style.fontSize == null
              ? null
              : (style.fontSize! * context.scaling.textScale),
        ),
        child: child,
      ),
    );
  }
}
