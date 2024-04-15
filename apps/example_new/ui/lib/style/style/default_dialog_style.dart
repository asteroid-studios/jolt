import 'package:ui/ui.dart';

///
class DefaultDialogStyle {
  ///
  static Duration get transitionDuration => const Duration(milliseconds: 200);

  ///
  static bool get barrierDismissible => true;

  ///
  static bool get stackBarrier => false;

  ///
  static Color get barrierColor => Colors.black.withOpacity(0.5);
}
