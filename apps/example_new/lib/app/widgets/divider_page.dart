import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: 'dividers')
class DividerPage extends StatelessWidget {
  const DividerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      topBar: const TempAppBar(title: 'Divider'),
      builder: (context) => ScrollArea.fill(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Full width', style: Fonts.heading.sm),
            Divider(),
            Text('With text'),
            Text('Using indent'),
            Divider(endIndent: 32),
            Divider(startIndent: 32),
            Divider(
              startIndent: 32,
              endIndent: 32,
            ),
            Text('Veritcal divider'),
            Row(
              // Bug where didi
              children: [
                Button(),
                // Divider(),
                Button(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
