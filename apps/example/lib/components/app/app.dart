import 'package:ui_copy/themes.dart';
import 'package:ui_copy/ui.dart';
import 'package:ui_copy/widget_theme.dart';

import 'package:example/utils/router/router.dart';
import 'package:example/utils/translation/delegates.dart';
import 'package:example/utils/translation/locales.dart';

///
class App extends StatelessWidget {
  ///
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return JoltApp.router(
      themes: themes,
      widgetTheme: widgetTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.instance.config(),
      locale: Locales.en,
      // Example of changing breakpoint values
      // breakpoints: const Breakpoints(
      //   tabletLandscape: TabletLandscape(maxWidth: 1150),
      // ),
      supportedLocales: supportedLocales,
      localizationsDelegates: [
        ...translationDelegates,
      ],
    );
  }
}
