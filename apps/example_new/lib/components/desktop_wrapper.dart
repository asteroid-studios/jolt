import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/ui.dart';

class DesktopWrapper extends HookWidget with ThemeValues {
  const DesktopWrapper({
    required this.child,
    super.key,
  });

  // ignore: avoid_unused_constructor_parameters
  factory DesktopWrapper.builder(BuildContext context, Widget? child) {
    return DesktopWrapper(
      child: child ?? const SizedBox.shrink(),
    );
  }

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const sidebarWidth = 300.0;
    final forceOpen = false.responsive(tabletLandscape: true);
    final sidebarOpen = useState(false);

    final collapsedSubMenu = useState(true);

    final page = SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.background,
              border: Border(
                right: BorderSide(color: color.outline),
              ),
            ),
            child: AnimatedSize(
              duration: Duration(milliseconds: forceOpen ? 0 : 200),
              child: SizedBox(
                width: sidebarOpen.value || forceOpen ? sidebarWidth : 0,
                child: Padding(
                  padding: EdgeInsets.all(Spacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(context.mediaQuery.padding.top),
                      Column(
                        children: [
                          Button(
                            onTap: () => collapsedSubMenu.value =
                                !collapsedSubMenu.value,
                            label: 'Widgets',
                            color: collapsedSubMenu.value
                                ? color.background
                                : color.primary
                                    .withOpacity(0.1)
                                    .dark(color.primary.withOpacity(0.2)),
                            labelStyle: text.body.sm.copyWith(
                              color: !collapsedSubMenu.value
                                  ? color.primary
                                  : null,
                            ),
                            horizontalPadding: Spacing.sm,
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                          const Gap.xs(),
                          Collapsible(
                              animationDuration:
                                  const Duration(milliseconds: 200),
                              collapsed: collapsedSubMenu.value,
                              child: Container(
                                padding: EdgeInsets.only(left: Spacing.md),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: color.outline,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Button(
                                      label: 'Surface',
                                      labelStyle: text.body.sm,
                                      color: color.primary
                                          .withOpacity(0.1)
                                          .dark(color.primary.withOpacity(0.2)),
                                      horizontalPadding: Spacing.sm,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                    Button(
                                      label: 'Button',
                                      labelStyle: text.body.sm,
                                      horizontalPadding: Spacing.sm,
                                      color: color.background,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              SizedBox(
                width: context.mediaQuery.size.width -
                    (forceOpen ? sidebarWidth : 0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: context.mediaQuery.viewPadding.top + Spacing.sm,
                      ),
                      color: color.background,
                      child: Row(
                        children: [
                          const Gap.lg(),
                          if (!forceOpen)
                            Button(
                              icon: sidebarOpen.value ? Icons.x : Icons.sidebar,
                              onTap: () {
                                sidebarOpen.value = !sidebarOpen.value;
                              },
                            ),
                          if (!forceOpen) const Gap.md(),
                          Text('Jolt', style: text.heading),
                          const Gap.lg(),
                        ],
                      ),
                    ),
                    Expanded(child: child),
                  ],
                ),
              ),
              // if (sidebarOpen.value && !forceOpen)
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: sidebarOpen.value && !forceOpen ? 0.8 : 0,
                  child: IgnorePointer(
                    ignoring: !(sidebarOpen.value && !forceOpen),
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
        color: color.primary,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              color: color.surface,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        'Jolt',
                        style:
                            text.body.colored(color.background.as.foreground),
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
                          color: color.surface.weaken(),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          // TODOreplace with a dropdown with light dark and system
                          color.isDark ? IconsDuotone.moon : IconsDuotone.sun,
                          color: color.background.as.foreground,
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
