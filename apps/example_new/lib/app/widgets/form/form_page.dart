import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      content: ScrollArea(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AppBar(title: 'Forms'),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                'Forms',
                style: Fonts.heading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
