import 'package:ui/ui.dart';

///
abstract class DrawerDialogRoute extends JoltDialogRoute {
  ///
  DrawerAlignment get alignment;

  ///
  double? get crossAxisSize;
}

extension _DrawerDialogRoute on DrawerDialogRoute {
  ///
  double get offset {
    switch (alignment) {
      case DrawerAlignment.right:
      case DrawerAlignment.bottom:
        return crossAxisSize ?? 0;
      case DrawerAlignment.left:
      case DrawerAlignment.top:
        return -(crossAxisSize ?? 0);
    }
  }

  ///
  double? get width {
    switch (alignment) {
      case DrawerAlignment.left:
      case DrawerAlignment.right:
        return crossAxisSize;
      case DrawerAlignment.top:
      case DrawerAlignment.bottom:
        return double.infinity;
    }
  }

  ///
  double? get height {
    switch (alignment) {
      case DrawerAlignment.left:
      case DrawerAlignment.right:
        return double.infinity;
      case DrawerAlignment.top:
      case DrawerAlignment.bottom:
        return crossAxisSize;
    }
  }
}

///
mixin DrawerRoute on Widget implements DrawerDialogRoute {
  ///
  @override
  String get type => 'drawer';

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
    final xTransform = alignment.vertical ? 0.0 : (1 - curvedValue) * offset;
    final yTransform = alignment.vertical ? (1 - curvedValue) * offset : 0.0;
    return Transform(
      transform: Matrix4.translationValues(xTransform, yTransform, 0),
      child: Opacity(
        opacity: curvedValue,
        child: Align(
          alignment: alignment.alignment,
          child: SizedBox(
            width: width,
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}

///
enum DrawerAlignment {
  ///
  left,

  ///
  right,

  ///
  top,

  ///
  bottom;

  ///
  Alignment get alignment {
    switch (this) {
      case DrawerAlignment.left:
        return Alignment.centerLeft;
      case DrawerAlignment.right:
        return Alignment.centerRight;
      case DrawerAlignment.top:
        return Alignment.topCenter;
      case DrawerAlignment.bottom:
        return Alignment.bottomCenter;
    }
  }

  ///
  bool get vertical {
    switch (this) {
      case DrawerAlignment.left:
      case DrawerAlignment.right:
        return false;
      case DrawerAlignment.top:
      case DrawerAlignment.bottom:
        return true;
    }
  }
}
