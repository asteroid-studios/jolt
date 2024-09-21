import 'dart:math';

import 'package:jolt/jolt.dart';

///
class Collapsible extends StatefulWidget {
  ///
  const Collapsible({
    required this.child,
    this.collapsed = false,
    this.collapsedSize = 0,
    this.keepSizeWhenCollapsed = false,
    this.allowScrollWhenCollapsed = false,
    this.alignEndWhenCollapsed = false,
    this.axis = Axis.vertical,
    this.animationDuration = const Duration(milliseconds: 300),
    this.collapsedSizeOffset,
    super.key,
  });

  ///
  final bool collapsed;

  ///
  final bool allowScrollWhenCollapsed;

  ///
  final bool alignEndWhenCollapsed;

  ///
  final bool keepSizeWhenCollapsed;

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

  ///
  bool get collapsed => _collapsed;

  @override
  void initState() {
    super.initState();
    _collapsed = widget.collapsed;
    _initialCollapsed = widget.collapsed;
  }

  ///
  void collapse() => setState(() => _collapsed = true);

  ///
  void expand() => setState(() => _collapsed = false);

  ///
  void toggle() => setState(() => _collapsed = !_collapsed);

  void _updateSize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
        width: widget.keepSizeWhenCollapsed ? _width : null,
        height: widget.keepSizeWhenCollapsed ? _height : null,
        child: AnimatedContainer(
          duration: widget.animationDuration,
          height: _collapsed && widget.axis == Axis.vertical
              ? collapsedAmount
              : _height,
          width: _collapsed && widget.axis == Axis.horizontal
              ? collapsedAmount
              : _width,
          child: SingleChildScrollView(
            reverse: widget.alignEndWhenCollapsed,
            physics: widget.allowScrollWhenCollapsed
                ? null
                : const NeverScrollableScrollPhysics(),
            scrollDirection: widget.axis,
            child: MeasurableWidget(
              onChange: (Size size) {
                Future.delayed(Duration.zero, () {
                  if (!mounted) return;
                  if (widget.axis == Axis.horizontal && size.width != _width) {
                    setState(() => _width = size.width);
                  } else if (widget.axis == Axis.vertical &&
                      size.height != _height) {
                    setState(() => _height = size.height);
                  }
                });
              },
              child: widget.child,
            ),
          ),
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
