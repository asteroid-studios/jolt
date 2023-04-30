import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:jolt/jolt.dart';
import 'package:jolt/jolt_init.dart';

import 'package:example/components/app/app.dart';

void main() async {
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  Paint.enableDithering = true;
  await Jolt.initFlutter();
  runApp(const App());

  if (Platform.isDesktop) {
    doWhenWindowReady(() {
      appWindow.show();
    });
  }
}
