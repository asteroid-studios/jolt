import 'package:ui/ui.dart';

///
class ScrollBar extends StatelessWidget {
  ///
  const ScrollBar({required this.child, super.key});

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      crossAxisMargin: Spacing.xxs,
      radius: Radius.circular(24),
      child: child,
    );
  }
}

///
extension ScrollBarX on ScrollArea {
  ///
  Widget withScrollBar() => ScrollBar(child: this);
}
