import 'dart:async';

import 'package:flutter/material.dart';

///
class Interaction extends StatefulWidget {
  ///
  const Interaction({
    required this.builder,
    this.onTap,
    super.key,
  });

  ///
  final Widget Function(BuildContext context, InteractionState state) builder;

  ///
  final FutureOr<void> Function()? onTap;

  ///
  static InteractionState of(BuildContext context) {
    final state = context.findAncestorStateOfType<InteractionState>();
    if (state == null) throw Exception('No InteractionState found in context');
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

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final child = Builder(builder: (context) => widget.builder(context, this));
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: FocusableActionDetector(
        focusNode: focusNode,
        onFocusChange: (value) => setState(() => focused = value),
        child: GestureDetector(
          onTap: () {
            widget.onTap?.call();
            focusNode.requestFocus();
          },
          child: child,
        ),
      ),
    );
  }
}
