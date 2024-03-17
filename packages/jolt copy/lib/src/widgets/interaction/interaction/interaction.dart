import 'dart:async';

import 'package:flutter/services.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:jolt_copy/jolt.dart';

/// A widget to handle user interaction.
class Interaction extends StatefulWidget {
  /// A widget to handle user interaction.
  /// Such as:
  ///   - Mouse hovering
  ///   - Mouse clicking
  ///   - Focus
  ///   - Dragging
  const Interaction({
    required this.builder,
    this.onTap,
    this.onLongPressed,
    this.errorHandler,
    this.onHoverChanged,
    this.onFocusChanged,
    this.semanticLabel,
    this.cursor,
    this.actions,
    this.shortcuts,
    this.hitTestBehavior,
    this.focusNode,
    this.tooltip,
    this.disablePressWhenAwaiting = true,
    this.descendantsAreFocusable = true,
    this.descendantsAreTraversable = true,
    this.shakeOnError = true,
    this.requestFocusOnPress = false,
    this.autoFocus = false,
    this.disableFocus = false,
    this.disableHover = false,
    this.enableSelection = false,
    super.key,
  });

  /// Get the interaction state of the current context
  static InteractionState? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InteractionScope>()
        ?._state;
  }

  /// The builder for the widget.
  final Widget Function(BuildContext context, InteractionState state) builder;

  /// Called when the widget is pressed.
  final FutureOr<void> Function()? onTap;

  /// Called when the widget is long pressed.
  final FutureOr<void> Function()? onLongPressed;

  /// Called when an error occurs inside onTap or onLongPressed
  final void Function(InteractionException)? errorHandler;

  /// Called after the hover state has changed.
  final void Function(BuildContext context, InteractionState state)?
      onHoverChanged;

  /// Called after the focus state has changed.
  final void Function(BuildContext context, InteractionState state)?
      onFocusChanged;

  /// Add a semantic label to the widget.
  final String? semanticLabel;

  /// Whether this control should request focus when it is pressed.
  final bool requestFocusOnPress;

  /// Use a custom cursor. By default, [SystemMouseCursors.click] is used.
  final SystemMouseCursor? cursor;

  /// Optional. Passed to the [FocusableActionDetector].
  /// Defines a set of actions which can bind to shortcuts.
  final Map<Type, Action<Intent>>? actions;

  /// Optional. Passed to the [FocusableActionDetector].
  /// Defines a set of shortcuts, that will trigger associated actions.
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// Passed along to the [GestureDetector] that handles onPress and onLongPress
  final HitTestBehavior? hitTestBehavior;

  /// Passed along to the [FocusableActionDetector]
  final bool autoFocus;

  /// Passed along to the [FocusableActionDetector]
  final bool descendantsAreFocusable;

  /// Passed along to the [FocusableActionDetector]
  final bool descendantsAreTraversable;

  /// Whether the widget should be disabled while
  /// awaiting the result of a press handler.
  final bool disablePressWhenAwaiting;

  /// Whether the widget should shake when an error occurs.
  final bool shakeOnError;

  /// Enabled selection inside the interaction, defaults to false.
  final bool enableSelection;

  /// Disable focusing the interaction, defaults to false.
  final bool disableFocus;

  /// Disable hovering the interaction, defaults to false.
  final bool disableHover;

  /// Override the focus node for the widget
  final FocusNode? focusNode;

  /// Add a tooltip for the widget
  final String? tooltip;

  @override
  State<Interaction> createState() => InteractionState();
}

/// The state of an [Interaction] widget.
class InteractionState extends State<Interaction> {
  /// The current interaction types active in the widget
  final Set<InteractionType> _interactions = {};

  /// The widget is currently hovered
  bool get isHovered => _interactions.contains(Hovered());

  /// The widget is currently focused
  bool get isFocused => _interactions.contains(Focused());

