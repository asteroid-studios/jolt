import 'dart:async';

import 'package:flutter/services.dart';

import 'package:tinycolor2/tinycolor2.dart';

import 'package:jolt/jolt.dart';

///
class Surface extends StatefulWidget {
  ///
  const Surface({
    required Widget this.child,
    this.background,
    this.borderColor,
    super.key,
  })  : onPressed = null,
        onLongPressed = null,
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
    this.onPressed,
    this.onLongPressed,
    this.cursor,
    this.selectionEnabled = false,
    this.focusEnabled = true,
    this.hasFocusOverride,
    super.key,
  }) : child = null;

  final Widget? child;
  final Widget Function(BuildContext, FocusableControlState)? builder;

  final FutureOr<void> Function()? onPressed;
  final FutureOr<void> Function()? onLongPressed;
  final SystemMouseCursor? cursor;
  final bool selectionEnabled;
  final bool focusEnabled;
  final bool? hasFocusOverride;

  final Color? background;
  final Color? borderColor;

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
    final defaultBorderRadius = theme.borderRadius ?? context.borderRadius.m;
    final defaultHoverColor =
        theme.backgroundOnHover ?? defaultBackground.darken(5);
    final defaultFocusColor =
        theme.backgroundOnFocus ?? defaultBackground.darken(5);
    final defaultBorderColor =
        widget.borderColor ?? theme.borderColor ?? defaultBackground;
    final defaultFocusBorderColor =
        theme.borderColorOnFocus ?? context.color.primary;

    Widget _buildSurface(
      Widget w, {
      bool isHovered = false,
      bool isFocused = false,
    }) {
      final _hasFocus = widget.hasFocusOverride ?? isFocused;
      return ClipRRect(
        borderRadius: defaultBorderRadius,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
            border: Border.all(
              color: _hasFocus ? defaultFocusBorderColor : defaultBorderColor,
              width: context.borderWidth,
            ),
            color: isHovered
                ? defaultHoverColor
                : _hasFocus
                    ? defaultFocusColor
                    : defaultBackground,
          ),
          child: w,
        ),
      );
    }

    if (widget.child != null) {
      return _buildSurface(
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.horizontalPadding ?? context.sizing.sm,
            vertical: theme.verticalPadding ?? context.sizing.xs,
          ),
          child: widget.child,
        ),
      );
    }
    if (widget.builder == null) return const SizedBox.shrink();

    return FocusableControlBuilder(
      cursor: widget.cursor ?? SystemMouseCursors.click,
      onPressed: widget.onPressed,
      focusEnabled: widget.focusEnabled,
      builder: (context, state) {
        if (widget.selectionEnabled) {
          return _buildSurface(
            widget.builder!(context, state),
            isHovered: state.isHovered,
            isFocused: state.isFocused,
          );
        }
        return SelectionContainer.disabled(
          child: _buildSurface(
            widget.builder!(context, state),
            isHovered: state.isHovered,
            isFocused: state.isFocused,
          ),
        );
      },
    );
  }
}
