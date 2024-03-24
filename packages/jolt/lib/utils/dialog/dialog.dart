import 'package:jolt/jolt.dart';

///
class JoltDialogRoute {
  ///
  String get type => 'joltDialog';

  ///
  Duration get transitionDuration => const Duration(milliseconds: 200);

  ///
  bool get barrierDismissible => true;

  ///
  Color get barrierColor => const Color(0x00000000);

  ///
  Widget transitionBuilder(
    BuildContext context,
    Animation<double> a1,
    Animation<double> a2,
    Widget child,
  ) {
    return Opacity(
      opacity: Curves.easeInOut.transform(a1.value),
      child: Center(child: child),
    );
  }
}

Future<T?> _show<T>(BuildContext context, Widget modal) async {
  final route =
      modal is JoltDialogRoute ? modal as JoltDialogRoute : JoltDialogRoute();
  Jolt.dialog._updateCurrent(route);
  final parent = Jolt.dialog.parent;
  return Navigator.of(context).push<T>(
    RawDialogRoute<T>(
      pageBuilder: (_, __, ___) => PopScope(
        onPopInvoked: Jolt.dialog._removeCurrent,
        child: modal,
      ),
      transitionDuration: route.transitionDuration,
      transitionBuilder: route.transitionBuilder,
      barrierDismissible: route.barrierDismissible,
      barrierColor: parent?.type == route.type
          ? const Color(0x00000000)
          : route.barrierColor,
      // anchorPoint: anchorPoint,
    ),
  );
}

// TODO come up with a default transition builder? Maybe just fade in/out?

///
class JoltDialog {
  /// private constructor
  JoltDialog._();

  /// the one and only instance of this singleton
  static final instance = JoltDialog._();

  ///
  JoltDialogRoute? get parent =>
      _stack.length <= 1 ? null : _stack.elementAtOrNull(_stack.length - 2);

  final List<JoltDialogRoute> _stack = [];

  void _updateCurrent(JoltDialogRoute route) {
    _stack.add(route);
  }

  void _removeCurrent(bool didPop) {
    if (didPop) {
      _stack.removeLast();
    }
  }

  ///
  Future<T?> show<T>(Widget modal) async {
    final context = Jolt.instance.navigatorKey.currentContext;
    if (context == null) {
      throw StateError('No context found on Jolt.instance.navigatorKey');
    }

    return _show<T>(context, modal);
  }
}

///
extension JoltDialogX on BuildContext {
  ///
  Future<T?> show<T>(Widget modal) async {
    return _show<T>(this, modal);
  }
}
