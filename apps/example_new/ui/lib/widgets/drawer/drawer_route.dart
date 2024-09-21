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
mixin DrawerRoute on Object implements DrawerDialogRoute {
  ///
  @override
  Duration get transitionDuration => Durations.medium;

  ///
  @override
  bool get barrierDismissible => true;

  ///
  @override
  Color get barrierColor => disableBarrier ? Colors.transparent : Colors.barrier;

  ///
  @override
  bool get stackBarrier => false;

  ///
  @override
  bool get disableBarrier => false;

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
    // TODO animate drawer out when another pops on top
    return Transform(
      transform: Matrix4.translationValues(xTransform, yTransform, 0),
      child: Opacity(
        opacity: curvedValue * (1 - (a2.value / 3)),
        child: Align(
          alignment: alignment.alignment,
          child: _DrawerSurface(
            alignment: alignment,
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
class _DrawerSurface extends StatelessWidget {
  ///
  const _DrawerSurface({
    required this.width,
    required this.height,
    required this.alignment,
    required this.child,
  });

  final double? width;
  final double? height;
  final DrawerAlignment alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO replace with DialogStyle
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      // margin: const EdgeInsets.symmetric(vertical: 8),
      // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.background,
        borderRadius: BorderRadius.only(
          topLeft: alignment == DrawerAlignment.right || alignment == DrawerAlignment.bottom
              ? const Radius.circular(16)
              : Radius.zero,
          topRight: alignment == DrawerAlignment.left || alignment == DrawerAlignment.bottom
              ? const Radius.circular(16)
              : Radius.zero,
          bottomLeft: alignment == DrawerAlignment.right || alignment == DrawerAlignment.top
              ? const Radius.circular(16)
              : Radius.zero,
          bottomRight: alignment == DrawerAlignment.left || alignment == DrawerAlignment.top
              ? const Radius.circular(16)
              : Radius.zero,
        ),
        border: Border(
          left: alignment == DrawerAlignment.right ? BorderSide(color: Colors.outline) : BorderSide.none,
          right: alignment == DrawerAlignment.left ? BorderSide(color: Colors.outline) : BorderSide.none,
          top: alignment == DrawerAlignment.bottom ? BorderSide(color: Colors.outline) : BorderSide.none,
          bottom: alignment == DrawerAlignment.top ? BorderSide(color: Colors.outline) : BorderSide.none,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 32,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
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
