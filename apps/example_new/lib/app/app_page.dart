import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

// TODO this page will provide some information about jolt and links to docs, discord etc
@RoutePage()
class AppPage extends StatelessWidget with ThemeValues {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Jolt',
        // titleStyle: text.display.sm,
        actions: [
          GestureDetector(
            onTap: () {
              ThemeProvider.of(context)?.toggleTheme();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                // color: color.background,
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
                    color.isDark ? IconsDuotone.moon : IconsDuotone.sun,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      content: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                await context.router.push(const WidgetsRoute());
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(Spacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Platform.whenGroup('Hero', mobile: 'Hero iOS'),
                        style: Platform.whenGroup(
                          text.hero,
                          mobile: text.display,
                        ),
                      ),
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
        ],
      ),
    );
  }
}
