import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/golden_test_widget.dart';

Future<void> _loadSatoshi() async {
  // TODO get these dynamically from Fonts
  TestWidgetsFlutterBinding.ensureInitialized();
  final satoshiFontData = rootBundle.load('fonts/satoshi/Satoshi-Variable.ttf');
  final satoshiItalicFontData = rootBundle.load('fonts/satoshi/Satoshi-Variable.ttf');
  final fontLoader = FontLoader('packages/ui/Satoshi')
    ..addFont(satoshiFontData)
    ..addFont(satoshiItalicFontData);
  await fontLoader.load();
}

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await _loadSatoshi();
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      goldenTestTheme: GoldenTestTheme(
        backgroundColor: GoldenTest.background,
        borderColor: GoldenTest.borderColor,
      ),
    ),
    run: testMain,
  );
}
