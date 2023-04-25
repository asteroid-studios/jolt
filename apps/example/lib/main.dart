import 'package:flutter/material.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:jolt/jolt_init.dart';

import 'package:example/components/app/app.dart';

void main() async {
  Paint.enableDithering = true;
  await Jolt.initFlutter();
  runApp(const App());

  doWhenWindowReady(() {
    appWindow.show();
  });
}
