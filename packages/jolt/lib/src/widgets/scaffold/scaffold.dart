import 'package:persistent_header_adaptive/adaptive_height_sliver_persistent_header.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:jolt/jolt.dart';

///
class Scaffold extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final shell = Shell.of(context);

    if (content == null) return const SizedBox.shrink();

    // TODO what if the scaffold creates the whole scroll view?
    // It could get all the stuff from the shell
    // Dont love it because each page would have to build the shell
    // That being said, I can just do it for the top bar and footer
    // the navigation related ones can stay static
    // also has the bonus of being able to disable the shell per page

    return Title(
      title: title,
      color: context.color.primary,
      child: SelectionArea(
        child: CustomScrollView(
          slivers: [
            // If both app bars are floating, group them
            AdaptiveHeightSliverPersistentHeader(
              floating: true,

              /// Builder is important or theme changes don't get picked up
              child: Builder(
                builder: (context) {
                  return Hero(
                    tag: 'shellTopBar',
                    child: Column(
                      children: [
                        if (shell.topBar != null) shell.topBar!,
                        Surface(
                          borderColor: Colors.transparent,
                          borderRadius: BorderRadius.zero,
                          padding: EdgeInsets.all(context.sizing.lg),
                          background: context.color.surface.withOpacity(0.4),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title,
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
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(child: content!),
                  if (shell.footer != null)
                    Hero(
                      tag: 'shellFooter',
                      child: shell.footer!,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}