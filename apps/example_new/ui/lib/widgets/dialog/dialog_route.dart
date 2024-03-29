import 'package:ui/ui.dart';

///
mixin DialogRoute on Object implements JoltDialogRoute {
  ///
  @override
  Duration get transitionDuration => DefaultDialogStyle.transitionDuration;

  ///
  @override
  bool get barrierDismissible => DefaultDialogStyle.barrierDismissible;

  ///
  @override
  bool get stackBarrier => DefaultDialogStyle.stackBarrier;

  ///
  @override
  bool get disableBarrier => false;

  ///
  @override
  Color get barrierColor =>
      disableBarrier ? Colors.transparent : DefaultDialogStyle.barrierColor;

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
        opacity: a1.value * (1 - (a2.value / 3)),
        child: Center(child: _DialogSurface(child: child)),
      ),
    );
  }
}

class _DialogSurface extends StatelessWidget with ThemeValues {
  const _DialogSurface({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO replace with DialogStyle
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: color.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignCenter,
          color: color.outline,
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
