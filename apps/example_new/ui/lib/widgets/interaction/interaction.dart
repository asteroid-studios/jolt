import 'package:flutter/material.dart';

///
class Interaction extends StatefulWidget {
  ///
  const Interaction({required this.builder, super.key});

  final Widget Function(BuildContext context, InteractionState state) builder;

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

  @override
  Widget build(BuildContext context) {
    final child = widget.builder(context, this);
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: FocusableActionDetector(
        child: child,
      ),
    );
  }
}
