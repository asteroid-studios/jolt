import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';

import 'package:jolt/jolt.dart';

// TODO
// 1. Overlays should be able to return a value
// 2. Overlays should be able to be dismissed
// 3. Overlays should have a zindex
// 4. Overlays should have a position

///
class OverlayStack extends StatefulWidget {
  ///
  const OverlayStack({
    required this.child,
    super.key,
  });

  ///
  final Widget child;

  /// Returns the [OverlayStackState] from the closest [OverlayStack] ancestor.
  static OverlayStackState of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_OverlayStackScope>()!;
    return scope._overlayStackState;
  }

  @override
  State<OverlayStack> createState() => OverlayStackState();
}

///
class OverlayStackState extends State<OverlayStack> {
  final List<PositionedOverlay> _overlays = [];
  final Map<int, Completer<dynamic>> _popCompleters = {};
  Queue<PositionedOverlay> _snackbars = Queue();

  ///
  Future<T?> addOverlay<T extends Object?>(PositionedOverlay overlay) {
    final completer = Completer<T?>();
    setState(() {
      _overlays.add(overlay);
      _popCompleters[overlay.widget.hashCode] = completer;
    });
    return completer.future;
  }

  ///
  void popOverlay<T extends Object?>([
    T? result,
  ]) {
    setState(() {
      final overlay = _overlays.removeLast();
      final popCompleter = _popCompleters.remove(overlay.widget.hashCode);
      popCompleter?.complete(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: _OverlayStackScope(
        overlayStackState: this,
        child: Stack(
          children: [
            widget.child,
            if (_overlays.isNotEmpty)
              Positioned.fill(
                child: GestureDetector(
                  onTap: popOverlay,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ..._overlays.sortedBy<num>((o) => o.zIndex).map(
                  (o) => Align(
                    alignment: o.position,
                    child: o.widget,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

///
class PositionedOverlay {
  ///
  PositionedOverlay({
    required this.widget,
    this.zIndex = 0,
    this.position = Alignment.center,
  });

  ///
  final int zIndex;

  ///
  final Alignment position;

  ///
  final Widget widget;
}

class _OverlayStackScope extends InheritedWidget {
  const _OverlayStackScope({
    required super.child,
    required OverlayStackState overlayStackState,
  }) : _overlayStackState = overlayStackState;

  final OverlayStackState _overlayStackState;

  @override
  bool updateShouldNotify(_OverlayStackScope old) =>
      _overlayStackState != old._overlayStackState;
}
