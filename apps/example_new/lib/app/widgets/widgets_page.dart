import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class WidgetsPage extends StatelessWidget with ThemeValues {
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sidebarRight: Container(
      //   color: color.surface,
      //   width: 50,
      // ),
      content: ScrollArea(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AppBar(
            title: 'Widgets',
            actions: [
              Button(
                icon: IconsDuotone.cpu,
                onTap: () {
                  ThemeProvider.of(context)?.toggleTheme();
                },
              ),
              const Gap.xs(),
              Button(
                icon: IconsDuotone.copy,
                onTap: () {
                  ThemeProvider.of(context)?.toggleTheme();
                },
              ),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  context.router.navigate(const ButtonRoute());
                },
                child: Text(
                  'Widgets',
                  style: text.heading.colored(color.background.as.foreground),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return AnimatedContainer(
    //   duration: const Duration(milliseconds: 200),
    //   color: color.background,
    //   child: Center(
    //     child: GestureDetector(
    //       onTap: () {
    //         context.router.back();
    //       },
    //       child: Text(
    //         'Back',
    //         style: text.display,
    //       ),
    //     ),
    //   ),
    // );
  }
}
