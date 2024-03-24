import 'package:ui/ui.dart';

///
mixin BottomSheetRoute on Widget implements JoltDialogRoute {
  ///
  @override
  String get type => 'bottomSheet';

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
    final transform = (1 - curvedValue) * 200;
    return Transform(
      transform: Matrix4.translationValues(0, transform, 0),
      child: Opacity(
        opacity: curvedValue,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      ),
    );
  }
}
