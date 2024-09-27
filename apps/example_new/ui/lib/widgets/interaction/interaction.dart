import 'dart:async';
import 'dart:math';

import 'package:ui/ui.dart';

///
class Interaction extends StatefulWidget {
  ///
  const Interaction({
    required this.builder,
    this.onTap,
    this.style,
    super.key,
  });

  ///
  final Widget Function(BuildContext context, InteractionState state) builder;

  ///
  final FutureOr<void> Function()? onTap;

  ///
  final StyleResolver<InteractionStyle, InteractionState>? style;

  ///
  static InteractionState of(BuildContext context) {
    final state = context.findAncestorStateOfType<InteractionState>();
    if (state == null) {
      if (context.widget is InteractionState) {
        return context.widget as InteractionState;
      }
      throw Exception('No InteractionState found in context');
    }
    return state;
  }

  ///
  static InteractionState? maybeOf(BuildContext context) {
    return context.findAncestorStateOfType<InteractionState>();
  }

  @override
  State<Interaction> createState() => InteractionState();
}

///
class InteractionState extends State<Interaction> {
  ///
  bool hovered = false;

  ///
  bool focused = false;

  ///
  bool get pressing => _pressedTime != null;

  ///
  DateTime? _pressedTime;

  ///
  Timer? _pressingTimer;

  ///
  FocusNode focusNode = FocusNode();

  ///
  StreamController<PointerDownEvent> pointerDownEvents = StreamController.broadcast();

  @override
  void dispose() {
    pointerDownEvents.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = InteractionStyle.defaultStyle(context, this);
    final inlineStyle = widget.style?.call(context, this);
    final style = defaultStyle.resolve(context, inlineStyle);
    final child = Builder(builder: (context) => widget.builder(context, this));
    final minPress = style.minPressingDuration ?? Duration.zero;

    //
    Future<void> cancelPressing(_) async {
      final timePressed = _pressedTime;
      if (timePressed != null) {
        final elapsed = DateTime.now().difference(timePressed);
        final remaining = minPress - elapsed;
        _pressingTimer = Timer(Duration(milliseconds: max(0, remaining.inMilliseconds)), () {
          if (pressing) setState(() => _pressedTime = null);
        });
      }
    }

    //
    Future<void> handlePressing(PointerDownEvent event) async {
      pointerDownEvents.add(event);
      _pressingTimer?.cancel();
      setState(() => _pressedTime = DateTime.now());
    }

    return MouseRegion(
      cursor: style.cursor ?? MouseCursor.defer,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: FocusableActionDetector(
        focusNode: focusNode,
        onFocusChange: (value) => setState(() => focused = value),
        child: GestureDetector(
          onTap: () {
            widget.onTap?.call();
            if (style.requestFocusOnTap ?? false) focusNode.requestFocus();
          },
          child: Listener(
            onPointerDown: handlePressing,
            onPointerUp: cancelPressing,
            onPointerCancel: cancelPressing,
            child: child,
          ),
        ),
      ),
    );
  }
}
