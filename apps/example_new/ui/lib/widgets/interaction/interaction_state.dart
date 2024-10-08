import 'dart:async';
import 'package:flutter/gestures.dart';

///
class InteractionState {
  ///
  const InteractionState({
    this.hovered = false,
    this.pressing = false,
    this.focused = false,
    this.pointerDownEvents,
  });

  ///
  final StreamController<PointerDownEvent>? pointerDownEvents;

  ///
  final bool hovered;

  ///
  final bool focused;

  ///
  final bool pressing;
}
