import 'dart:async';

import 'package:ui/ui.dart';

///
class Card extends StatelessWidget {
  ///
  const Card({
    this.onTap,
    this.child,
    this.color,
    this.expanded = false,
    this.active = false,
    this.style,
    this.padding,
    super.key,
  });

  ///
  final FutureOr<void> Function()? onTap;

  ///
  final Color? color;

  ///
  final Widget? child;

  // TODO need to think whether active even makes sense.
  ///
  final bool active;

  ///
  final bool expanded;

  ///
  final EdgeInsets? padding;

  ///
  final StyleResolver<CardStyle, Card>? style;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = CardStyle.defaultStyle(context, this);
    final inlineStyle = this.style?.call(context, this);
    final preStyle = defaultStyle.resolve(context, inlineStyle);
    final style = preStyle.resolver?.call(preStyle, context) ?? preStyle;

    return Interaction(
      onTap: onTap,
      builder: (context) {
        return Surface(
          padding: padding,
          width: expanded ? double.infinity : null,
          style: (context, _) => style.surfaceStyle,
          color: color,
          child: child,
        );
      },
    );
  }
}
