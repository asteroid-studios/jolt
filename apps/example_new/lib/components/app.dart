import 'package:example_new/components/desktop_wrapper.dart';
import 'package:example_new/utils/router/router.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/ui.dart';

class App extends HookWidget with ThemeValues {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = useMemoized(
      () => AppRouter(navigatorKey: Jolt.instance.navigatorKey),
    );

    return ThemeProvider(
      child: HeroControllerScope(
        controller: HeroController(),
        child: WidgetsApp.router(
          color: color.primary,
          locale: const Locale('en'),
          localizationsDelegates: const [
            material.DefaultMaterialLocalizations.delegate,
            material.DefaultWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          builder: DesktopWrapper.builder,
          routerConfig: router.routerConfig,
        ),
      ),
    );
  }
}
