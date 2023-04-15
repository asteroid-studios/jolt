import 'package:sentry_flutter/sentry_flutter.dart';

// TODO make this better
// TODO support tracking custom exceptions
Future<String> captureException(String message) async {
  final SentryId id = await Sentry.captureException(Exception());
  return id.toString();
}
