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
          padding: EdgeInsets.all(context.spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacing.xs(),
              Column(
                children: [
                  ...navBarItems.mapIndexed(
                    (index, item) {
                      final tabsController =
                          autoTabsRouterKey.currentState?.controller;
                      final router = AppRouter.instance;
                      final currentName = router.currentSegments.last.name;
                      // TODO no tabsController on web so selected doesn't work
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
                          ...item.children.map<Widget>(
                            (i) => SideBarButton(
                              item: i,
                              selected: i.route.routeName == currentName,
                              topLevel: false,
                              index: index,
                              isOverlay: widget.isOverlay,
                            ),
                          ),
                        ].withSpacingSm(),
                      );
                    },
                  )
                ].withSpacingSm(),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Button(
                fullWidth: true,
                mainAxisAlignment: MainAxisAlignment.start,
                icon: Icons.code,
                label: 'Example Code',
                onPressed: () => launchUrl(
                  Uri.parse(
                    'https://github.com/asteroid-studios/jolt/tree/master/apps/example',
                  ),
                ),
              ),
              const Spacing.sm(),
              Button(
                fullWidth: true,
                mainAxisAlignment: MainAxisAlignment.start,
                icon: Icons.fileDoc,
                label: 'Docs',
                onPressed: () => launchUrl(
                  Uri.parse('https://flutterjolt.dev'),
                ),
              ),
              const Spacing.sm(),
              Button(
                fullWidth: true,
                mainAxisAlignment: MainAxisAlignment.start,
                icon: Icons.githubLogo,
                label: 'GitHub',
                onPressed: () => launchUrl(
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

  ///
  final bool topLevel;

  ///
  final bool isOverlay;

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.instance;
    final currentName = router.currentSegments.last.name;

    return Row(
      children: [
        if (!topLevel) const Spacing.lg(),
        Expanded(
          child: Button(
            background: selected
                ? context.color.primary
                : topLevel
                    ? context.color.surface
                    : context.color.primary.s200,
            mainAxisAlignment: MainAxisAlignment.start,
            requestFocusOnPress: false,
            fullWidth: true,
            icon: selected ? item.selectedIcon : item.icon,
            label: item.label,
            onPressed: () {
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
