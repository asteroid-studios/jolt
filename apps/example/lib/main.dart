import 'package:flutter/material.dart';

import 'package:jolt/jolt_init.dart';

import 'package:example/components/app/app.dart';

void main() async {
  Paint.enableDithering = true;
  await Jolt.initFlutter();
  runApp(const App());
}
