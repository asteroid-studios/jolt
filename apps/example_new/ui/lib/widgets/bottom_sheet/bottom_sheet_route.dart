import 'package:ui/ui.dart';

///
mixin BottomSheetRoute on Object implements JoltDialogRoute {
  ///
  @override
  Duration get transitionDuration => DefaultDialogStyle.transitionDuration;

  ///
  @override
  bool get barrierDismissible => DefaultDialogStyle.barrierDismissible;

  ///
  @override
  Color get barrierColor =>
      disableBarrier ? Colors.transparent : DefaultDialogStyle.barrierColor;

  ///
  @override
  bool get stackBarrier => DefaultDialogStyle.stackBarrier;

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
    final transform = (1 - curvedValue) * 200;
    return Transform(
      transform: Matrix4.translationValues(0, transform, 0),
      child: Opacity(
        opacity: curvedValue * (1 - (a2.value / 3)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: _BottomSheetSurface(child: child),
        ),
      ),
    );
  }
}

class _BottomSheetSurface extends StatelessWidget {
  const _BottomSheetSurface({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO replace with DialogStyle
    return SafeArea(
      bottom: false,
      minimum: const EdgeInsets.only(top: 24),
      child: Dismissible(
        key: const Key('JoltBottomSheet'),
        direction: DismissDirection.down,
        onDismissed: (direction) => Navigator.of(context).pop(),
        child: Container(
          width: 450,
          // TODO remove margin on mobile
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
        ),
      ),
    );
  }
}
