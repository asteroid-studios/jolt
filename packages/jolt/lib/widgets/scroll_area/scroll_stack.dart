import 'package:boxy/boxy.dart';
import 'package:jolt/jolt.dart';

///
class ScrollStack extends StatefulWidget {
  ///
  const ScrollStack({
    required this.child,
    this.top,
    this.bottom,
    this.loadBottomAsStackDuringCalculation = false,
    super.key,
  });

  ///
  final Widget child;

  ///
  final Widget? top;

  ///
  final Widget? bottom;

  /// If you are not nesting multiple ScrollStacks throughout your widget tree,
  /// you will have the smoothest loading by setting
  /// [loadBottomAsStackDuringCalculation] to true
  ///
  /// This means that the bottom widget will be stacked instead of loading
  /// like a column during the calculation phase.
  final bool loadBottomAsStackDuringCalculation;

  @override
  State<ScrollStack> createState() => _ScrollStackState();
}

class _ScrollStackState extends State<ScrollStack> {
  double startPadding = 0;
  double endPadding = 0;
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return CustomBoxy(
      delegate: ScrollStackDelegate(),
      children: [
        BoxyId(
          id: '#child',
          data: (
            (double start, double end) {
              if (start == startPadding && end == endPadding) return;
              startPadding = start;
              endPadding = end;
              loaded = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {});
              });
            },
            loaded,
          ),
          child: ScrollPadding(
            start: startPadding,
            end: endPadding,
            context: context,
            child: widget.child,
          ),
        ),
        if (widget.top != null) BoxyId(id: '#top', child: widget.top!),
        if (widget.bottom != null)
          BoxyId(
            id: '#bottom',
            data: widget.loadBottomAsStackDuringCalculation,
            child: widget.bottom!,
          ),
      ],
    );
  }
}

///
class ScrollStackDelegate extends BoxyDelegate {
  @override
  Size layout() {
    final top = getChildOrNull('#top');
    final topSize = top?.layout(constraints);
    final topHeight = topSize?.height ?? 0;
    final bottom = getChildOrNull('#bottom');
    final bottomSize = bottom?.layout(constraints);
    final bottomHeight = bottomSize?.height ?? 0;
    final alwaysStackBottom = bottom?.parentData as bool? ?? false;
    final child = getChild('#child');
    final data = child.parentData as (
      void Function(double start, double end),
      bool loaded
    );
    data.$1(topSize?.height ?? 0, bottomSize?.height ?? 0);
    final loaded = data.$2;

    // Before actually loaded, layout like a column
    if (!loaded) {
      final childSize = child.layout(
        BoxConstraints(
          maxHeight: constraints.maxHeight -
              topHeight -
              (alwaysStackBottom ? 0 : bottomHeight),
          maxWidth: constraints.maxWidth,
        ),
      );
      top?.position(Offset.zero);
      child.position(Offset(0, topHeight));
      bottom?.position(
        Offset(
          0,
          topHeight + childSize.height - (alwaysStackBottom ? bottomHeight : 0),
        ),
      );
      return Size(childSize.width, constraints.maxHeight);
    }

    // After loaded and scroll padding is available, layout as stack
    final childSize = child.layout(constraints);
    child.position(Offset.zero);
    final scrollPadding = ScrollPadding.of(child.context);
    top?.position(Offset(0, scrollPadding.start));
    bottom?.position(
      Offset(0, childSize.height - bottomHeight - scrollPadding.end),
    );
    return childSize;
  }
}
