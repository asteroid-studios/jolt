import 'package:persistent_header_adaptive/adaptive_height_sliver_persistent_header.dart';

import 'package:jolt/jolt.dart';

///
class Scaffold extends StatefulWidget {
  ///
  const Scaffold({
    required this.content,
    this.windowTitle,
    this.sidebarLeft,
    this.sidebarRight,
    this.bottomBar,
    super.key,
  });

  /// Set the window title
  ///
  /// For example: On Web, this will be the tab title.
  final String? windowTitle;

  /// Provide a list of widgets to be displayed in the main content area.
  ///
  /// It is recommended to use **Section** widgets to help with layout.
  final List<Widget> content;

  /// Provide a widget to be displayed on the left side of the page.
  final Widget? sidebarLeft;

  /// Provide a widget to be displayed on the right side of the page.
  final Widget? sidebarRight;

  /// Provide a widget to be displayed at the bottom of the page.
  final Widget? bottomBar;

  @override
  State<Scaffold> createState() => _ScaffoldState();
}

class _ScaffoldState extends State<Scaffold> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shell = Shell.of(context);

    // TODO what if the scaffold creates the whole scroll view?
    // It could get all the stuff from the shell
    // Dont love it because each page would have to build the shell
    // That being said, I can just do it for the top bar and footer
    // the navigation related ones can stay static
    // also has the bonus of being able to disable the shell per page

    return Stack(
      children: [
        JoltScrollView(
          controller: scrollController,
          slivers: [
            // ...widget.content.map((c) => null),
            // If both app bars are floating, group them
            // TODO issue where the bar is rebuilt after the rest of the page, so there is a gap when using alternative scaling
            // TO test, set spacing to non medium and reload the app
            // AdaptiveHeightSliverPersistentHeader(
            //   // pinned: true,
            //   floating: true,
            //   // Builder is important or theme changes don't get picked up
            //   child: GestureDetector(
            //     onTap: () {
            //       scrollController.animateTo(
            //         0,
            //         duration: const Duration(milliseconds: 500),
            //         curve: Curves.easeInOut,
            //       );
            //     },
            //     child: Builder(
            //       builder: (context) {
            //         return Hero(
            //           tag: 'shellTopBar',
            //           child: Column(
            //             children: [
            //               if (shell?.topBar != null) shell!.topBar!,
            //               Surface(
            //                 borderColor: Colors.transparent,
            //                 borderRadius: BorderRadius.zero,
            //                 padding: EdgeInsets.only(
            //                   left: context.spacing.lg,
            //                   right: context.spacing.lg,
            //                   bottom: context.spacing.lg,
            //                   top: context.spacing.lg +
            //                       context.mediaQuery.viewPadding.top,
            //                 ),
            //                 background: context.color.surface.withOpacity(0.8),
            //                 child: Row(
            //                   children: [
            //                     Expanded(
            //                       child: Text(
            //                         'Test',
            //                         // widget.title,
            //                         style: context.style.headingSmall,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            ...widget.content,
            // TODO bottom spacing needs to account for the bottom bar or footer
            // SliverFillRemaining(
            //   hasScrollBody: false,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(child: widget.content!),
            //       if (shell?.footer != null)
            //         Hero(
            //           tag: 'shellFooter',
            //           child: shell!.footer!,
            //         ),
            //       SizedBox(
            //         height: shell?.bottomBarHeight ??
            //             context.mediaQuery.viewPadding.bottom,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
        // if (Platform.isMobile &&
        //     context.mediaQuery.orientation == Orientation.portrait)
        //   Align(
        //     alignment: Alignment.topCenter,
        //     child: ClipRect(
        //       child: BackdropFilter(
        //         filter: ImageFilter.blur(
        //           sigmaX: 5,
        //           sigmaY: 5,
        //         ),
        //         child: GestureDetector(
        //           onTap: () {
        //             scrollController.animateTo(
        //               0,
        //               duration: const Duration(milliseconds: 500),
        //               curve: Curves.easeInOut,
        //             );
        //           },
        //           child: Container(
        //             color: context.color.background.withOpacity(
        //               context.color.isDark ? 0.7 : 0.3,
        //             ),
        //             height: context.mediaQuery.padding.top,
        //             width: double.infinity,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
      ],
    ).setSelectionArea().setAnnotatedRegion().setTitle(widget.windowTitle);
  }
}
