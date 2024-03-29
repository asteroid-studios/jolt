import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class ButtonPage extends StatelessWidget with ThemeValues {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Buttons',
      ),
      content: Text(
        'Buttons',
        style: text.heading,
      ),
    );
  }
}
