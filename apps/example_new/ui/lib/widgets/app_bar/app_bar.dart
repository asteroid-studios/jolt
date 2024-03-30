import 'package:ui/ui.dart';

///
class AppBar extends StatelessWidget with ThemeValues {
  ///
  const AppBar({
    this.title,
    this.titleStyle,
    this.actions = const [],
    super.key,
  });

  ///
  final String? title;

  ///
  final TextStyle? titleStyle;

  ///
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final showBack = !(ModalRoute.of(context)?.isFirst ?? false);

    // TODO the ability to pin or float should be set here
    // TODO when not at the top, the hero animations should not be used, becuase it looks weird
    // What if I just make the tag for each hero include the y position, that way that will only animate when matching!

    return SliverDynamicPersistentHeader(
      scrollBehavior: SliverHeaderBehavior.pinned,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + Spacing.sm,
          left: Spacing.lg,
          right: Spacing.lg,
          bottom: Spacing.sm,
        ),
        color: color.surface,
        child: Row(
          children: [
            Hero(
              tag: 'AppBarBack',
              flightShuttleBuilder: showBack ? null : flightShuttleFadeBuilder,
              transitionOnUserGestures: true,
              child: SizedBox(
                height: 40,
                child: showBack
                    ? GestureDetector(
                        onTap: () => Navigator.of(context).maybePop(),
                        child: Icon(
                          IconsBold.caretLeft,
                          size: text.heading.sm.fontSize,
                        ),
                      )
                    : null,
              ),
            ),
            if (showBack) const Gap.sm(),
            if (title != null)
              Expanded(
                child: Hero(
                  tag: 'AppBarTitle',
                  child: Text(
                    title!,
                    style: titleStyle ?? text.heading,
                  ),
                ),
              ),
            Hero(
              tag: 'AppBarActions',
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  // TODO come up with a better way to handle jumping when icon vs no icon
                  constraints: const BoxConstraints(minHeight: 40),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions,
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
