import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/settings')
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Settings',
          style: Fonts.heading,
        ),
        const Gap.md(),
        Button(
          label: 'Switch to ${context.theme.isDark ? 'light' : 'dark'} mode'.text,
          onTap: () => ThemeProvider.of(context)?.toggleTheme(),
          icon: (context.theme.isDark ? IconsBold.sun : IconsBold.moon).icon,
        ),
      ],
    );
  }
}
