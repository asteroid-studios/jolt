import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/settingss')
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView();
    return Scaffold(
      topBar: TempAppBar(title: 'Settings', showBack: false),
      builder: (context) => ScrollArea.fill(
        child: Center(
          child: Button(
            label: 'Switch to ${context.theme.isDark ? 'light' : 'dark'} mode'.text,
            onTap: () => ThemeProvider.of(context)?.toggleTheme(),
            icon: (context.theme.isDark ? IconsBold.sun : IconsBold.moon).icon,
          ),
        ),
      ),
    );
  }
}
