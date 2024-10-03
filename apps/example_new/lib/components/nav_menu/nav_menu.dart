// import 'package:example_new/components/nav_menu/menu_items.dart';
// import 'package:example_new/utils/router/router.dart';
// import 'package:ui/ui.dart';

// class NavMenu extends StatelessWidget {
//   const NavMenu({
//     required this.isOpen,
//     required this.router,
//     required this.onNavigation,
//     super.key,
//   });

//   final bool isOpen;

//   static double get width => 280;

//   static bool get forceOpen => false.responsive(tabletLandscape: true);

//   final AppRouter router;

//   final void Function() onNavigation;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.background,
//         border: isOpen || forceOpen
//             ? Border(
//                 right: BorderSide(color: Colors.outline),
//               )
//             : null,
//       ),
//       child: AnimatedSize(
//         // https://github.com/flutter/flutter/issues/71227
//         duration: Duration(milliseconds: forceOpen ? 30 : 200),
//         child: SizedBox(
//           width: isOpen || forceOpen ? width : 0,
//           child: Opacity(
//             opacity: isOpen || forceOpen ? 1 : 0,
//             child: Padding(
//               padding: EdgeInsets.all(Spacing.md),
//               child: ListenableBuilder(
//                 listenable: router,
//                 builder: (context, child) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Gap(context.mediaQuery.padding.top),
//                       ...menuItems.map(
//                         (item) {
//                           final isActive =
//                               router.current.name == item.route.routeName;
//                           return NavigationItem(
//                             collapsed: !item.expanded,
//                             active: isActive,
//                             onTap: () {
//                               if (!isActive) {
//                                 router.navigate(item.route);
//                               }
//                               if (item.submenuItems.isEmpty || isActive) {
//                                 onNavigation();
//                               }
//                             },
//                             label: item.label.text,
//                             children: item.submenuItems.isNotEmpty
//                                 ? item.submenuItems.map(
//                                     (sub) {
//                                       final isActive = router.current.name ==
//                                           sub.route.routeName;
//                                       return NavigationItem(
//                                         onTap: () {
//                                           if (!isActive) {
//                                             router.navigate(sub.route);
//                                           }
//                                           onNavigation();
//                                         },
//                                         active: isActive,
//                                         label: sub.label.text,
//                                       );
//                                     },
//                                   ).toList()
//                                 : [],
//                           );
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
