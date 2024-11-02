import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: 'formss')
class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      topBar: const TempAppBar(title: 'Form'),
      builder: (context) => ScrollArea.fill(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Toggle(
              onChanged: (_) {},
              icon: Icons.acorn.icon,
            ),
          ],
        ),
      ),
    );
  }
}
