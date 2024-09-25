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
          duration: Durations.themeChange,
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
            color: Colors.background.withOpacity(0.8),
          ),
          child: Row(
            children: [
              // TODOdon't hard code these here
              Button.ghost(
                icon: IconsFill.house.icon,
                size: Fonts.heading.fontSize,
                onTap: () {},
              ),
              Button.ghost(
                onTap: () {},
                icon: Icon(
                  IconsDuotone.bell,
                  // color: Colors.background.foreground.withOpacity(0.9),
                ),
                size: Fonts.heading.fontSize,
              ),
              Button.ghost(
                onTap: () {},
                icon: Icon(
                  IconsDuotone.userCircle,
                  // color: Colors.background.foreground.withOpacity(0.9),
                ),
                size: Fonts.heading.fontSize,
              ),
            ].withExpanded(),
          ),
        ),
      ),
    );
  }
}
