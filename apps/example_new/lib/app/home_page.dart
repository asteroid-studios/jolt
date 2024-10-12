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
    return Scaffold(
      topBar: const TempAppBar(title: 'Widgets', showBack: false),
      builder: (context) {
        return ScrollArea.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
        );
      },
    );
  }
}
