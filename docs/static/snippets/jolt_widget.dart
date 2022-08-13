import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Jolt(
      builder: (context) {
        return MaterialApp(
          scaffoldMessengerKey: joltScaffoldMessengerKey,
          theme: context.jolt.themeData,
        );
      },
    );
  }
}
