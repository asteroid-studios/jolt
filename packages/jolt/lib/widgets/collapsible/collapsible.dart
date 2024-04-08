import 'dart:math';

import 'package:jolt/jolt.dart';

///
class Collapsible extends StatefulWidget {
  ///
  const Collapsible({
    required this.child,
    this.collapsed = false,
    this.collapsedSize = 0,
    this.keepHeightWhenCollapsed = false,
    this.alignment = Alignment.topLeft,
    this.axis = Axis.vertical,
    this.animationDuration = const Duration(milliseconds: 300),
    this.collapsedSizeOffset,
    super.key,
  });

  ///
  final bool collapsed;

  ///
  final bool keepHeightWhenCollapsed;

  ///
  final double collapsedSize;

  ///
  final double? collapsedSizeOffset;

  ///
  final Widget child;

  ///
  final Axis axis;

  ///
  final Duration animationDuration;

  ///
  final AlignmentGeometry alignment;

  @override
  State<Collapsible> createState() => CollapsibleState();

  ///
  static CollapsibleState of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_CollapsibleScope>();
    if (scope == null) {
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary(
            'Collapsible.of() called with a context that does not contain a Collapsible.',
          ),
          context.describeElement('The context used was'),
        ],
      );
    }
    return scope.state;
  }
}

///
class CollapsibleState extends State<Collapsible> {
  ///
  late bool _collapsed;
  late bool _initialCollapsed;

  ///
  double? _width;
  double? _height;

  late GlobalKey _childKey;

  ///
  bool get collapsed => _collapsed;

  @override
  void initState() {
    super.initState();
    _collapsed = widget.collapsed;
    _initialCollapsed = widget.collapsed;
    _childKey = GlobalKey();
  }

  ///
  void collapse() => setState(() => _collapsed = true);

  ///
  void expand() => setState(() => _collapsed = false);

  ///
  void toggle() => setState(() => _collapsed = !_collapsed);

  void _updateSize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get the size of the child
      final renderBox =
          _childKey.currentContext?.findRenderObject() as RenderBox?;
      final size = renderBox?.size ?? Size.zero;
      if (widget.axis == Axis.horizontal && size.width != _width) {
        setState(() => _width = size.width);
      } else if (widget.axis == Axis.vertical && size.height != _height) {
        setState(() => _height = size.height);
      }
      if (_initialCollapsed != widget.collapsed) {
        setState(() {
          _collapsed = widget.collapsed;
          _initialCollapsed = widget.collapsed;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateSize();
    final mainAxisSize = _width ?? _height;
    final offsetSize = widget.collapsedSizeOffset;
    final collapsedAmount = offsetSize != null && mainAxisSize != null
        ? max(0, mainAxisSize - max(offsetSize, 0)).toDouble()
        : widget.collapsedSize;

    return _CollapsibleScope(
      state: this,
      child: SizedBox(
        width: widget.keepHeightWhenCollapsed ? _width : null,
        height: widget.keepHeightWhenCollapsed ? _height : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Offstage(
              child: SizedBox(
                key: _childKey,
                child: widget.child,
              ),
            ),
            AnimatedContainer(
              duration: widget.animationDuration,
              height: _collapsed && widget.axis == Axis.vertical
                  ? collapsedAmount
                  : _height,
              width: _collapsed && widget.axis == Axis.horizontal
                  ? collapsedAmount
                  : _width,
              child: ClipRRect(
                child: _width != null || _height != null
                    ? OverflowBox(
                        alignment: widget.alignment,
                        minHeight: 0,
                        minWidth: 0,
                        maxHeight:
                            widget.axis == Axis.vertical ? _height : null,
                        maxWidth:
                            widget.axis == Axis.horizontal ? _width : null,
                        child: widget.child,
                      )
                    : widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CollapsibleScope extends InheritedWidget {
  const _CollapsibleScope({
    required this.state,
    required super.child,
  });

  final CollapsibleState state;

  @override
  bool updateShouldNotify(_CollapsibleScope oldWidget) => true;
}
