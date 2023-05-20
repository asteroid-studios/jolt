import 'dart:ui';

import 'package:flutter/services.dart';

import 'package:persistent_header_adaptive/adaptive_height_sliver_persistent_header.dart';

import 'package:jolt/jolt.dart';

///
class Scaffold extends StatefulWidget {
  ///
  const Scaffold({
    required this.title,
    required Widget this.content,
    this.sidebarLeft,
    this.sidebarRight,
    this.footer,
    super.key,
  });

  ///
  final String title;

  ///
  final Widget? content;

  ///
  final Widget? sidebarLeft;

  ///
  final Widget? sidebarRight;

  ///
  final Widget? footer;

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

    if (widget.content == null) return const SizedBox.shrink();

    // TODO what if the scaffold creates the whole scroll view?
    // It could get all the stuff from the shell
    // Dont love it because each page would have to build the shell
    // That being said, I can just do it for the top bar and footer
    // the navigation related ones can stay static
    // also has the bonus of being able to disable the shell per page

    return Title(
      title: widget.title,
      color: context.color.primary,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: context.color.brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: [
                // If both app bars are floating, group them
                AdaptiveHeightSliverPersistentHeader(
                  // pinned: true,
                  floating: true,
                  // Builder is important or theme changes don't get picked up
                  child: GestureDetector(
                    onTap: () {
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Builder(
                      builder: (context) {
                        return Hero(
                          tag: 'shellTopBar',
                          child: Column(
                            children: [
                              if (shell?.topBar != null) shell!.topBar!,
                              Surface(
                                borderColor: Colors.transparent,
                                borderRadius: BorderRadius.zero,
                                padding: EdgeInsets.all(context.sizing.lg),
                                background:
                                    context.color.surface.withOpacity(0.8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.title,
                                        style: context.style.headingSmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Expanded(child: widget.content!),
                      if (shell?.footer != null)
                        Hero(
                          tag: 'shellFooter',
                          child: shell!.footer!,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (Platform.isMobile &&
                context.mediaQuery.orientation == Orientation.portrait)
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      color: context.color.background.withOpacity(
                        context.color.isDark ? 0.7 : 0.3,
                      ),
                      height: context.mediaQuery.padding.top,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
