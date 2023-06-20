import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

///
@RoutePage()
class ThemingPage extends StatelessWidget {
  ///
  const ThemingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      title: 'Theming',
      content: Column(
        children: [
          Button(
            onTap: () => context.navigateTo(const TypographyRoute()),
            label: 'Typography',
            icon: Icons.textAUnderline,
          ),
        ],
      ),
    );
  }
}
