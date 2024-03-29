import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class WidgetsPage extends StatelessWidget with ThemeValues {
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Widgets',
        actions: [
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
          //       horizontal: Spacing.xs,
          //     ),
          //     child: Stack(
          //       alignment: Alignment.center,
          //       children: [
          //         const RotatedBox(quarterTurns: 1, child: Text('')),
          //         const Text(''),
          //         Icon(IconsDuotone.copy),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      content: GestureDetector(
        onTap: () {
          context.router.navigate(const ButtonRoute());
        },
        child: Text(
          'Widgets',
          style: text.heading.colored(color.background.as.foreground),
        ),
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
