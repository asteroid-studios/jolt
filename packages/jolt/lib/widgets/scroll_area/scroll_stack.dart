import 'package:boxy/boxy.dart';
import 'package:jolt/jolt.dart';

///
class ScrollStack extends StatefulWidget {
  ///
  const ScrollStack({
    required this.child,
    this.start,
    this.end,
    this.axis = Axis.vertical,
    super.key,
  });

  ///
  final Widget child;

  ///
  final Widget? start;

  ///
  final Widget? end;

  ///
  final Axis axis;

  @override
  State<ScrollStack> createState() => _ScrollStackState();
}

class _ScrollStackState extends State<ScrollStack> {
  final notifier = _ScrollStackNotifier();

  @override
  void didUpdateWidget(covariant ScrollStack oldWidget) {
    if (oldWidget != widget) notifier.updateState();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomBoxy(
      delegate: _ScrollStackDelegate(
        widget.child,
        widget.axis,
        start: widget.start,
        end: widget.end,
        relayout: notifier,
      ),
    );
  }
}

class _ScrollStackNotifier with ChangeNotifier {
  void updateState() {
    notifyListeners();
  }
}

///
class _ScrollStackDelegate extends BoxyDelegate {
  ///
  _ScrollStackDelegate(
    this.child,
    this.axis, {
    this.start,
    this.end,
    super.relayout,
    super.repaint,
  });

  ///
  final Widget child;

  ///
  final Axis axis;

  ///
  final Widget? start;

  ///
  final Widget? end;

  @override
  Size layout() {
    // If top and bottom are null, just layout the child normally
    if (start == null && end == null) {
      final child = inflate(this.child);
      final size = child.layout(constraints);
      child.position(Offset.zero);
      return size;
    }

    final isVertical = axis == Axis.vertical;

    // First we need to layout the start and end to get the size
    final minConstraints = constraints.copyWith(minHeight: 0, minWidth: 0);
    final tempStartWidget = start != null ? inflate(start!) : null;
    final tempEndWidget = end != null ? inflate(end!) : null;
    final startSize = tempStartWidget?.layout(minConstraints);
    final endSize = tempEndWidget?.layout(minConstraints);
    final startMainAxisSize =
        isVertical ? startSize?.height ?? 0 : startSize?.width ?? 0;
    final endMainAxisSize =
        isVertical ? endSize?.height ?? 0 : endSize?.width ?? 0;

    // Context will be used to get the context parents scroll padding
    final context = tempStartWidget?.context ?? tempEndWidget?.context;
    if (context == null) {
      throw Exception('Start or end widget must have a context');
    }

    // We ignore the temporary start and end widgets
    // because we want to paint them on top of the child
    tempStartWidget?.ignore();
    tempEndWidget?.ignore();

    // Inflate the child with the scroll padding
    final child = inflate(
      ScrollPadding(
        start: startMainAxisSize,
        end: endMainAxisSize,
        context: context,
        child: this.child,
      ),
    );
    final childSize = child.layout(constraints);
    child.position(Offset.zero);

    // Inflate the start and end widgets on top of the stack
    final startWidget = start != null ? inflate(start!) : null;
    final endWidget = end != null ? inflate(end!) : null;
    startWidget?.layout(minConstraints);
    endWidget?.layout(minConstraints);

    // Position the start and end using existing scroll padding
    final scrollPadding = ScrollPadding.of(context);
    startWidget?.position(
      Offset(
        isVertical ? 0 : scrollPadding.start,
        isVertical ? scrollPadding.start : 0,
      ),
    );
    final endOffset = childSize.height - endMainAxisSize - scrollPadding.end;
    endWidget?.position(
      Offset(
        isVertical ? 0 : endOffset,
        isVertical ? endOffset : 0,
      ),
    );

    // Return the child size
    return childSize;
  }
}
