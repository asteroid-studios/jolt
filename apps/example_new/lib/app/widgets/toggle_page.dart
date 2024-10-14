import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: 'toggle')
class TogglePage extends StatelessWidget {
  const TogglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      topBar: const TempAppBar(title: 'Toggle'),
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
