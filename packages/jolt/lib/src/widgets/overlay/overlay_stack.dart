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
      _overlays
        ..add(overlay)
        ..sort((a, b) => a.zIndex.compareTo(b.zIndex));
      _popCompleters[overlay.hashCode] = completer;
    });
    return completer.future;
  }

  ///
  void popOverlay<T extends Object?>([
    T? result,
    int? hashCode,
  ]) {
    PositionedOverlay? overlay;
    if (hashCode != null) {
      overlay = _overlays.firstWhereOrNull((o) => o.hashCode == hashCode);
    } else {
      overlay = _overlays.last;
    }
    if (overlay != null) {
      setState(() {
        _overlays.remove(overlay);
        final popCompleter = _popCompleters.remove(overlay.hashCode);
        popCompleter?.complete(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) {
            final hideBarrier =
                _overlays.lastOrNull?.barrierDisabled ?? _overlays.isEmpty;
            return SelectionArea(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: _OverlayStackScope(
                  overlayStackState: this,
                  child: Stack(
                    children: [
                      widget.child,
                      Positioned.fill(
                        child: AnimatedOpacity(
                          opacity: hideBarrier
                              ? 0
                              : _overlays.lastOrNull?.barrierOpacity ??
                                  (context.color.isDark ? 0.5 : 0.2),
                          duration: const Duration(milliseconds: 300),
                          child: IgnorePointer(
                            ignoring: hideBarrier,
                            child: GestureDetector(
                              onTap: popOverlay,
                              child: Container(
                                color: _overlays.lastOrNull?.barrierColor ??
                                    Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // TODO animate overlays in and out
                      ..._overlays.map(
                        (o) => Align(
                          alignment: o.position,
                          child: o,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

///
class PositionedOverlay extends InheritedTheme {
  ///
  const PositionedOverlay({
    required super.child,
    this.zIndex = 0,
    this.barrierOpacity,
    this.barrierColor,
    this.barrierDisabled = false,
    this.position = Alignment.center,
    super.key,
  });

  ///
  final int zIndex;

  ///
  final double? barrierOpacity;

  ///
  final Color? barrierColor;

  ///
  final bool barrierDisabled;

  ///
  final Alignment position;

  ///
  static PositionedOverlay? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PositionedOverlay>();
  }

  @override
  bool updateShouldNotify(PositionedOverlay oldWidget) =>
      child != oldWidget.child;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return PositionedOverlay(
      position: position,
      zIndex: zIndex,
      barrierOpacity: barrierOpacity,
      barrierColor: barrierColor,
      barrierDisabled: barrierDisabled,
      child: child,
    );
  }
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
