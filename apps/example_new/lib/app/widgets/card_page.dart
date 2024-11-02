import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: 'cards')
class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      topBar: const TempAppBar(title: 'Card'),
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
