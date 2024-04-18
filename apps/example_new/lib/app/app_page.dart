import 'package:example_new/utils/router/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/ui.dart';

// TODOthis page will provide some information about jolt and links to docs, discord etc
@RoutePage()
class AppPage extends HookWidget with ThemeValues {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final spaces = useState(<String>[]);
    final collapsed = useState(true);

    return Scaffold(
      bottomBar: const NavigationBar(floating: true),
      // bottomBar: NavigationBar(floating: Platform.isMobile),
      content: ScrollArea(
        // scrollDirection: Axis.horizontal,
        children: [
          AppBar(
            title: 'Jolt',
            titleStyle: text.display.sm,
            pinned: true,
            // floating: true,
            // floating: Platform.isMobile,
            bottom: GestureDetector(
              onTap: () {
                collapsed.value = !collapsed.value;
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: Spacing.xs),
                padding: EdgeInsets.symmetric(
                  horizontal: Spacing.lg,
                  vertical: Spacing.sm,
                ),
                decoration: BoxDecoration(
                  color: color.surface,
                  border: Border.all(color: color.surface),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      IconsDuotone.magnifyingGlass,
                      color:
                          color.surface.shade400.dark(color.surface.shade600),
                    ),
                    const Gap.sm(),
                    const Expanded(child: Text('Search')),
                  ],
                ),
              ),
            ),
            actions: [
              Button(
                icon: color.isDark ? IconsDuotone.moon : IconsDuotone.sun,
                onTap: () {
                  ThemeProvider.of(context)?.toggleTheme();
                },
              ),
              if (!Platform.isMobile) const Gap.xs(),
              if (!Platform.isMobile)
                Button(
                  selected: true,
                  icon: IconsDuotone.arrowClockwise,
                  onTap: () => RefreshIndicator.triggerRefresh(context),
                ),
            ],
          ),
          // Section(
          //   fillMainAxis: true,
          //   fillMainAxisFraction: 0.5,
          //   child: Container(
          //     color: Colors.rose,
          //   ),
          // ),
          // const Gap.sm(),
          RefreshIndicator(
            onRefresh: () async {
              await Future<void>.delayed(const Duration(milliseconds: 200));
              spaces.value = [];
            },
          ),
          // const Gap.sm(),
          ScrollGroup(
            children: [
              Section(
                pinned: true,
                blur: 5,
                background: Colors.amber.shade400
                    .dark(Colors.amber.shade700)
                    .withOpacity(0.9),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: Spacing.md),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Title',
                          style: text.heading.colored(
                            Colors.black.dark(Colors.white),
                          ),
                        ),
                      ),
                      const Button(
                        label: 'Test',
                      ),
                    ],
                  ),
                ),
              ),
              const Gap.md(),
              GestureDetector(
                onTap: () async {
                  await context.router.push(const WidgetsRoute());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.breakpoint.runtimeType.toString(),
                        style: Breakpoint.when(
                          text.heading,
                          tabletLandscape: text.hero,
                        ),
                      ),
                      Text(
                        'Big Text',
                        style: text.display,
                      ),
                      Text(
                        'Heading',
                        style: text.heading,
                      ),
                      const Gap.md(),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: color.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Collapsible(
                          collapsedSize: 80,
                          collapsed: collapsed.value,
                          alignment: Alignment.center,
                          child: Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  collapsed.value = !collapsed.value;
                                },
                                child: AspectRatio(
                                  aspectRatio: 16 / 10,
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1712315461416-bdaeba08ce20?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Gap.md(),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: text.body,
                      ),
                      const Gap.md(),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: color.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1711619034500-8f562ce7bf4f?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                      const Gap.md(),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: text.label,
                      ),
                    ],
                  ),
                ),
              ),
              const Gap.lg(),
            ],
          ),
          ScrollGroup(
            children: [
              SliverDynamicPersistentHeader(
                pinned: true,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Spacing.lg,
                    vertical: Spacing.md,
                  ),
                  color: Colors.rose.shade400.dark(Colors.rose.shade700),
                  child: Text(
                    'Title',
                    style: text.heading.colored(
                      Colors.black.dark(Colors.white),
                    ),
                  ),
                ),
              ),
              ...spaces.value.map(
                (s) => Column(
                  children: [
                    Container(
                      height: 150,
                      color: color.surface,
                    ),
                    Container(
                      height: 4,
                      color: color.background,
                    ),
                  ],
                ),
              ),
            ],
          ),
          LoadMoreIndicator(
            onLoadMore: spaces.value.length > 16
                ? null
                : () async {
                    await Future<void>.delayed(
                      const Duration(milliseconds: 500),
                    );
                    spaces.value = [
                      ...spaces.value,
                      'Test1',
                      'Test2',
                      'Test3',
                    ];
                  },
          ),
        ],
      ).withScrollBar(),
    );
  }
}
