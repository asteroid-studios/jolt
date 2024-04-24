import 'package:flutter/rendering.dart';
import 'package:ui/ui.dart';

///
class NavigationBar extends StatelessWidget {
  ///
  const NavigationBar({
    this.floating = false,
    super.key,
  });

  ///
  final bool floating;

  @override
  Widget build(BuildContext context) {
    final scrollDirection = Scaffold.of(context).scrollDirection;
    final isScrolling = scrollDirection == ScrollDirection.reverse;

    return Collapsible(
      collapsed: isScrolling && floating,
      child: Blur(
        child: AnimatedContainer(
          duration: surfaceDuration,
          padding: EdgeInsets.only(
            bottom: context.mediaQuery.padding.bottom,
            left: Spacing.sm,
            right: Spacing.sm,
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.outline,
              ),
            ),
            color: Colors.background.withOpacity(0.9),
          ),
          child: Row(
            children: [
              // TODOdon't hard code these here
              Button(
                onTap: () {},
                icon: IconsDuotone.house.icon,
                color: Colors.transparent,
                size: Fonts.heading.fontSize,
              ),
              Button(
                onTap: () {},
                icon: IconsDuotone.bell.icon,
                color: Colors.transparent,
                size: Fonts.heading.fontSize,
              ),
              Button(
                onTap: () {},
                icon: IconsDuotone.userCircle.icon,
                color: Colors.transparent,
                size: Fonts.heading.fontSize,
              ),
            ].withExpanded(),
          ),
        ),
      ),
    );
  }
}
