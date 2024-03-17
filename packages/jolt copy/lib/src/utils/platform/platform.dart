import 'package:flutter/foundation.dart';

export 'package:flutter/foundation.dart' show TargetPlatform;

/// A replacement for [Platform] which is available from Dart IO.
/// Uses [defaultTargetPlatform] to determine platform or
/// kIsWeb to determine if the platform is web.
class Platform {
  /// Get the current target platform
  ///
  /// Web will return null
  static TargetPlatform? get platform => kIsWeb ? null : defaultTargetPlatform;

  /// Determine if the platform is web
  static bool get isWeb => kIsWeb;

  /// Determine if the platform is iOS
  static bool get isIOS => platform == TargetPlatform.iOS;

  /// Determine if the platform is Android
  static bool get isAndroid => platform == TargetPlatform.android;

  /// Determine if the platform is Fuchsia
  static bool get isFuchsia => platform == TargetPlatform.fuchsia;

  /// Determine if the platform is MacOS
  static bool get isMacOS => platform == TargetPlatform.macOS;

  /// Determine if the platform is Windows
  static bool get isWindows => platform == TargetPlatform.windows;

  /// Determine if the platform is Linux
  static bool get isLinux => platform == TargetPlatform.linux;

  /// Determine if the platform is mobile
  static bool get isMobile => isIOS || isAndroid || isFuchsia;

  /// Determine if the platform is desktop
  static bool get isDesktop => isMacOS || isWindows || isLinux;

  /// Override the default target platform for testing
  void setDebugTargetPlatformOverride(TargetPlatform? platform) {
    debugDefaultTargetPlatformOverride = platform;
  }
}
