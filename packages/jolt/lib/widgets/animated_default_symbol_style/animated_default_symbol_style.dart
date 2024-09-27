import 'package:jolt/jolt.dart';

///
class AnimatedDefaultSymbolStyle extends ImplicitlyAnimatedWidget {
  /// AnimatedDefaultSymbolStyle is a combination of DefaultTextStyle and IconTheme.
  ///
  /// Quite often it is desirable for the colors and sizes
  /// of text and icons to match, for example inside of a button.
  ///
  /// The style is also animated implicitly, creating smooth transitions
  /// when changing the size and color.
  const AnimatedDefaultSymbolStyle({
    required this.child,
    required super.duration,
    this.style,
    this.iconSize,
    this.merge = true,
    super.curve,
    super.onEnd,
    super.key,
  });

  ///
  final Widget child;

  /// Whether to merge the incoming style with the parent style.
  final bool merge;

  ///
  final TextStyle? style;

  ///
  final double? iconSize;

  @override
  AnimatedWidgetBaseState<AnimatedDefaultSymbolStyle> createState() =>
      _AnimatedContainerState();
}

class _AnimatedContainerState
    extends AnimatedWidgetBaseState<AnimatedDefaultSymbolStyle> {
  TextStyleTween? _style;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _style = visitor(
      _style,
      widget.style,
      (dynamic value) => TextStyleTween(begin: value as TextStyle),
    ) as TextStyleTween?;
  }

  @override
  Widget build(BuildContext context) {
    final animation = this.animation;
    final style =
        _style?.evaluate(animation) ?? widget.style ?? const TextStyle();

    if (widget.merge) {
      return DefaultTextStyle.merge(
        style: style,
        child: IconTheme.merge(
          data: IconThemeData(
            color: style.color,
            size: widget.iconSize ?? style.fontSize,
          ),
          child: widget.child,
        ),
      );
    }

    return DefaultTextStyle(
      style: style,
      child: IconTheme(
        data: IconThemeData(
          color: style.color,
          size: widget.iconSize ?? style.fontSize,
        ),
        child: widget.child,
      ),
    );
  }
}
