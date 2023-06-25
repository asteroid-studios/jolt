import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portal/flutter_portal.dart';

import 'package:jolt/jolt.dart';

///
class Tooltip extends StatefulWidget {
  ///
  const Tooltip({
    required this.child,
    required this.tooltip,
    this.hasFocus = false,
    this.disabled = false,
    super.key,
  });

  ///
  final String tooltip;

  ///
  final Widget child;

  /// Will stop the tooltip from showing
  final bool disabled;

  /// If the tooltip should be shown as if it has focus
  final bool hasFocus;

  @override
  State<Tooltip> createState() => _TooltipState();
}

class _TooltipState extends State<Tooltip> {
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
      getPosition();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final visible = widget.hasFocus || isHovered || isPressing;

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
            padding: EdgeInsets.all(context.spacing.sm),
            decoration: BoxDecoration(
              // TODO handle shadow dynamically. Add to surface theme
              boxShadow: [
                BoxShadow(
                  color: context.color.background.withOpacity(0.9),
                  blurRadius: 24,
                  spreadRadius: -8,
                ),
              ],
            ),
            child: Surface(
              borderRadius: context.borderRadius.md,
              padding: EdgeInsets.all(context.spacing.xs),
              child: SelectionArea(
                focusNode: FocusNode(canRequestFocus: false),
                child: Text(
                  widget.tooltip,
                  style: context.style.bodySmall,
                  color: context.color.surface.foreground,
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
