import 'package:jolt/jolt.dart';

///
final joltOverlayKey = GlobalKey<OverlayStackState>();

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
    int zIndex = 0,
    Alignment position = Alignment.center,
  }) async {
    return OverlayStack.of(context).addOverlay<T>(
      PositionedOverlay(
        zIndex: zIndex,
        position: position,
        child: child,
      ),
    );
  }

  ///
  void pop<T extends Object?>([T? result]) {
    final overlay = PositionedOverlay.of(context);
    OverlayStack.of(context).popOverlay<T>(
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
    int zIndex = 0,
    Alignment position = Alignment.center,
  }) async {
    if (joltOverlayKey.currentState == null) {
      throw Exception('No OverlayStack found');
    }
    return joltOverlayKey.currentState!.addOverlay<T>(
      PositionedOverlay(
        position: position,
        zIndex: zIndex,
        child: child,
      ),
    );
  }

  ///
  static void pop<T extends Object?>([T? result, GlobalKey? key]) {
    if (joltOverlayKey.currentState == null) {
      throw Exception('No OverlayStack found');
    }
    PositionedOverlay? overlay;
    if (key?.currentContext != null) {
      overlay = PositionedOverlay.of(key!.currentContext!);
    }
    joltOverlayKey.currentState!.popOverlay<T>(
      result,
      overlay?.hashCode,
    );
  }
}
