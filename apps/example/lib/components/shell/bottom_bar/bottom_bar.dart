import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:ui/ui.dart';

import 'package:example/components/shell/nav_items/nav_items.dart';
import 'package:example/utils/router/router.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(
    this.tabsRouter, {
    super.key,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    final currentTab = tabsRouter.currentSegments.first;
    final currentRoute = tabsRouter.currentSegments.last;
    final showBottomNav =
        currentRoute.meta[RouteMeta.showBottomNav] as bool? ?? true;

    if (!showBottomNav) {
      return const SizedBox.shrink();
    }

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: context.color.background.withOpacity(0.85),
            border: Border(
              top: BorderSide(
                color: context.color.surface.withOpacity(0.3),
              ),
            ),
          ),
          child: Row(
            children: navBarItems.mapIndexed((index, item) {
              final selected = tabsRouter.activeIndex == index;
              return Expanded(
                child: Button(
                  fullWidth: true,
                  padding: EdgeInsets.only(
                    top: context.sizing.md,
                    left: context.sizing.md,
                    right: context.sizing.md,
                    bottom: max(
                      context.sizing.md,
                      context.mediaQuery.viewPadding.bottom,
                    ),
                  ),
                  background: Colors.transparent,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.zero,
                  requestFocusOnPress: false,
                  color: (context.color.isDark
                          ? context.color.primary.s300
                          : context.color.primary.s950)
                      .withOpacity(selected ? 1.0 : 0.7),
                  icon: selected ? item.selectedIcon : item.icon,
                  iconSize: 20,
                  // label: item.label,
                  // labelStyle: context.style.labelSmall,
                  // verticalButton: true,
                  onTap: () {
                    if (selected) {
                      if (currentTab.path ==
                          tabsRouter.currentPath.replaceAll('/', '')) {
                        print('scroll to top');
                      } else {
                        context.navigateTo(item.route);
                      }
                    } else {
                      tabsRouter.setActiveIndex(index);
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
