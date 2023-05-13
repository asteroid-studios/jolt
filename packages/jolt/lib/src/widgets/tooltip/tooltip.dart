import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portal/flutter_portal.dart';

import 'package:jolt/jolt.dart';

///
class Tooltip extends StatefulWidget {
  ///
  const Tooltip({
    required this.child,
    this.tooltip,
    this.focusNode,
    this.disabled = false,
    super.key,
  });

  ///
  final String? tooltip;

  ///
  final FocusNode? focusNode;

  ///
  final Widget child;

  final bool disabled;

  @override
  State<Tooltip> createState() => _TooltipState();
}

class _TooltipState extends State<Tooltip> {
  bool isFocused = false;
  bool isHovered = false;
  bool isPressing = false;
  Timer? timer;
  Alignment followerAlignment = Alignment.center;
  Alignment targetAlignment = Alignment.center;
  Rect? position;

  void getPosition() {
    setState(() {
      position = context.globalPaintBounds;
      if (position != null) {
        // Default to top center unless too close to bottom
        if (position!.top > 100) {
          followerAlignment = Alignment.bottomCenter;
          targetAlignment = Alignment.topCenter;
        } else {
          followerAlignment = Alignment.topCenter;
          targetAlignment = Alignment.bottomCenter;
        }
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.focusNode?.addListener(() {
        getPosition();
        setState(() {
          isFocused = widget.focusNode?.hasFocus ?? false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tooltip == null) {
      return widget.child;
    }

    final visible = isFocused || isHovered || isPressing;

    return MouseRegion(
      onEnter: (_) {
        if (!isHovered) {
          getPosition();
          setState(() => isHovered = true);
        }
      },
      onExit: (_) {
        if (isHovered) {
          setState(() => isHovered = false);
        }
      },
      child: Listener(
        onPointerDown: (event) async {
          if (isHovered) {
            setState(() => isHovered = false);
          }
          if (Platform.isMobile || true) {
            // After 500ms, assume its a long press and show the tooltip
            timer?.cancel();
            timer = Timer(
              const Duration(milliseconds: 500),
              () {
                getPosition();
                setState(() => isPressing = true);
              },
            );
          }
        },
        onPointerUp: (event) {
          timer?.cancel();
          if (isPressing) {
            setState(() => isPressing = false);
          }
        },
        child: PortalTarget(
          visible: visible && !widget.disabled,
          anchor: Aligned(
            follower: followerAlignment,
            target: targetAlignment,
            shiftToWithinBound: const AxisFlag(x: true, y: true),
          ),
          portalFollower: Container(
            padding: EdgeInsets.all(context.sizing.sm),
            decoration: BoxDecoration(
              // TODO handle shadow dynamically. Add to surface theme
              boxShadow: [
                BoxShadow(
                  spreadRadius: -12,
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Surface(
              borderRadius: context.borderRadius.md,
              padding: EdgeInsets.all(context.sizing.xs),
              child: SelectionArea(
                focusNode: FocusNode(canRequestFocus: false),
                child: Text(
                  widget.tooltip!,
                  style: context.style.bodySmall,
                  color: context.color.surface.highlight,
                ),
              ),
            ),
          ).animate(delay: const Duration(milliseconds: 300)).fade(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              ),
          child: widget.child,
        ),
      ),
    );
  }
}
