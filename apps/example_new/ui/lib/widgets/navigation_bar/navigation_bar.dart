import 'package:flutter/rendering.dart';
import 'package:ui/ui.dart';

///
class NavigationBar extends StatelessWidget with ThemeValues {
  ///
  const NavigationBar({
    this.floating = false,
    super.key,
  });

  ///
  final bool floating;

  @override
  Widget build(BuildContext context) {
    final navBar = Blur(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          bottom: context.mediaQuery.padding.bottom + 20,
          top: 20,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: color.outline,
            ),
          ),
          color: color.background.withOpacity(0.9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(IconsDuotone.house, size: text.heading.fontSize),
            Icon(IconsDuotone.bell, size: text.heading.fontSize),
            Icon(IconsDuotone.userCircle, size: text.heading.fontSize),
          ],
        ),
      ),
    );

    if (floating) {
      final scrollDirection = Scaffold.of(context).scrollDirection;
      final hideNavBar = scrollDirection == ScrollDirection.reverse;

      return AbsorbPointer(
        absorbing: hideNavBar,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: hideNavBar ? 0 : 1,
          child: navBar,
        ),
      );
    }

    return navBar;
  }
}
