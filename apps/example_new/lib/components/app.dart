import 'package:example_new/components/desktop_wrapper.dart';
import 'package:example_new/utils/router/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/ui.dart';

class App extends HookWidget with ThemeValues {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = useMemoized(AppRouter.new);

    return ThemeProvider(
      child: HeroControllerScope(
        controller: HeroController(),
        child: WidgetsApp.router(
          color: color.primary,
          debugShowCheckedModeBanner: false,
          builder: DesktopWrapper.builder,
          routerConfig: router.routerConfig,
        ),
      ),
    );
  }
}
