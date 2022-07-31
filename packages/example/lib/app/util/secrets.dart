import 'dart:convert';
import 'package:flutter/services.dart';

abstract class AppSecrets {
  static Map<String, dynamic> _config = {};

  static Future<void> initialize(String secretsPath) async {
    final configString = await rootBundle.loadString(secretsPath);
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String get flagsmithKey {
    return _config['flagsmithKey'] as String;
  }

  static String get sentryDsn {
    return _config['sentryDsn'] as String;
  }

  static String get supabaseUrl {
    return _config['supabaseUrl'] as String;
  }

  static String get supabaseAnonKey {
    return _config['supabaseAnonKey'] as String;
  }

  static String get mixpanelToken {
    return _config['mixpanelToken'] as String;
  }
}
