import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class WidgetsPage extends StatelessWidget {
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
          // AppBar(
          //   title: 'Widgets',
          //   actions: [
          //     Button(
          //       color: Colors.transparent,
          //       icon: IconsDuotone.cpu.icon,
          //       onTap: () {
          //         ThemeProvider.of(context)?.toggleTheme();
          //       },
          //     ),
          //     const Gap.xs(),
          //     Button(
          //       color: Colors.transparent,
          //       icon: IconsDuotone.copy.icon,
          //       onTap: () {
          //         ThemeProvider.of(context)?.toggleTheme();
          //       },
          //     ),
          //   ],
          // ),
          Section(
            // background: Colors.rose,
            fillRemaining: true,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  context.router.navigate(const ButtonRoute());
                },
                child: Text(
                  'Widgets',
                  style: Fonts.heading.colored(Colors.background.as.foreground),
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
