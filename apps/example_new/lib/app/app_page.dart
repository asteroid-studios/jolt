import 'package:collection/collection.dart';
import 'package:example_new/components/desktop_window_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/ui.dart';

// TODOthis page will provide some information about jolt and links to docs, discord etc

class AppPage extends StatelessWidget {
  const AppPage({
    required this.navigationShell,
    required this.children,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Surface(
      borderRadius: BorderRadius.zero,
      color: context.color.background,
      child: MediaQuery(
        data: context.mediaQuery.copyWith(
          textScaler: TextScaler.linear(Platform.isMobile ? 1.1 : 1),
        ),
        child: Column(
          children: [
            const DesktopWindowBar(),
            Expanded(
              child: ScrollStack(
                end: BottomMenu(navigationShell),
                child: AnimatedBranchContainer(
                  currentIndex: navigationShell.currentIndex,
                  children: children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    required this.currentIndex,
    required this.children,
    super.key,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.mapIndexed(
        (int index, Widget navigator) {
          return AnimatedOpacity(
            opacity: index == currentIndex ? 1 : 0,
            duration: const Duration(milliseconds: 100),
            child: _branchNavigatorWrapper(index, navigator),
          );
        },
      ).toList(),
    );
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
}

class BottomMenu extends StatelessWidget {
  const BottomMenu(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final branches = [
      (Icons.house.icon, IconsFill.house.icon),
      (Icons.paintRoller.icon, IconsFill.paintRoller.icon),
      (Icons.log.icon, IconsFill.log.icon),
      (Icons.userCircleDashed.icon, IconsFill.userCircleDashed.icon),
    ];
    return Surface(
      style: (context, _) => SurfaceStyle(
        blur: Theme.blurIntensity,
        color: context.color.background.withOpacity(0.9),
        borderRadius: BorderRadius.circular(0),
        border: [SurfaceBorder(top: SurfaceBorderSide(color: Colors.outline))],
      ),
      padding: EdgeInsets.only(
        left: Spacing.md,
        right: Spacing.md,
        bottom: context.mediaQuery.viewPadding.bottom,
      ),
      child: Row(
        children: branches
            .mapIndexed(
              (index, icon) {
                final selected = index == navigationShell.currentIndex;
                return Button.ghost(
                  expanded: true,
                  size: Fonts.heading.fontSize,
                  style: (context, button) => ButtonStyle(
                    splash: () => null,
                    surfaceStyle: SurfaceStyle(
                      foregroundOpacity: selected ? 1 : 0.5,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  icon: selected ? icon.$2 : icon.$1,
                  onTap: () => navigationShell.goBranch(index, initialLocation: selected),
                );
              },
            )
            .toList()
            .withExpanded(),
      ),
    );
  }
}


// class AppPage extends HookWidget {
//   const AppPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final spaces = useState(<String>[]);
//     final collapsed = useState(false);

//     // TODO make Jolt version
//     return mat.RefreshIndicator(
//       key: _refreshIndicatorKey,
//       backgroundColor: Colors.background,
//       color: Colors.primary,
//       triggerMode: mat.RefreshIndicatorTriggerMode.anywhere,
//       edgeOffset: ScrollPadding.of(context).start,
//       onRefresh: () async {
//         await Future<void>.delayed(const Duration(milliseconds: 2000));
//         if (context.mounted) {
//           spaces.value = [];
//         }
//       },
//       child: Scaffold(
//         // topBar: Container(
//         //   height: 70,
//         //   color: Colors.tailwind.amber,
//         // ),
//         // bottomBar: const NavigationBar(floating: false),
//         // bottomBar: SafeArea(
//         //   child: Container(
//         //     margin: EdgeInsets.symmetric(
//         //       horizontal: Spacing.lg,
//         //       vertical: Spacing.md,
//         //     ),
//         //     child: Row(
//         //       mainAxisAlignment: MainAxisAlignment.end,
//         //       children: [
//         //         Button.filled(
//         //           size: Fonts.body.lg.fontSize,
//         //           color: Colors.primary,
//         //           icon: Icons.plus.icon,
//         //         ),
//         //       ],
//         //     ),
//         //   ),
//         // ),
//         // bottomBar: NavigationBar(floating: true),
//         content: Scrollbar(
//           child: ScrollArea(
//             // TODO Fix because of https://linear.app/asteroid-studios/issue/AST-91/refresh-doesnt-work-on-android
//             // physics: AlwaysScrollableScrollPhysics(),
//             // scrollDirection: Axis.horizontal,
//             children: [
//               // AppBar(
//               //   title: 'Jolt',
//               //   titleStyle: Fonts.display.sm,
//               //   pinned: true,
//               //   // floating: true,
//               //   // floating: Platform.isMobile,
//               //   actions: [
//               //     // if (!Platform.isMobile) const Gap.xs(),
//               //     // if (!Platform.isMobile)
//               //     Button.filled(
//               //       selected: true,
//               //       icon: IconsDuotone.arrowClockwise.icon,
//               //       onTap: () {
//               //         _refreshIndicatorKey.currentState?.show();
//               //         // RefreshIndicator.triggerRefresh(context);
//               //       },
//               //     ),
//               //   ],
//               // ),

//               // RefreshIndicator(
//               //   onRefresh: () async {
//               //     await Future<void>.delayed(const Duration(milliseconds: 200));
//               //     if (context.mounted) {
//               //       spaces.value = [];
//               //     }
//               //   },
//               // ),
//               const Gap.sm(),
//               Section(
//                 child: GestureDetector(
//                   onTap: () {
//                     collapsed.value = !collapsed.value;
//                   },
//                   child: AnimatedContainer(
//                     duration: Durations.themeTransition,
//                     width: double.infinity,
//                     margin: EdgeInsets.only(top: Spacing.xs),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: Spacing.lg,
//                       vertical: Spacing.sm,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.surface,
//                       border: Border.all(color: Colors.surface),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           IconsDuotone.magnifyingGlass,
//                           color: Colors.surface.shade400.dark(Colors.surface.shade600),
//                         ),
//                         const Gap.sm(),
//                         const Expanded(child: Text('Search')),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const Gap.md(),
//               // Section(
//               //   fillMainAxis: true,
//               //   fillMainAxisFraction: 0.5,
//               //   child: Container(
//               //     color: Colors.rose,
//               //   ),
//               // ),
//               // const Gap.sm(),

//               ThemeProvider(
//                 theme: themes.last,
//                 builder: (context) {
//                   return Section(
//                     pinned: true,
//                     // floating: true,
//                     blur: 5,
//                     color: context.color.surface.withOpacity(.9),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: Spacing.sm),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Text('Pinned', style: Fonts.body.lg.bold),
//                           ),
//                           Button.ghost(
//                             onTap: () {
//                               Jolt.dialog.show<void>(
//                                 Drawer(
//                                   crossAxisSize: (context.mediaQuery.size.width - 50).responsive(tablet: 450),
//                                   title: 'Test',
//                                 ),
//                               );
//                             },
//                             icon: Icon(
//                               IconsBold.plus,
//                               color: Colors.primary.foreground,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Section(
//                 // pinned: true,
//                 floating: true,
//                 blur: 5,
//                 color: Colors.primary.withOpacity(.9),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: Spacing.sm),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           'Floating',
//                           style: Fonts.body.lg.bold.colored(
//                             Colors.primary.foreground,
//                           ),
//                         ),
//                       ),
//                       Button.ghost(
//                         onTap: () {
//                           Jolt.dialog.show<void>(
//                             Dialog<void>(
//                               title: 'Are you sure?'.text,
//                               content: 'You are about to delete the universe'.text,
//                             ),
//                           );
//                         },
//                         icon: Icon(
//                           IconsBold.plus,
//                           color: Colors.primary.foreground,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const Gap.sm(),
//               ScrollGroup(
//                 children: [
//                   const Gap.md(),
//                   Section(
//                     child: GestureDetector(
//                       onTap: () async {
//                         await context.router.push(const WidgetsRoute());
//                       },
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             context.breakpoint.runtimeType.toString(),
//                             style: Breakpoint.when(
//                               Fonts.heading,
//                               tabletLandscape: Fonts.hero,
//                             ),
//                           ),
//                           Text(
//                             'Big Text',
//                             style: Fonts.display,
//                           ),
//                           Text(
//                             'Heading',
//                             style: Fonts.heading,
//                           ),
//                           const Gap.md(),
//                           Row(
//                             children: [
//                               Button.filled(
//                                 color: Colors.primary,
//                                 // color: Colors.tailwind.green,
//                                 // label: 'Book'.text,
//                                 icon: const Icon(IconsBold.calendar),
//                                 onTap: () {},
//                               )
//                                   // TODO this doesn't work because the one inside Surface overrides it.
//                                   // Need to implement important again
//                                   // Also don't like the extension format
//                                   .foregroundLight,
//                               Button.filled(
//                                 color: Colors.secondary.shade100,
//                                 icon: const Icon(IconsBold.calendar),
//                                 onTap: () {},
//                               ),
//                               Button.filled(
//                                 color: Colors.tertiary,
//                                 icon: const Icon(IconsBold.calendar),
//                                 onTap: () {},
//                               ),
//                               Button.filled(
//                                 label: 'Disabled'.text,
//                               ),
//                               Button.outlined(
//                                 icon: const Icon(IconsBold.calendar),
//                                 label: 'Book'.text,
//                                 onTap: () {},
//                               ),
//                               Button.ghost(
//                                 icon: const Icon(IconsBold.calendar),
//                                 onTap: () {},
//                               ),
//                               Button.link(
//                                 // style: (context, button) => ButtonStyle(
//                                 //   labelStyle: TextStyle(fontSize: 40),
//                                 // ),
//                                 label: 'Link'.text,
//                                 onTap: () {},
//                               ),
//                             ].withSeparator(const Gap.sm()),
//                           ),
//                           const Gap.md(),
//                           Form(
//                             form: (json) => TestForm.fromJson(json),
//                             builder: (builder, form) {
//                               return Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Toggle(
//                                         type: ToggleType.ghost,
//                                         onChanged: (value) {},
//                                         icon: Icons.textAUnderline.icon,
//                                       ),
//                                       const Gap.sm(),
//                                       Toggle(
//                                         onChanged: (value) {},
//                                         icon: Icons.textAlignLeft.icon,
//                                       ),
//                                       const Gap.sm(),
//                                       Toggle(
//                                         type: ToggleType.outlined,
//                                         onChanged: (value) {},
//                                         // icon: Icons.textAa.icon,
//                                         label: 'Label'.text,
//                                       ),
//                                     ],
//                                   ),
//                                   const Gap.sm(),
//                                   Button(
//                                     label: 'Submit'.text,
//                                     onTap: () {
//                                       // final value = form.submit();
//                                       // print(value.email);
//                                       // print(TestForm.firstNameKey);
//                                     },
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                           const Gap.md(),
//                           Surface(
//                             height: 100,
//                             style: (context, surface) => SurfaceStyle(color: Colors.primary),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.hourglass),
//                                 'Time'.text,
//                               ],
//                             ),
//                           ),
//                           const Gap.md(),
//                           Container(
//                             clipBehavior: Clip.antiAlias,
//                             decoration: BoxDecoration(
//                               color: Colors.surface,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Collapsible(
//                               collapsedSize: 80,
//                               collapsed: collapsed.value,
//                               child: Builder(
//                                 builder: (context) {
//                                   return GestureDetector(
//                                     onTap: () {
//                                       collapsed.value = !collapsed.value;
//                                     },
//                                     child: AspectRatio(
//                                       aspectRatio: 16 / 10,
//                                       child: Image.network(
//                                         'https://images.unsplash.com/photo-1712315461416-bdaeba08ce20?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                           const Gap.md(),
//                           Text(
//                             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                             style: Fonts.body,
//                           ),
//                           const Gap.md(),
//                           Container(
//                             clipBehavior: Clip.antiAlias,
//                             decoration: BoxDecoration(
//                               color: Colors.surface,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Image.network(
//                               'https://images.unsplash.com/photo-1711619034500-8f562ce7bf4f?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//                             ),
//                           ),
//                           const Gap.md(),
//                           Text(
//                             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                             style: Fonts.label,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Gap.lg(),
//                 ],
//               ),
//               ScrollGroup(
//                 children: [
//                   SliverDynamicPersistentHeader(
//                     pinned: true,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: Spacing.lg,
//                         vertical: Spacing.md,
//                       ),
//                       color: Colors.tailwind.rose.shade400.dark(Colors.tailwind.rose.shade700),
//                       child: Text(
//                         'Title',
//                         style: Fonts.heading.colored(
//                           Colors.black.dark(Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   ...spaces.value.map(
//                     (s) => Column(
//                       children: [
//                         Container(
//                           height: 150,
//                           color: Colors.surface,
//                         ),
//                         Container(
//                           height: 4,
//                           color: Colors.background,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               LoadMoreIndicator(
//                 onLoadMore: spaces.value.length > 16
//                     ? null
//                     : () async {
//                         await Future<void>.delayed(
//                           const Duration(milliseconds: 500),
//                         );
//                         if (context.mounted) {
//                           spaces.value = [
//                             ...spaces.value,
//                             'Test1',
//                             'Test2',
//                             'Test3',
//                           ];
//                         }
//                       },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
