import 'dart:async';

import 'package:jolt/jolt.dart';

///
class Button extends StatelessWidget {
  ///
  const Button({
    this.onPressed,
    this.onLongPressed,
    this.label,
    this.icon,
    this.style,
    this.color,
    this.tooltip,
    this.textStyle,
    this.axis = Axis.horizontal,
    this.direction = TextDirection.ltr,
    this.fullWidth = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    super.key,
  });

  ///
  final String? label;

  ///
  final IconData? icon;

  ///
  final String? tooltip;

  ///
  final StyleResolver<ButtonStyle>? style;

  ///
  final TextStyle? textStyle;

  /// Color of the button surface
  final Color? color;

  ///
  final FutureOr<void> Function()? onPressed;

  ///
  final FutureOr<void> Function()? onLongPressed;

  /// The orientation of the button, defaults to horizontal
  final Axis axis;

  /// The direction of the button, defaults to ltr
  final TextDirection direction;

  /// Whether the button should take up the full width of the parent
  final bool fullWidth;

  /// The alignment of the label + icon, defaults to centered
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    // The default widget style
    final widgetStyle = ButtonStyle(
      squareIconButton: true,
      surfaceStyle: SurfaceStyle(
        splash: true,
        color: color,
      ),
    );

    // Merge and resolve all child styles.
    final style = Style.resolveAll(
      context,
      widgetStyle: widgetStyle,
      style: this.style?.call(context),
    );

    return Interaction(
      onTap: onPressed,
      onLongPressed: onLongPressed,
      tooltip: tooltip,
      builder: (BuildContext context, InteractionState state) {
        final spacing = style.spacing ?? context.spacing.xs;
        final indicator = style.indicator ?? const CircularProgressIndicator();
        final buttonChildren = [
          if (icon != null || label == null)
            _ButtonIconSlot(
              forceLabelSize: label == null,
              textStyle: style.textStyle,
              child: state.isWaiting
                  ? indicator
                  : icon?.asIcon(size: style.textStyle?.fontSize),
            ),
          if (label != null) label!.asText(style.textStyle),
        ];

        late Widget child;
        if (axis == Axis.vertical) {
          // Layout VERTICAL button
          child = Column(
            verticalDirection: direction == TextDirection.ltr
                ? VerticalDirection.down
                : VerticalDirection.up,
            mainAxisSize: MainAxisSize.min,
            children: spacing > 0
                ? buttonChildren.withSpacing(spacing, axis: Axis.vertical)
                : buttonChildren,
          );
        } else {
          // Layout HORIZONTAL button
          child = Row(
            textDirection: direction,
            mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment,
            children: spacing > 0
                ? buttonChildren.withSpacing(spacing, axis: Axis.horizontal)
                : buttonChildren,
          );
        }

        return FallbackStyle(
          style: style.surfaceStyle?.copyWith(
            forcePaddingEqualToVertical:
                style.squareIconButton! && label == null,
          ),
          child: Surface(
            child: child,
            style: (context) => style.surfaceStyle!,
          ),
        );
      },
    );
  }
}

/// This widget is used simply to ensure icon only buttons have the same
/// height as icon + label buttons.
class _ButtonIconSlot extends StatelessWidget {
  const _ButtonIconSlot({
    required this.textStyle,
    required this.child,
    required this.forceLabelSize,
  });

  final Widget? child;
  final TextStyle? textStyle;
  final bool forceLabelSize;

  @override
  Widget build(BuildContext context) {
    final emptyCharBlock = Text('', style: textStyle);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (forceLabelSize) RotatedBox(quarterTurns: 1, child: emptyCharBlock),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (child != null) child!,
            if (forceLabelSize) emptyCharBlock,
          ],
        ),
      ],
    );
  }
}
