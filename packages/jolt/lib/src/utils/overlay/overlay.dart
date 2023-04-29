import 'package:jolt/jolt.dart';

///
final joltOverlayKey = GlobalKey<OverlayStackState>();

///
final joltShellOverlayKey = GlobalKey<OverlayStackState>();

///
extension OverlayExtensions on BuildContext {
  ///
  JoltOverlay get overlay => JoltOverlay(this);
}

///
extension JoltOverlayExtensions on JoltOverlay {
  ///
  Future<T?> show<T extends Object?>({
    required Widget child,
    bool useRootOverlayStack = false,
    int zIndex = 0,
    Alignment position = Alignment.center,
    double? barrierOpacity,
    Color? barrierColor,
    bool barrierDisabled = false,
  }) async {
    return OverlayStack.of(
      context,
      useRootOverlayStack: useRootOverlayStack,
    ).addOverlay<T>(
      PositionedOverlay(
        zIndex: zIndex,
        position: position,
        barrierOpacity: barrierOpacity,
        barrierColor: barrierColor,
        barrierDisabled: barrierDisabled,
        child: child,
      ),
    );
  }

  ///
  void pop<T extends Object?>([
    T? result,
  ]) {
    final overlay = PositionedOverlay.of(context);
    // Get the nearest overlay stack
    OverlayStackState overlayStack = OverlayStack.of(
      context,
      useRootOverlayStack: useRootOverlayStack,
    );
    // If there are no overlays in the stack, use the root overlay stack
    if (!useRootOverlayStack && overlayStack.overlaysLength == 0) {
      OverlayStackState overlayStack = OverlayStack.of(
        context,
        useRootOverlayStack: true,
      );
    }
    // Pop the top layer of the overlay stack
    overlayStack.popOverlay<T>(
      result,
      overlay?.hashCode,
    );
  }
}

///
class JoltOverlay {
  ///
  const JoltOverlay(this.context);

  ///
  final BuildContext context;

  ///
  static Future<T?> show<T extends Object?>({
    required Widget child,
    bool useRootOverlayStack = true,
    int zIndex = 0,
    Alignment position = Alignment.center,
    double? barrierOpacity,
    Color? barrierColor,
    bool barrierDisabled = false,
  }) async {
    final key = useRootOverlayStack ? joltOverlayKey : joltShellOverlayKey;
    if (key.currentState == null) {
      throw Exception('No OverlayStack found');
    }
    return key.currentState!.addOverlay<T>(
      PositionedOverlay(
        position: position,
        zIndex: zIndex,
        barrierOpacity: barrierOpacity,
        barrierColor: barrierColor,
        barrierDisabled: barrierDisabled,
        child: child,
      ),
    );
  }

  ///
  static void pop<T extends Object?>([
    T? result,
    // Unfortunately can't have optional positional params and named params
    // ignore: avoid_positional_boolean_parameters
    bool useRootOverlayStack = true,
    GlobalKey? key,
  ]) {
    final overlayKey =
        useRootOverlayStack ? joltOverlayKey : joltShellOverlayKey;
    if (overlayKey.currentState == null) {
      throw Exception('No OverlayStack found');
    }
    PositionedOverlay? overlay;
    if (key?.currentContext != null) {
      overlay = PositionedOverlay.of(key!.currentContext!);
    }
    overlayKey.currentState!.popOverlay<T>(
      result,
      overlay?.hashCode,
    );
  }
}
