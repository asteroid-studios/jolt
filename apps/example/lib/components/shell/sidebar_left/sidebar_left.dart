import 'package:collection/collection.dart';
import 'package:ui/ui.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:example/components/shell/nav_items/nav_items.dart';
import 'package:example/components/shell/shell.dart';
import 'package:example/utils/router/router.dart';

///
Future<void> showSideBar() async {
  await JoltOverlay.show(
    position: Alignment.centerLeft,
    child: const SideBarLeft(isOverlay: true),
  );
}

///
class SideBarLeft extends StatefulWidget {
  ///
  const SideBarLeft({
    this.isOverlay = false,
    super.key,
  });

  ///
  final bool isOverlay;

  @override
  State<SideBarLeft> createState() => _SideBarLeftState();
}

class _SideBarLeftState extends State<SideBarLeft> {
  late void Function() updateState;

  @override
  void initState() {
    updateState = () {
      if (mounted) {
        setState(() {});
      }
    };
    AppRouter.instance.addListener(updateState);
    super.initState();
  }

  @override
  void dispose() {
    AppRouter.instance.removeListener(updateState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: context.color.background,
        border: Border(right: BorderSide(color: context.color.surface)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.sizing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacing.xs(),
              Column(
                spacing: context.sizing.sm,
                children: navBarItems.mapIndexed((index, item) {
                  final tabsController =
                      autoTabsRouterKey.currentState?.controller;
                  final router = AppRouter.instance;
                  final currentName = router.currentSegments.last.name;
                  final currentIndex = tabsController?.activeIndex ?? 0;
                  final selected = currentIndex == index;
                  final button = SideBarButton(
                    item: item,
                    selected: selected,
                    topLevel: true,
                    index: index,
                    isOverlay: widget.isOverlay,
                  );
                  if (!selected) return button;
                  return Column(
                    children: [
                      button,
                      ...item.children.map(
                        (i) => SideBarButton(
                          item: i,
                          selected: i.route.routeName == currentName,
                          topLevel: false,
                          index: index,
                          isOverlay: widget.isOverlay,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Button(
                fullWidth: true,
                mainAxisAlignment: MainAxisAlignment.start,
                background: context.color.surface.withOpacity(0.2),
                color: context.color.surface.s500,
                icon: Icons.code,
                label: 'Example Code',
                onTap: () => launchUrl(
                  Uri.parse(
                    'https://github.com/asteroid-studios/jolt/tree/master/apps/example',
                  ),
                ),
              ),
              const Spacing.sm(),
              Button(
                fullWidth: true,
                mainAxisAlignment: MainAxisAlignment.start,
                background: context.color.surface.withOpacity(0.2),
                color: context.color.surface.s500,
                icon: Icons.fileDoc,
                label: 'Docs',
                onTap: () => launchUrl(
                  Uri.parse('https://flutterjolt.dev'),
                ),
              ),
              const Spacing.sm(),
              Button(
                fullWidth: true,
                mainAxisAlignment: MainAxisAlignment.start,
                background: context.color.surface.withOpacity(0.2),
                color: context.color.surface.s500,
                icon: Icons.githubLogo,
                label: 'GitHub',
                onTap: () => launchUrl(
                  Uri.parse('https://github.com/asteroid-studios/jolt'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///
class SideBarButton extends StatelessWidget {
  ///
  const SideBarButton({
    required this.item,
    required this.selected,
    required this.index,
    required this.isOverlay,
    required this.topLevel,
    super.key,
  });

  ///
  final NavItem item;

  ///
  final int index;

  ///
  final bool selected;

  final bool topLevel;

  ///
  final bool isOverlay;

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.instance;
    final currentName = router.currentSegments.last.name;
    final decorationColor = context.color.surface.s200;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!topLevel)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacing.sm(),
                Container(
                  width: 2,
                  height: 35,
                  color: decorationColor,
                ),
                Container(
                  height: 2,
                  width: 15,
                  color: decorationColor,
                ),
                const Spacing.sm(),
              ],
            ),
          ),
        Expanded(
          child: Button(
            background:
                (selected ? context.color.primary : context.color.surface)
                    .withOpacity(0.2),
            mainAxisAlignment: MainAxisAlignment.start,
            requestFocusOnPress: false,
            fullWidth: true,
            color: selected ? null : context.color.surface.s500,
            icon: selected ? item.selectedIcon : item.icon,
            label: item.label,
            onTap: () {
              if (!selected && !Platform.isWeb && topLevel) {
                autoTabsRouterKey.currentState?.controller
                    ?.setActiveIndex(index);
              } else if (item.route.routeName != currentName) {
                router.navigate(item.route);
              } else {
                // TODO scroll to top
                print('Scroll to top');
              }
              if (isOverlay) JoltOverlay.pop();
            },
          ),
        ),
      ],
    );
  }
}
