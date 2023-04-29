import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_animate/flutter_animate.dart';

/// Used to build a control that can be focused, hovered, and pressed.
class FocusableControlBuilder extends StatefulWidget {
  /// Used to build a control that can be focused, hovered, and pressed.
  const FocusableControlBuilder({
    required this.builder,
    this.onTap,
    this.onLongPressed,
    this.onExceptionCaught,
    this.onHoverChanged,
    this.onFocusChanged,
    this.semanticButtonLabel,
    this.enabled = true,
    this.focusEnabled = true,
    this.requestFocusOnPress = false,
    this.cursor,
    this.actions,
    this.shortcuts,
    this.hitTestBehavior,
    this.autoFocus = false,
    this.descendantsAreFocusable = true,
    this.descendantsAreTraversable = true,
    super.key,
  });

  /// Return a widget representing the control based on the current [FocusableControlState]
  final Widget Function(BuildContext context, FocusableControlState control)
      builder;

  /// Called when the control is pressed.
  final FutureOr<void> Function()? onTap;

  /// Called when the control is long pressed.
  final FutureOr<void> Function()? onLongPressed;

  /// Called when an error occurs inside onTap or onLongPressed
  final void Function(Exception, StackTrace)? onExceptionCaught;

  /// Called after the hover state has changed.
  final void Function(BuildContext context, FocusableControlState control)?
      onHoverChanged;

  /// Called after the focus state has changed.
  final void Function(BuildContext context, FocusableControlState control)?
      onFocusChanged;

  /// Optional: If not null, the control will be marked as a semantic button and given a label.
  final String? semanticButtonLabel;

  /// Passed to [FocusableActionDetector]. Controls whether this widget will accept focus or input of any kind.
  final bool enabled;

  final bool focusEnabled;

  /// Whether this control should request focus when it is pressed, defaults to true.
  final bool requestFocusOnPress;

  /// Use a custom cursor. By default, [SystemMouseCursors.click] is used.
  final SystemMouseCursor? cursor;

  /// Optional. Passed to the [FocusableActionDetector]. Defines a set of actions which can bind to shortcuts.
  final Map<Type, Action<Intent>>? actions;

  /// Optional. Passed to the [FocusableActionDetector]. Defines a set of shortcuts, that will trigger associated actions.
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// Passed along to the [GestureDetector] that handles onPress and onLongPress
  final HitTestBehavior? hitTestBehavior;

  /// Passed along to the [FocusableActionDetector]
  final bool autoFocus;

  /// Passed along to the [FocusableActionDetector]
  final bool descendantsAreFocusable;

  /// Passed along to the [FocusableActionDetector]
  final bool descendantsAreTraversable;

  @override
  State<FocusableControlBuilder> createState() => FocusableControlState();
}

/// The state of a [FocusableControlBuilder] widget.
/// This is passed to the builder function, and can be used to determine the current state of the control.
class FocusableControlState extends State<FocusableControlBuilder> {
  AnimationController? _controller;

  late FocusNode? _focusNode;
  FocusNode? get focusNode => _focusNode;

  bool _isHovered = false;
  bool get isHovered => _isHovered;

  bool _isFocused = false;
  bool get isFocused => _isFocused;

  bool get hasPressHandler => widget.onTap != null;

  bool _wasHovered = false;
  bool get wasHovered => _wasHovered;

  bool _wasFocused = false;
  bool get wasFocused => _wasFocused;

  bool _isAwaiting = false;
  bool get isAwaiting => _isAwaiting;

  @override
  void initState() {
    _focusNode = widget.focusEnabled ? FocusNode() : null;
    super.initState();
  }

  void _handleHoverChanged(bool v) {
    setState(() => _isHovered = v);
    widget.onHoverChanged?.call(context, this);
    _wasHovered = v;
  }

  void _handleFocusChanged(bool v) {
    setState(() => _isFocused = v);
    widget.onFocusChanged?.call(context, this);
    _wasFocused = v;
  }

  Future<void> _handlePressed(
    FutureOr<void> Function()? handler,
  ) async {
    // If processing or no handler, do nothing.
    if (_isAwaiting || handler == null) {
      return;
    }
    setState(() => _isAwaiting = true);
    if (widget.requestFocusOnPress) {
      _focusNode?.requestFocus();
    }
    try {
      await handler();
    } catch (e, s) {
      // TODO review this, probably can be done better
      widget.onExceptionCaught?.call(Exception(e.toString()), s);
      await _controller?.forward(from: 0);
    }
    setState(() => _isAwaiting = false);
  }

  /// By default, will bind the [ActivateIntent] from the flutter SDK to the onTap callback.
  /// This will enable SPACE and ENTER keys on most platforms.
  /// Also accepts additional actions provided externally.
  Map<Type, Action<Intent>> _getKeyboardActions() {
    return {
      if (hasPressHandler) ...{
        ActivateIntent: CallbackAction<Intent>(
          onInvoke: (_) => _handlePressed(widget.onTap),
        ),
      },
      ...widget.actions ?? {},
    };
  }

  @override
  Widget build(BuildContext context) {
    final defaultCursor =
        hasPressHandler ? SystemMouseCursors.click : MouseCursor.defer;
    final cursor = widget.cursor ?? defaultCursor;

    late Widget content;
    if (widget.focusEnabled) {
      content = FocusableActionDetector(
        enabled: widget.enabled,
        focusNode: _focusNode,
        autofocus: widget.autoFocus,
        descendantsAreFocusable: widget.descendantsAreFocusable,
        descendantsAreTraversable: widget.descendantsAreTraversable,
        onFocusChange: _handleFocusChanged,
        onShowFocusHighlight: _handleFocusChanged,
        onShowHoverHighlight: _handleHoverChanged,
        shortcuts: widget.shortcuts,
        mouseCursor: cursor,
        actions: _getKeyboardActions(),
        child: widget.builder(context, this),
      );
    } else {
      content = MouseRegion(
        cursor: cursor,
        onEnter: (_) => _handleHoverChanged(true),
        onExit: (_) => _handleHoverChanged(false),
        child: widget.builder(context, this),
      );
    }

    // Wrap semantics
    if (widget.semanticButtonLabel != null) {
      content = Semantics(
        button: true,
        label: widget.semanticButtonLabel,
        child: content,
      );
    }

    // Wrap gestures
    return Animate(
      autoPlay: false,
      onInit: (c) {
        _controller = c;
      },
      effects: const [
        ShakeEffect(),
      ],
      child: GestureDetector(
        behavior: widget.hitTestBehavior,
        onTap: () => _handlePressed(widget.onTap),
        onLongPress: () => _handlePressed(widget.onLongPressed),
        child: content,
      ),
    );
  }
}
