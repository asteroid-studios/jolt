import 'package:ui/ui.dart';

///
class Scrollbar extends StatelessWidget {
  ///
  const Scrollbar({required this.child, super.key});

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scrollPadding = ScrollPadding.of(context);
    return RawScrollbar(
      crossAxisMargin: Spacing.xs,
      padding: EdgeInsets.only(
        top: scrollPadding.start + Spacing.xs,
        bottom: scrollPadding.end + Spacing.xs,
      ),
      radius: const Radius.circular(10),
      thumbColor: Colors.background.foreground.withOpacity(0.3),
      trackColor: Colors.surface.withOpacity(0.1),
      trackBorderColor: Colors.transparent,
      thickness: 8,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: child,
      ),
    );
  }
}
