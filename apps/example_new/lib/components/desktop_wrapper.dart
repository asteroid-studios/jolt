import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:example_new/components/nav_menu/nav_menu.dart';
import 'package:example_new/utils/router/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/ui.dart';

class DesktopWrapper extends HookWidget {
  const DesktopWrapper({
    required this.child,
    required this.router,
    super.key,
  });

  // ignore: avoid_unused_constructor_parameters
  factory DesktopWrapper.builder(
    Widget? child,
    AppRouter router,
  ) {
    return DesktopWrapper(
      router: router,
      child: child ?? const SizedBox.shrink(),
    );
  }

  final Widget child;

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    final sidebarOpen = useState(false);

    final page = SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NavMenu(
            router: router,
            isOpen: sidebarOpen.value,
            onNavigation: () {
              if (sidebarOpen.value) sidebarOpen.value = false;
            },
          ),
          Stack(
            children: [
              SizedBox(
                width: context.mediaQuery.size.width - (NavMenu.forceOpen ? NavMenu.width : 0),
                child: ScrollStack(
                  // bottom: Container(
                  //   height: 80,
                  //   color: Colors.tailwind.amber,
                  // ),
                  bottom: const NavigationBar(floating: false),
                  top: Blur(
                    child: GestureDetector(
                      onTap: ScrollToTopNotifier.startScroll,
                      child: AnimatedContainer(
                        duration: surfaceDuration,
                        padding: EdgeInsets.only(
                          top: context.mediaQuery.viewPadding.top + Spacing.xs,
                          bottom: Spacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: context.color.background.withOpacity(0.9),
                          border: Border(
                            bottom: BorderSide(
                              color: context.color.outline,
                            ),
                          ),
                        ),
                        child: ListenableBuilder(
                          listenable: router,
                          builder: (context, _) {
                            final isHome = router.current.name == AppRoute.name;
                            return Row(
                              children: [
                                if (isHome) const Gap.sm() else const Gap.xxs(),
                                if (!NavMenu.forceOpen && isHome)
                                  Button(
                                    size: Fonts.heading.sm.fontSize,
                                    icon: sidebarOpen.value ? IconsBold.x.icon : IconsDuotone.sidebar.icon,
                                    color: Colors.transparent,
                                    onTap: () {
                                      sidebarOpen.value = !sidebarOpen.value;
                                    },
                                  )
                                else if (!isHome)
                                  Button(
                                    size: Fonts.heading.sm.fontSize,
                                    icon: IconsBold.caretLeft.icon,
                                    color: Colors.transparent,
                                    onTap: router.back,
                                  )
                                else
                                  const Gap.md(),
                                Expanded(
                                  child: Button(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    padding: Spacing.xxs,
                                    horizontalPadding: Spacing.sm,
                                    color: Colors.transparent,
                                    label: Text(
                                      router.title(context),
                                      style: Fonts.heading,
                                    ),
                                  ),
                                ),
                                Button(
                                  size: Fonts.heading.sm.fontSize,
                                  icon: IconsDuotone.gear.icon,
                                  color: Colors.transparent,
                                  onTap: () {
                                    ThemeProvider.of(context)?.setSystemTheme();
                                  },
                                ),
                                Button(
                                  size: Fonts.heading.sm.fontSize,
                                  icon: Colors.isDark ? IconsDuotone.moon.icon : IconsDuotone.sun.icon,
                                  color: Colors.transparent,
                                  onTap: () {
                                    ThemeProvider.of(context)?.toggleTheme();
                                  },
                                ),
                                const Gap.sm(),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  child: child,
                ),
              ),
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: Duration(
                    milliseconds: !(sidebarOpen.value && !NavMenu.forceOpen) ? 500 : 200,
                  ),
                  curve: Curves.easeIn,
                  opacity: sidebarOpen.value && !NavMenu.forceOpen ? 0.8 : 0,
                  child: IgnorePointer(
                    ignoring: !(sidebarOpen.value && !NavMenu.forceOpen),
                    child: GestureDetector(
                      onTap: () => sidebarOpen.value = false,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Platform.whenGroup(
      page,
      web: page,
      desktop: WindowBorder(
        color: Colors.primary,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              color: Colors.surface,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        'Jolt',
                        style: Fonts.body.colored(Colors.background.as.foreground),
                      ),
                    ),
                  ),
                  Positioned.fill(child: MoveWindow()),
                  Align(
                    alignment: Platform.when(
                      Alignment.centerRight,
                      windows: Alignment.centerRight,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ThemeProvider.of(context)?.toggleTheme();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: Colors.surface.weaken(),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          // TODOreplace with a dropdown with light dark and system
                          Colors.isDark ? IconsDuotone.moon : IconsDuotone.sun,
                          color: Colors.background.as.foreground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: page),
          ],
        ),
      ),
    );
  }
}
