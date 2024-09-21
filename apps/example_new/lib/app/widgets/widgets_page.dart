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
      content: Center(
        child: GestureDetector(
          onTap: () {
            context.router.navigate(const ButtonRoute());
          },
          child: Text(
            'Widgets',
            style: Fonts.heading.colored(Colors.background.foreground),
          ),
        ),
      ),
    );
  }
}
