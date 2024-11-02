import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: 'input')
class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      topBar: const TempAppBar(title: 'Input'),
      builder: (context) => ScrollArea.fill(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Surface(
              width: 200,
              padding: EdgeInsets.all(12),
              child: Text(
                'Placeholder',
                style: Fonts.body.colored(Colors.surface.foregroundLight),
              ),
            ),
            // EditableText(),
          ],
        ),
      ),
    );
  }
}
