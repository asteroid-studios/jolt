import 'package:jolt/jolt.dart';

import 'package:example/routing/router.dart';
import 'package:example/theming/themes.dart';
import 'package:example/theming/widget_theme.dart';
import 'package:example/translation/delegates.dart';
import 'package:example/translation/locales.dart';

/// The main app widget.
class App extends StatelessWidget {
  /// The main app widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return JoltApp.router(
      debugShowCheckedModeBanner: false,
      themes: themes,
      widgetTheme: widgetTheme,
      routerConfig: router,
      supportedLocales: locales,
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        ...translationDelegates,
      ],
    );
  }
}
