import 'package:mixpanel_analytics/mixpanel_analytics.dart';

late MixpanelAnalytics mixpanelClient;

Future<void> initialiseMixpanel(String projectToken,
    {bool debug = true}) async {
  // TODO work out whether to do batch or not.
  // Maybe i should have one of each for fast track and slow track
  mixpanelClient = MixpanelAnalytics.batch(
    token: projectToken,
    uploadInterval: const Duration(seconds: 30),
  );
}

void trackEvent(AnalyticsEvent e) async {
  await mixpanelClient.track(
    event: e.event,
    properties: e.properties,
    time: DateTime.now(),
  );
}

enum AnalyticsEvent {
  test(
    event: 'test.test',
    properties: {},
  );

  final String event;
  // TODO maybe define a class for my properties that can have a to map function
  // class EventProperties {}
  final Map<String, dynamic> properties;

  const AnalyticsEvent({
    required this.event,
    required this.properties,
  });
}
