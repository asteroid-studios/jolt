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
    final scrollDirection = Scaffold.of(context).scrollDirection;
    final isScrolling = scrollDirection == ScrollDirection.reverse;

    return Collapsible(
      collapsed: isScrolling && floating,
      child: Container(
        padding: EdgeInsets.only(
          bottom: context.mediaQuery.padding.bottom,
          left: Spacing.sm,
          right: Spacing.sm,
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
          children: [
            // TODO don't hard code these here
            Button(
              onTap: () {},
              icon: IconsDuotone.house,
              color: Colors.transparent,
              labelStyle: text.heading,
            ),
            Button(
              onTap: () {},
              icon: IconsDuotone.bell,
              color: Colors.transparent,
              labelStyle: text.heading,
            ),
            Button(
              onTap: () {},
              icon: IconsDuotone.userCircle,
              color: Colors.transparent,
              labelStyle: text.heading,
            ),
          ].withExpanded(),
        ),
      ).withBlur(),
    );
  }
}
