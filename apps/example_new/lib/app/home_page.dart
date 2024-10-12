import 'package:example_new/app/widgets/buttons_page.dart';
import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/')
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScrollStack(
      start: Container(
        height: 100,
        color: Colors.tailwind.sky.withOpacity(0.3),
      ),
      child: ScrollStack(
        start: Row(
          children: [
            // Button(color: Colors.primary),
            Expanded(
              child: Container(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                ),
              ),
            ),
          ],
        ),
        end: Row(
          children: [
            Button(
              label: 'Test'.text,
              icon: Icons.acorn.icon,
              onTap: () {},
            ),
            Button(
              label: 'Test'.text,
              icon: Icons.acorn.icon,
              onTap: () {},
            ),
          ],
        ),
        child: ScrollArea(
          children: [
            Container(height: 1500, color: Colors.tailwind.emerald),
            Container(
              color: Colors.tailwind.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Widgets',
                    style: Fonts.heading,
                  ),
                  Button(
                    label: 'Buttons'.text,
                    onTap: () => ButtonsPage.go(context),
                  ),
                  Button(
                    label: 'Forms'.text,
                    onTap: () => ButtonsPage.go(context),
                  ),
                  Button(
                    label: 'Toggles'.text,
                    onTap: () => ButtonsPage.go(context),
                  ),
                ].withSeparator(const Gap.sm()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
