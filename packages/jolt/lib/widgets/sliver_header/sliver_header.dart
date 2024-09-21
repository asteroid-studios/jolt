import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverHeader extends StatefulWidget {
  const SliverHeader({
    required this.child,
    this.scrolledChild,
    this.pinned = false,
    this.floating = false,
    super.key,
  });

  final Widget child;
  final Widget? scrolledChild;
  final bool pinned;
  final bool floating;

  @override
  State<SliverHeader> createState() => _SliverHeaderState();
}

class _SliverHeaderState extends State<SliverHeader> {
  ScrollDirection scrollDirection = ScrollDirection.forward;
  double pixelsAtLastDirectionChange = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.pinned) return PinnedHeaderSliver(child: widget.child);

    if (widget.floating) {
      final position = Scrollable.of(context).position;

      return ListenableBuilder(
        listenable: position,
        builder: (context, _) {
          final direction = position.userScrollDirection;
          if (direction != ScrollDirection.idle &&
              scrollDirection != direction) {
            scrollDirection = direction;
            if (direction == ScrollDirection.forward) {
              pixelsAtLastDirectionChange = position.pixels;
            }
          }
          final double visibleHeight =
              max(0, pixelsAtLastDirectionChange - position.pixels);
          print(visibleHeight);
          final visible = scrollDirection == ScrollDirection.forward;

          return SliverResizingHeader(
            minExtentPrototype: Container(
              constraints: BoxConstraints(
                maxHeight: visible ? visibleHeight : 0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.scrolledChild ?? widget.child,
                ],
              ),
            ),
            child: SingleChildScrollView(
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              child: widget.child,
            ),
          );
        },
      );
    }

    return SliverResizingHeader(
      minExtentPrototype: widget.scrolledChild,
      child: SingleChildScrollView(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        child: widget.child,
      ),
    );
  }
}
