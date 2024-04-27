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
    final scrollDirection = Scaffold.maybeOf(context)?.scrollDirection;
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
                icon: IconsFill.house.icon,
                color: Colors.transparent,
                size: Fonts.heading.fontSize,
              ),
              Button(
                onTap: () {},
                icon: Icon(
                  IconsDuotone.bell,
                  // color: Colors.background.as.foreground.withOpacity(0.9),
                ),
                color: Colors.transparent,
                size: Fonts.heading.fontSize,
              ),
              Button(
                onTap: () {},
                icon: Icon(
                  IconsDuotone.userCircle,
                  // color: Colors.background.as.foreground.withOpacity(0.9),
                ),
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
