import 'package:flagsmith/flagsmith.dart';
export 'package:flagsmith/flagsmith.dart' hide Feature;

late FlagsmithClient flagsmithClient;

Future<void> initialiseFlagsmith(String apiKey, {bool debug = true}) async {
  flagsmithClient = await FlagsmithClient.init(
    apiKey: apiKey,
    config: FlagsmithConfig(
      isDebug: debug,
    ),
    seeds: [
      Flag.seed(Feature.snackbars.name, enabled: true),
    ],
  );
  await flagsmithClient.getFeatureFlags(reload: true);

  final stream = flagsmithClient.stream(Feature.snackbars.name);
  if (stream != null) {
    stream.listen((event) {
      print('NEW EVENT SNACKBARS ENABLED :');
      print(event.enabled);
    }, onError: (e, s) {
      print(e);
      print(s);
    }, onDone: () {
      print('Stream finished :');
    });
  }
}

enum Feature {
  snackbars,
  content,
}
