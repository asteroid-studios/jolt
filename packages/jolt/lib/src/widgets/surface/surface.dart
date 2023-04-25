import 'dart:async';

import 'package:flutter/services.dart';

import 'package:jolt/jolt.dart';
import 'package:jolt/src/utils/theme/defaults.dart';
import 'package:jolt/src/widgets/ripple_effect/ripple_effect.dart';

///
class Surface extends StatefulWidget {
  ///
  const Surface({
    required Widget this.child,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.width,
    this.height,
    super.key,
  })  : onTap = null,
        onLongPressed = null,
        toolTip = null,
        builder = null,
        selectionEnabled = false,
        focusEnabled = false,
        cursor = null,
        hasFocusOverride = null;

  ///
  const Surface.focusable({
    required Widget Function(BuildContext, FocusableControlState) this.builder,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.onTap,
    this.toolTip,
    this.onLongPressed,
    this.cursor,
    this.width,
    this.height,
    this.selectionEnabled = false,
    this.focusEnabled = true,
    this.hasFocusOverride,
    super.key,
  }) : child = null;

  ///
  final Widget? child;

  ///
  final Widget Function(BuildContext, FocusableControlState)? builder;

  ///
  final FutureOr<void> Function()? onTap;

  ///
  final FutureOr<void> Function()? onLongPressed;

  ///
  final SystemMouseCursor? cursor;

  ///
  final bool selectionEnabled;

  ///
  final bool focusEnabled;

  ///
  final bool? hasFocusOverride;

  ///

  ///
  final Color? background;

  ///
  final Color? borderColor;

  ///
  final BorderRadius? borderRadius;

  ///
  final double? borderWidth;

  ///
  final EdgeInsets? padding;

  ///
  final double? width;

  ///
  final double? height;

  ///
  final String? toolTip;

  @override
  State<Surface> createState() => _SurfaceState();
}

class _SurfaceState extends State<Surface> with SingleTickerProviderStateMixin {
  bool isAwaiting = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.widgetTheme.surface;
    final defaultBackground =
        widget.background ?? theme.background ?? context.color.surface;
    final defaultBorderRadius =
        widget.borderRadius ?? theme.borderRadius ?? context.borderRadius.md;
    final defaultHoverColor =
        theme.backgroundOnHover ?? defaultBackground.darken(5);
    final defaultFocusColor =
        theme.backgroundOnFocus ?? defaultBackground.darken(5);
    final defaultBorderColor =
        widget.borderColor ?? theme.borderColor ?? defaultBackground;
    final defaultFocusBorderColor =
        theme.borderColorOnFocus ?? context.color.primary;

    Widget buildSurface(
      Widget w, {
      bool isHovered = false,
      bool isFocused = false,
    }) {
      final child = Padding(
        padding: widget.padding ??
            (widget.child == null
                ? null
                : EdgeInsets.symmetric(
                    horizontal: theme.horizontalPadding ??
                        context.defaults.horizontalPadding,
                    vertical: theme.verticalPadding ??
                        context.defaults.verticalPadding,
                  )) ??
            EdgeInsets.zero,
        child: w,
      );
      final hasFocus = widget.hasFocusOverride ?? isFocused;
      return ClipRRect(
        borderRadius: defaultBorderRadius,
        child: AnimatedContainer(
          width: widget.width,
          height: widget.height,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
            border: Border.all(
              color: hasFocus ? defaultFocusBorderColor : defaultBorderColor,
              width: widget.borderWidth ?? context.borderWidth,
            ),
            color: isHovered
                ? defaultHoverColor
                : hasFocus
                    ? defaultFocusColor
                    : defaultBackground,
          ),
          child: widget.child != null
              ? child
              : TouchRippleEffect(
                  borderRadius: defaultBorderRadius,
                  backgroundColor: defaultBackground,
                  child: child,
                ),
        ),
      );
    }

    if (widget.child != null) return buildSurface(widget.child!);
    if (widget.builder == null) return const SizedBox.shrink();

    final disabled = widget.onTap == null && widget.onLongPressed == null;

    return FocusableControlBuilder(
      cursor: widget.cursor ?? (disabled ? null : SystemMouseCursors.click),
      onTap: widget.onTap,
      focusEnabled: widget.focusEnabled,
      builder: (context, state) {
        if (widget.selectionEnabled) {
          return buildSurface(
            widget.builder!(context, state),
            isHovered: state.isHovered,
            isFocused: state.isFocused,
          );
        }
        return SelectionContainer.disabled(
          child: buildSurface(
            widget.builder!(context, state),
            isHovered: state.isHovered,
            isFocused: state.isFocused,
          ),
        );
      },
    );
  }
}
