import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:ui_copy/ui.dart';

import 'package:example/components/app/app.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setUrlStrategy(PathUrlStrategy());
  await Jolt.init();

  runApp(const App());

  if (Platform.isDesktop) {
    appWindow.show();
    // doWhenWindowReady(() {
    // appWindow.minSize = const Size(400, 800);
    // appWindow.alignment = Alignment.center;
    // });
  }

  FlutterNativeSplash.remove();
}
