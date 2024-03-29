import 'package:auto_route/auto_route.dart';
import 'package:ui/ui.dart';

@RoutePage<bool>()
class WidgetsPage extends StatelessWidget with ThemeValues {
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.maybePop(true);
      },
      child: Text(
        'Widgets',
        style: text.heading.colored(color.background.as.foreground),
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
