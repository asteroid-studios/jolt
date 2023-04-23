import 'package:persistent_header_adaptive/adaptive_height_sliver_persistent_header.dart';

import 'package:jolt/jolt.dart';

///
class Shell extends StatelessWidget {
  ///
  const Shell({
    required this.child,
    this.topBar,
    this.sidebarLeft,
    this.sidebarRight,
    this.footer,
    this.topBarOptions = const TopBarOptions(),
    this.footerOptions = const FooterOptions(),
    super.key,
  });

  ///
  final Widget child;

  ///
  final Widget? topBar;

  ///
  final Widget? sidebarLeft;

  ///
  final Widget? sidebarRight;

  ///
  final Widget? footer;

  ///
  final TopBarOptions topBarOptions;

  ///
  final FooterOptions footerOptions;

  @override
  Widget build(BuildContext context) {
    final mobile = context.mediaQuery.size.width < 600;

    // TODO proper breakpoints
    // TODO safe area

    final inside = Row(
      children: [
        if (sidebarLeft != null) sidebarLeft!,
        Expanded(
          child: Column(
            children: [
              if (topBar != null && !topBarOptions.topBarFullWidth && !mobile)
                topBar!,
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    if (topBar != null && mobile)
                      AdaptiveHeightSliverPersistentHeader(
                        floating: true,
                        child: topBar!,
                      ),
                    SliverFillRemaining(
                      // hasScrollBody: false,
                      child: child,
                    ),
                    // if (footer != null && !footerOptions.pinned) footer!,
                    // SliverFillRemaining(
                    //   // hasScrollBody: false,
                    //   child: Column(
                    //     children: [
                    //       Expanded(child: child),
                    //       if (footer != null && !footerOptions.pinned) footer!,
                    //     ],
                    //   ),
                    // ),
                    // if (footer != null && footerOptions.pinned)
                    // AdaptiveHeightSliverPersistentHeader(
                    if (footer != null)
                      SliverToBoxAdapter(
                        child: footer!,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (sidebarRight != null) sidebarRight!,
      ],
    );

    return Column(
      children: [
        if (topBar != null && topBarOptions.topBarFullWidth && !mobile) topBar!,
        Expanded(child: inside),
      ],
    );
  }
}

///
class TopBarOptions {
  ///
  const TopBarOptions({
    this.topBarFullWidth = true,
  });

  ///
  final bool topBarFullWidth;
}

///
class FooterOptions {
  ///
  const FooterOptions({
    this.pinned = false,
  });

  ///
  final bool pinned;
}
