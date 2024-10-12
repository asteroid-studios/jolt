import 'package:example_new/utils/router/router.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/ui.dart';

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      builder: (context) => HeroControllerScope(
        controller: HeroController(),
        child: WidgetsApp.router(
          color: Colors.primary,
          locale: const Locale('en'),
          localizationsDelegates: const [
            material.DefaultMaterialLocalizations.delegate,
            material.DefaultWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
