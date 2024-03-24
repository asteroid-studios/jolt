import 'package:ui/ui.dart';

///
mixin DialogRoute on Widget implements JoltDialogRoute {
  ///
  @override
  String get type => 'dialog';

  ///
  @override
  Duration get transitionDuration => DialogStyle.transitionDuration;

  ///
  @override
  bool get barrierDismissible => DialogStyle.barrierDismissible;

  ///
  @override
  Color get barrierColor => DialogStyle.barrierColor;

  ///
  @override
  Widget transitionBuilder(
    BuildContext context,
    Animation<double> a1,
    Animation<double> a2,
    Widget child,
  ) {
    final curvedValue = Curves.easeInOut.transform(a1.value);
    return Transform.scale(
      scale: curvedValue,
      child: Opacity(
        opacity: a1.value,
        child: Center(child: child),
      ),
    );
  }
}
