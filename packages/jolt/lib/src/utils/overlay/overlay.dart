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
    int zindex = 0,
    Alignment position = Alignment.center,
  }) async {
    return OverlayStack.of(context).addOverlay<T>(
      PositionedOverlay(
        widget: child,
        zIndex: zindex,
        position: position,
      ),
    );
  }

  ///
  void pop<T extends Object?>([T? result]) {
    OverlayStack.of(context).popOverlay<T>(result);
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
    int zindex = 0,
    Alignment position = Alignment.center,
  }) async {
    if (joltOverlayKey.currentState == null) {
      throw Exception('No OverlayStack found');
    }
    return joltOverlayKey.currentState!.addOverlay<T>(
      PositionedOverlay(
        widget: child,
        zIndex: zindex,
        position: position,
      ),
    );
  }

  ///
  static void pop<T extends Object?>([T? result]) {
    if (joltOverlayKey.currentState == null) {
      throw Exception('No OverlayStack found');
    }
    joltOverlayKey.currentState!.popOverlay<T>(result);
  }
}
