import 'dart:async';

import 'package:flutter/services.dart';

import 'package:tinycolor2/tinycolor2.dart';

import 'package:jolt/jolt.dart';
import 'package:jolt/src/utils/theme/defaults.dart';

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
    this.onLongPressed,
    this.cursor,
    this.width,
    this.height,
    this.selectionEnabled = false,
    this.focusEnabled = true,
    this.hasFocusOverride,
    super.key,
  }) : child = null;

  final Widget? child;
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

    Widget _buildSurface(
      Widget w, {
      bool isHovered = false,
      bool isFocused = false,
    }) {
      final _hasFocus = widget.hasFocusOverride ?? isFocused;
      return ClipRRect(
        borderRadius: defaultBorderRadius,
        child: AnimatedContainer(
          width: widget.width,
          height: widget.height,
          padding: widget.padding ??
              (widget.child == null
                  ? null
                  : EdgeInsets.symmetric(
                      horizontal: theme.horizontalPadding ??
                          context.defaults.horizontalPadding,
                      vertical: theme.verticalPadding ??
                          context.defaults.verticalPadding,
                    )),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
            border: Border.all(
              color: _hasFocus ? defaultFocusBorderColor : defaultBorderColor,
              width: widget.borderWidth ?? context.borderWidth,
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

    if (widget.child != null) return _buildSurface(widget.child!);
    if (widget.builder == null) return const SizedBox.shrink();

    return FocusableControlBuilder(
      cursor: widget.cursor ?? SystemMouseCursors.click,
      onTap: widget.onTap,
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
