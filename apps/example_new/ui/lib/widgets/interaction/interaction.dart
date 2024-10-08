import 'dart:async';
import 'dart:math';

import 'package:ui/ui.dart';

///
class Interaction extends StatefulWidget {
  ///
  const Interaction({
    required this.builder,
    this.onTap,
    this.cursor = SystemMouseCursors.click,
    this.requestFocusOnTap = false,
    this.minPressingDuration = const Duration(milliseconds: 300),
    super.key,
  });

  ///
  final Widget Function(BuildContext context) builder;

  ///
  final FutureOr<void> Function()? onTap;

  ///
  final MouseCursor cursor;

  ///
  final Duration minPressingDuration;

  ///
  final bool requestFocusOnTap;

  ///
  static InteractionState of(BuildContext context) {
    // Mock state is used for testing, to simulate hover, focus, and pressing states.
    final mockState = context.dependOnInheritedWidgetOfExactType<MockInteraction>()?.state;
    final state = context.findAncestorStateOfType<_InteractionState>()?.state;

    return InteractionState(
      hovered: mockState?.hovered ?? state?.hovered ?? false,
      focused: mockState?.focused ?? state?.focused ?? false,
      pressing: mockState?.pressing ?? state?.pressing ?? false,
      pointerDownEvents: mockState?.pointerDownEvents ?? state?.pointerDownEvents,
    );
  }

  @override
  State<Interaction> createState() => _InteractionState();
}

///
class _InteractionState extends State<Interaction> {
  InteractionState get state => InteractionState(
        hovered: hovered,
        focused: focused,
        pressing: _pressedTime != null,
        pointerDownEvents: pointerDownEvents,
      );

  ///
  bool hovered = false;

  ///
  bool focused = false;

  ///
  DateTime? _pressedTime;

  ///
  Timer? _pressingTimer;

  ///
  FocusNode focusNode = FocusNode();

  ///
  StreamController<PointerDownEvent> pointerDownEvents = StreamController.broadcast();

  //
  Future<void> cancelPressing(_) async {
    final timePressed = _pressedTime;
    if (timePressed != null) {
      final elapsed = DateTime.now().difference(timePressed);
      final remaining = widget.minPressingDuration - elapsed;
      _pressingTimer = Timer(Duration(milliseconds: max(0, remaining.inMilliseconds)), () {
        if (state.pressing && mounted) setState(() => _pressedTime = null);
      });
    }
  }

  //
  Future<void> handlePressing(PointerDownEvent event) async {
    // TODO when using action, eg enter or space bar, simulate a button press to trigger splash
    pointerDownEvents.add(event);
    _pressingTimer?.cancel();
    setState(() => _pressedTime = DateTime.now());
  }

  @override
  void dispose() {
    pointerDownEvents.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: widget.cursor,
      child: FocusableActionDetector(
        focusNode: focusNode,
        onFocusChange: (value) => setState(() => focused = value),
        child: GestureDetector(
          onTap: () {
            widget.onTap?.call();
            if (widget.requestFocusOnTap) focusNode.requestFocus();
          },
          child: Listener(
            onPointerDown: handlePressing,
            onPointerUp: cancelPressing,
            onPointerCancel: cancelPressing,
            child: Builder(builder: (context) => widget.builder(context)),
          ),
        ),
      ),
    );
  }
}

///
class MockInteraction extends InheritedWidget {
  ///
  const MockInteraction({
    required this.state,
    required super.child,
    super.key,
  });

  ///
  final InteractionState state;

  @override
  bool updateShouldNotify(MockInteraction oldWidget) => true;
}
