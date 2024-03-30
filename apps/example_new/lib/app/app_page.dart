import 'package:example_new/utils/router/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/ui.dart';

// TODO this page will provide some information about jolt and links to docs, discord etc
@RoutePage()
class AppPage extends HookWidget with ThemeValues {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {}, []);

    return Scaffold(
      bottomBar: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          bottom: context.mediaQuery.viewPadding.bottom + 20,
          top: 20,
          left: 20,
          right: 20,
        ),
        color: color.primary.withOpacity(0.5),
        child: Text('Bottom menu', style: text.heading),
      ),
      content: ScrollArea(
        children: [
          AppBar(
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
                        color.isDark ? IconsDuotone.moon : IconsDuotone.sun,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          RefreshIndicator(
            onRefresh: () async {
              await Future<void>.delayed(const Duration(seconds: 2));
              print('REFRESHED');
            },
          ),
          GestureDetector(
            onTap: () async {
              await context.router.push(const WidgetsRoute());
            },
            child: Padding(
              padding: EdgeInsets.all(Spacing.lg),
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
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: text.label,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1000,
          ),
        ],
      ),
    );
  }
}
