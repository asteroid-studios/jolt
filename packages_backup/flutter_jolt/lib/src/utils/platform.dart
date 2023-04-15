import 'package:flutter/foundation.dart';

class JoltPlatform {
  static JoltTargetPlatform get platform => kIsWeb
      ? JoltTargetPlatform.web
      : _platformMap[defaultTargetPlatform] ?? JoltTargetPlatform.unknown;
  static bool get isWeb => platform == JoltTargetPlatform.web;
  static bool get isIOS => platform == JoltTargetPlatform.iOS;
  static bool get isAndroid => platform == JoltTargetPlatform.android;
  static bool get isMacOS => platform == JoltTargetPlatform.macOS;
  static bool get isWindows => platform == JoltTargetPlatform.windows;
  static bool get isLinux => platform == JoltTargetPlatform.linux;
  static bool get isMobile => isIOS || isAndroid;
  static bool get isDesktop => isWindows || isMacOS || isLinux;
}

final _platformMap = {
  TargetPlatform.iOS: JoltTargetPlatform.iOS,
  TargetPlatform.android: JoltTargetPlatform.android,
  TargetPlatform.macOS: JoltTargetPlatform.macOS,
  TargetPlatform.windows: JoltTargetPlatform.windows,
  TargetPlatform.linux: JoltTargetPlatform.linux,
};

enum JoltTargetPlatform { web, iOS, android, macOS, windows, linux, unknown }
