import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

enum Environment {
  local(secretsPath: 'config/local/secrets.json'),
  development(secretsPath: 'config/development/secrets.json'),
  production(secretsPath: 'config/production/secrets.json');

  final String secretsPath;

  const Environment({required this.secretsPath});
}