  // TODO Implement pressed
  /// The widget is currently pressed
  bool get isPressed => _interactions.contains(Pressed());

  // TODO Implement dragged
  /// The widget is currently being dragged
  bool get isDragged => _interactions.contains(Dragged());

  // TODO Implement selected
  /// The widget is currently selected
  bool get isSelected => _interactions.contains(Selected());

  /// The widget is currently waiting (ie for the onTap handler to complete)
  bool get isWaiting => _interactions.contains(Waiting());

  /// The widget is currently disabled
  bool get isDisabled => _interactions.contains(Disabled());

  /// The focus node for this widget.
  FocusNode? get focusNode => _focusNode;
  FocusNode? _focusNode;

  /// Whether the widget has a press handler.
  bool get _hasPressHandler =>
      widget.onTap != null || widget.onLongPressed != null;

  AnimationController? _controller;

  @override
  void initState() {
    // Set the interaction as disabled if it has no press handler
    if (_hasPressHandler == false) _interactions.add(Disabled());
    // Create the focus node unless focus is disabled
    _focusNode = widget.disableFocus ? null : (widget.focusNode ?? FocusNode());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Listen to focus changes
      _focusNode?.addListener(() {
        _handleFocusChanged(_focusNode!.hasFocus);
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // If the widget is disabled, add the disabled interaction type.
    if (widget.onTap == null && widget.onLongPressed == null) {
      _interactions.add(Disabled());
    } else {
      _interactions.remove(Disabled());
    }
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  void _handleHoverChanged(bool hovered) {
    if (hovered) {
      setState(() => _interactions.add(Hovered()));
    } else {
      setState(() => _interactions.remove(Hovered()));
    }
    widget.onHoverChanged?.call(context, this);
  }

  void _handleFocusChanged(bool focused) {
    if (focused) {
      setState(() => _interactions.add(Focused()));
    } else {
      setState(() => _interactions.remove(Focused()));
    }
    widget.onFocusChanged?.call(context, this);
  }

  Future<void> _shake() async {
    if (widget.shakeOnError) {
      // Shake the widget.
      await _controller?.forward(from: 0);
    }
  }

  Future<void> _handlePressed(
    FutureOr<void> Function()? handler, {
    bool longPress = false,
  }) async {
    // If nothing to do, return
    if (handler == null) {
      // Don't shake on missing long press as
      // commonly taps will not have a long press
      if (!longPress) await _shake();
      return;
    }
    if (widget.disablePressWhenAwaiting) {
      // If processing or no handler, do nothing.
      if (isWaiting) return;
      // Set is awaiting to true, and rebuild.
      setState(() => _interactions.add(Waiting()));
    }
    if (widget.requestFocusOnPress && !Platform.isMobile) {
      _focusNode?.requestFocus();
    }
    try {
      // Try to complete the handler.
      await handler();
    } catch (e, s) {
      // Pass the exception to the error handler.
      widget.errorHandler?.call(
        InteractionException(
          message: e.toString(),
          state: this,
          stackTrace: s,
        ),
      );
      await _shake();
    }
    setState(() => _interactions.remove(Waiting()));
  }

  // By default, will bind the [ActivateIntent] from the flutter SDK to the onTap callback.
  /// This will enable SPACE and ENTER keys on most platforms.
  /// Also accepts additional actions provided externally.
  Map<Type, Action<Intent>> _getKeyboardActions() {
    return {
      if (!isDisabled) ...{
        ActivateIntent: CallbackAction<Intent>(
          onInvoke: (_) => _handlePressed(widget.onTap ?? widget.onLongPressed),
        ),
      },
      ...widget.actions ?? {},
    };
  }

  @override
  Widget build(BuildContext context) {
    final defaultCursor =
        isDisabled ? MouseCursor.defer : SystemMouseCursors.click;
    final cursor = widget.cursor ?? defaultCursor;

    late Widget interaction;
    final builder = _InteractionScope(
      state: this,
      child: Builder(
        builder: (context) => widget.builder(context, this),
      ),
    );
    if (!widget.disableFocus) {
      interaction = FocusableActionDetector(
        focusNode: _focusNode,
        autofocus: widget.autoFocus,
        descendantsAreFocusable: widget.descendantsAreFocusable,
        descendantsAreTraversable: widget.descendantsAreTraversable,
        onFocusChange: _handleFocusChanged,
        onShowFocusHighlight: _handleFocusChanged,
        onShowHoverHighlight: !widget.disableHover ? _handleHoverChanged : null,
        shortcuts: widget.shortcuts,
        mouseCursor: cursor,
        actions: _getKeyboardActions(),
        child: builder,
      );
    } else if (!widget.disableHover) {
      interaction = MouseRegion(
        cursor: cursor,
        onEnter: (_) => _handleHoverChanged(true),
        onExit: (_) => _handleHoverChanged(false),
        child: builder,
      );
    } else {
      interaction = builder;
    }
    // Wrap the interaction in an animation if shakeOnError is true.
    if (widget.shakeOnError) {
      interaction = Animate(
        autoPlay: false,
        onInit: (c) {
          _controller = c;
        },
        effects: const [
          ShakeEffect(),
        ],
        child: interaction,
      );
    }
    if (widget.enableSelection == false) {
      interaction = SelectionContainer.disabled(
        child: interaction,
      );
    }
    if (widget.tooltip != null) {
      interaction = Tooltip(
        tooltip: widget.tooltip!,
        focusNode: _focusNode,
        child: interaction,
      );
    }

    // Return the interaction
    return Semantics(
      label: widget.semanticLabel,
      child: GestureDetector(
        behavior: widget.hitTestBehavior,
        onTap: () => _handlePressed(widget.onTap),
        onLongPress: () => _handlePressed(
          widget.onLongPressed,
          longPress: true,
        ),
        child: interaction,
      ),
    );
  }
}

/// An exception that occurs during an interaction.
class InteractionException {
  /// An exception that occurs during an interaction.
  InteractionException({
    required this.message,
    required this.state,
    required this.stackTrace,
  });

  /// The message of the exception.
  final String message;

  /// The state of the interaction when the exception occurred.
  final InteractionState state;

  /// The stack trace of the exception.
  final StackTrace stackTrace;

  @override
  String toString() => 'InteractionException: $message.\n$state';
}

class _InteractionScope extends InheritedWidget {
  const _InteractionScope({
    required super.child,
    required InteractionState state,
  }) : _state = state;

  final InteractionState _state;

  @override
  bool updateShouldNotify(_InteractionScope old) => _state != old._state;
}

///
extension InteractionStateX on InteractionState? {
  ///
  bool get isDisabled => this?.isDisabled ?? false;

  ///
  bool get isHovered => this?.isHovered ?? false;

  ///
  bool get isFocused => this?.isFocused ?? false;

  ///
  bool get isPressed => this?.isPressed ?? false;

  ///
  bool get isDragged => this?.isDragged ?? false;

  ///
  bool get isSelected => this?.isSelected ?? false;

  ///
  bool get isWaiting => this?.isWaiting ?? false;
}

/// An InteractionType is a property describes the current state
/// of an interaction widget, ie it is Disabled, Hovered, Selected etc.
@immutable
sealed class InteractionType {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InteractionType && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// The widget is currently disabled.
class Disabled extends InteractionType {}

/// The widget is currently hovered.
class Hovered extends InteractionType {}

/// The widget is currently focused.
class Focused extends InteractionType {}

/// The widget is currently pressed.
class Pressed extends InteractionType {}

/// The widget is currently dragged.
class Dragged extends InteractionType {}

/// The widget is currently selected.
class Selected extends InteractionType {}

/// The widget is currently waiting.
class Waiting extends InteractionType {}
