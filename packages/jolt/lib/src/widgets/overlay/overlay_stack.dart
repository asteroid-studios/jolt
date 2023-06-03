import 'dart:async';

import 'package:collection/collection.dart';

import 'package:jolt/jolt.dart';

// TODO
// 4. Overlays should have a position
// 4. Overlays should animate in and out

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
  static OverlayStackState of(
    BuildContext context, {
    bool useRootOverlayStack = false,
  }) {
    return useRootOverlayStack
        ? context.findRootAncestorStateOfType<OverlayStackState>()!
        : context.findAncestorStateOfType<OverlayStackState>()!;
  }

  @override
  State<OverlayStack> createState() => OverlayStackState();
}

///
class OverlayStackState extends State<OverlayStack> {
  final List<PositionedOverlay> _overlays = [];
  final Map<int, Completer<dynamic>> _popCompleters = {};
  // final Queue<PositionedOverlay> _snackbars = Queue();

  int get overlaysLength => _overlays.length;

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
    final hideBarrier =
        _overlays.lastOrNull?.barrierDisabled ?? _overlays.isEmpty;
    return Stack(
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
                  color: _overlays.lastOrNull?.barrierColor ?? Colors.black,
                ),
              ),
            ),
          ),
        ),
        // TODO animate overlays in and out
        ..._overlays.map(
          (o) => Align(
            alignment: o.position,
            child: SelectionArea(child: o),
          ),
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
