import 'package:ui/ui.dart';

///
mixin DialogRoute on Object implements JoltDialogRoute {
  ///
  @override
  Duration get transitionDuration => Durations.medium;

  ///
  @override
  bool get barrierDismissible => true;

  ///
  @override
  bool get stackBarrier => false;

  ///
  @override
  bool get disableBarrier => false;

  ///
  @override
  Color get barrierColor => disableBarrier ? Colors.transparent : Colors.barrier;

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

class _DialogSurface extends StatelessWidget {
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
        color: Colors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignCenter,
          color: Colors.outline,
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
