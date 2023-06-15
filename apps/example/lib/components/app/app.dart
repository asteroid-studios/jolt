import 'package:ui/themes.dart';
import 'package:ui/ui.dart';
import 'package:ui/widget_theme.dart';

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
      supportedLocales: supportedLocales,
      localizationsDelegates: [
        ...translationDelegates,
      ],
    );
  }
}
