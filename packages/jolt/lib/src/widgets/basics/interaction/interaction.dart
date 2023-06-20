import 'dart:async';

import 'package:flutter/services.dart';

import 'package:flutter_animate/flutter_animate.dart';

import 'package:jolt/jolt.dart';

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
    this.tooltip,
    this.actions,
    this.shortcuts,
    this.hitTestBehavior,
    this.focusNode,
    this.focusNodeListenOnly,
    this.disablePressWhenAwaiting = true,
    this.descendantsAreFocusable = true,
    this.descendantsAreTraversable = true,
    this.shakeOnError = true,
    this.requestFocusOnPress = true,
    this.autoFocus = false,
    this.disableTextSelection = true,
    this.supportedInteractions = const [
      InteractionType.focus,
      InteractionType.hover,
      InteractionType.press,
    ],
    super.key,
  });

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

  /// Define the interactions supported by this widget. Defaults to all.
  final List<InteractionType> supportedInteractions;

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

  /// Whether to disable text selection inside the widget.
  final bool disableTextSelection;

  /// The tooltip for the widget
  final String? tooltip;

  /// Provide a focus node for the widget
  final FocusNode? focusNode;

  /// A focus node that should only be listened to
  final FocusNode? focusNodeListenOnly;

  @override
  State<Interaction> createState() => InteractionState();
}

/// The state of an [Interaction] widget.
class InteractionState extends State<Interaction> {
  /// The interactions supported by this widget.
  late List<InteractionType> supportedInteractions;

  /// Whether the widget is focusable.
  bool get canBeFocused =>
      supportedInteractions.contains(InteractionType.focus);

  /// Whether the widget can be pressed
  bool get canBePressed =>
      supportedInteractions.contains(InteractionType.press);

  /// Whether the widget can be hovered
  bool get canBeHovered =>
      supportedInteractions.contains(InteractionType.hover);

  /// The focus node for this widget.
  FocusNode? get focusNode => _focusNode;
  FocusNode? _focusNode;

  /// Whether the widget is hovered.
  bool get isHovered => _isHovered;
  bool _isHovered = false;

  /// Whether the widget is focused.
  bool get isFocused => _isFocused;
  bool _isFocused = false;

  /// True if the widget was focused after pressing
  bool get wasFocusedAfterPress => _wasFocusedAfterPress;
  bool _wasFocusedAfterPress = false;

  /// Whether the widget has a press handler.
  bool get hasPressHandler =>
      widget.onTap != null || widget.onLongPressed != null;

  /// Whether the widget is awaiting the result of a press handler.
  bool get isAwaiting => _isAwaiting;
  bool _isAwaiting = false;

  AnimationController? _controller;

  @override
  void initState() {
    supportedInteractions = widget.supportedInteractions;
    _focusNode = canBeFocused && widget.focusNodeListenOnly == null
        ? (widget.focusNode ?? FocusNode())
        : null;
    if (widget.focusNodeListenOnly != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.focusNodeListenOnly!.addListener(() {
          _handleFocusChanged(widget.focusNodeListenOnly!.hasFocus);
        });
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  void _handleHoverChanged(bool v) {
    setState(() => _isHovered = v);
    widget.onHoverChanged?.call(context, this);
  }

  void _handleFocusChanged(bool v) {
    if (!v && _wasFocusedAfterPress) {
      setState(() => _wasFocusedAfterPress = false);
    }
    setState(() => _isFocused = v);
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
      if (_isAwaiting) return;
      // Set is awaiting to true, and rebuild.
      setState(() => _isAwaiting = true);
    }
    if (widget.requestFocusOnPress && !Platform.isMobile) {
      setState(() => _wasFocusedAfterPress = true);
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
    setState(() => _isAwaiting = false);
  }

  // By default, will bind the [ActivateIntent] from the flutter SDK to the onTap callback.
  /// This will enable SPACE and ENTER keys on most platforms.
  /// Also accepts additional actions provided externally.
  Map<Type, Action<Intent>> _getKeyboardActions() {
    return {
      if (canBePressed && hasPressHandler) ...{
        ActivateIntent: CallbackAction<Intent>(
          onInvoke: (_) => _handlePressed(widget.onTap ?? widget.onLongPressed),
        ),
      },
      ...widget.actions ?? {},
    };
  }

  @override
  Widget build(BuildContext context) {
    final pressEnabled = canBePressed && hasPressHandler;
    final defaultCursor =
        pressEnabled ? SystemMouseCursors.click : MouseCursor.defer;
    final cursor = widget.cursor ?? defaultCursor;

    late Widget interaction;
    if (canBeFocused && _focusNode != null) {
      interaction = FocusableActionDetector(
        enabled: pressEnabled,
        focusNode: _focusNode,
        autofocus: widget.autoFocus,
        descendantsAreFocusable: widget.descendantsAreFocusable,
        descendantsAreTraversable: widget.descendantsAreTraversable,
        onFocusChange: _handleFocusChanged,
        onShowFocusHighlight: _handleFocusChanged,
        onShowHoverHighlight: canBeHovered ? _handleHoverChanged : null,
        shortcuts: widget.shortcuts,
        mouseCursor: cursor,
        actions: _getKeyboardActions(),
        child: widget.builder(context, this),
      );
    } else if (canBeHovered) {
      interaction = MouseRegion(
        cursor: cursor,
        onEnter: (_) => _handleHoverChanged(true),
        onExit: (_) => _handleHoverChanged(false),
        child: widget.builder(context, this),
      );
    } else {
      interaction = widget.builder(context, this);
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
    if (widget.disableTextSelection) {
      interaction = SelectionContainer.disabled(
        child: interaction,
      );
    }
    if (widget.tooltip != null) {
      interaction = Tooltip(
        tooltip: widget.tooltip!,
        hasFocus: isFocused && !wasFocusedAfterPress,
        child: interaction,
      );
    }

    // Return the interaction
    return Semantics(
      label: widget.semanticLabel,
      button: pressEnabled,
      focused: isFocused,
      focusable: canBeFocused,
      child: canBePressed
          ? GestureDetector(
              behavior: widget.hitTestBehavior,
              onTap: () => _handlePressed(widget.onTap),
              onLongPress: () => _handlePressed(
                widget.onLongPressed,
                longPress: true,
              ),
              child: interaction,
            )
          : interaction,
    );
  }
}

/// The different types of interactions and Interaction widget can have.
enum InteractionType {
  /// The widget can be hovered over.
  hover,

  /// The widget can be focused.
  focus,

  /// The widget can be pressed.
  press,

  /// The widget can be dragged.
  // drag,
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
