import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

// TODO this page will provide some information about jolt and links to docs, discord etc
@RoutePage()
class AppPage extends StatelessWidget with ThemeValues {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      color: color.background,
      child: Column(
        children: [
          Platform.whenGroup(
            Container(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
              color: color.surface,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Spacing.lg,
                  vertical: Spacing.sm,
                ),
                child: Row(
                  children: [
                    Expanded(child: Text('Jolt', style: text.heading)),
                    // GestureDetector(
                    //   onTap: () {
                    //     ThemeProvider.of(context)?.toggleTheme();
                    //   },
                    //   child: AnimatedContainer(
                    //     duration: const Duration(milliseconds: 200),
                    //     decoration: BoxDecoration(
                    //       color: color.surface.weaken(),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //       vertical: Spacing.xs,
                    //       horizontal: Spacing.md,
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         const Text('Theme'),
                    //         const Gap.xs(),
                    //         Icon(
                    //           // TODO replace with a dropdown with light dark and system
                    //           color.isDark
                    //               ? IconsDuotone.moon
                    //               : IconsDuotone.sun,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        ThemeProvider.of(context)?.toggleTheme();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: color.surface.weaken(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: Spacing.xs,
                          horizontal: Spacing.xs,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const RotatedBox(quarterTurns: 1, child: Text('')),
                            const Text(''),
                            Icon(
                              // TODO replace with a dropdown with light dark and system
                              color.isDark
                                  ? IconsDuotone.moon
                                  : IconsDuotone.sun,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            desktop: SizedBox(),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  // TODO try opening widgets route as a drawer!
                  final success =
                      await context.router.push<bool>(const WidgetsRoute()) ??
                          false;
                  print(success);
                  // context.router.navigateNamed('Test');
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(Spacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Big text',
                          style: text.display,
                        ),
                        Text(
                          'Heading',
                          style: text.heading,
                        ),
                        const Gap.sm(),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: text.body,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
