import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      content: ScrollArea(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                'Buttons',
                style: Fonts.heading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
