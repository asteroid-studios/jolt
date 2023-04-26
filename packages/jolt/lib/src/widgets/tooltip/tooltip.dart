import 'package:flutter_portal/flutter_portal.dart';

import 'package:jolt/jolt.dart';

///
class Tooltip extends StatefulWidget {
  ///
  const Tooltip({
    required this.child,
    this.tooltip,
    this.controlState,
    super.key,
  });

  ///
  final String? tooltip;

  ///
  final Widget child;

  // TOdo maybe I can get nearest focus node
  final FocusableControlState? controlState;

  @override
  State<Tooltip> createState() => _TooltipState();
}

class _TooltipState extends State<Tooltip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.tooltip == null) {
      return widget.child;
    }

    final visible = (widget.controlState?.isFocused ?? false) || isHovered;

    var followerAlignment = Alignment.center;
    var targetAlignment = Alignment.center;
    Rect? position;
    if (visible) {
      position = context.globalPaintBounds;
      if (position != null) {
        // Default to top center unless too close to bottom
        if (position.top > 100) {
          followerAlignment = Alignment.bottomCenter;
          targetAlignment = Alignment.topCenter;
        } else {
          followerAlignment = Alignment.topCenter;
          targetAlignment = Alignment.bottomCenter;
        }
      }
    }

    return MouseRegion(
      onEnter: (_) {
        if (!isHovered) {
          setState(() => isHovered = true);
        }
      },
      onExit: (_) {
        if (isHovered) {
          setState(() => isHovered = false);
        }
      },
      child: PortalTarget(
        visible: visible,
        anchor: Aligned(
          follower: followerAlignment,
          target: targetAlignment,
          shiftToWithinBound: const AxisFlag(x: true, y: true),
        ),
        portalFollower: Padding(
          padding: EdgeInsets.all(context.sizing.sm),
          child: Container(
            decoration: BoxDecoration(
              // TODO handle shadow
              boxShadow: [
                BoxShadow(
                  // color: context.color.shadow,
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: context.sizing.md,
                ),
              ],
            ),
            child: Surface(
              padding: EdgeInsets.all(context.sizing.xs),
              child: Text(
                widget.tooltip!,
                style: context.style.bodySmall,
              ),
            ),
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
