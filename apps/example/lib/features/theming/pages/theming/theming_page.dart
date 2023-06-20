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
      content: Wrap(
        spacing: context.sizing.md,
        children: [
          Button(
            onTap: () => context.navigateTo(const BreakpointsRoute()),
            label: 'Breakpoints',
            icon: Icons.gridFour,
            verticalButton: true,
            padding: EdgeInsets.all(context.sizing.xl),
            labelStyle: context.style.displaySmall,
          ),
          Button(
            onTap: () => context.navigateTo(const TypographyRoute()),
            label: 'Typography',
            icon: Icons.textAUnderline,
            verticalButton: true,
            padding: EdgeInsets.all(context.sizing.xl),
            labelStyle: context.style.displaySmall,
          ),
        ],
      ),
    );
  }
}
