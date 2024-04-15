import 'package:ui/ui.dart';

///
class Section extends StatelessWidget {
  ///
  const Section({
    required this.child,
    this.pinned = false,
    this.background,
    super.key,
  });

  ///
  final bool pinned;

  ///
  final Widget child;

  ///
  final Color? background;

  @override
  Widget build(BuildContext context) {
    if (!pinned) return child;

    return SliverDynamicPersistentHeader(
      pinned: true,
      child: child,
    );
  }
}
