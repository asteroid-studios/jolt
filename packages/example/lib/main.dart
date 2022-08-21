import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:example/app/util/secrets.dart';
import 'package:example/app/util/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_init.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uni_links_desktop/uni_links_desktop.dart';
import 'package:universal_platform/universal_platform.dart';
import 'app/app.dart';
import 'app/environment.dart';

late Environment _environment;

// TODO review this, don't like that I have to import main to use
Environment get environment => _environment;

Future<void> initialiseEnvironment(Environment env) async {
  // Initialise Jolt Defaults
  await initializeJolt();

  _environment = env;

  // Init uni links Desktop
  if (UniversalPlatform.isMacOS || UniversalPlatform.isWindows) {
    enableUniLinksDesktop();
    if (UniversalPlatform.isWindows) {
      registerProtocol('unilinks');
    }
  }

  // Initialise app services
  await AppSecrets.initialize(env.secretsPath);
  await initialiseFlagsmith(
    AppSecrets.flagsmithKey,
    debug: false,
  );
  await Supabase.initialize(
    debug: false,
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  // Run the app
  const app = Example();
  if (AppSecrets.sentryDsn.isNotEmpty) {
    await SentryFlutter.init((options) {
      options.dsn = AppSecrets.sentryDsn;
      options.environment = env.name;
      options.debug = false;
    }, appRunner: () => runApp(app));
  } else {
    runApp(app);
  }

  // Set the initial window size and placement
  // for desktop Flutter apps
  if (UniversalPlatform.isDesktop) {
    doWhenWindowReady(() {
      appWindow.minSize = const Size(300, 450);
      appWindow.show();
    });
  }
}
