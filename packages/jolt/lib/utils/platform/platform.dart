import 'package:flutter/foundation.dart';

/// A replacement for [Platform] which is available from Dart IO.
/// Uses [defaultTargetPlatform] to determine platform or
/// kIsWeb to determine if the platform is web.
class Platform {
  Platform._();

  static final _platform = Platform._();

  ///
  bool? _kIsWebOverride;

  /// Get the current platform, returns null on web
  ///
  /// If you want to get the platform ignoring web, use [devicePlatform]
  static TargetPlatform? get targetPlatform =>
      isWeb ? null : defaultTargetPlatform;

  /// Returns the device platform, even when running on web
  static TargetPlatform get devicePlatform => defaultTargetPlatform;

  /// Determine if the platform is web
  static bool get isWeb => _platform.debugWebOverride ?? kIsWeb;

  /// Determine if the platform is iOS
  static bool get isIOS => targetPlatform == TargetPlatform.iOS;

  /// Determine if the platform is Android
  static bool get isAndroid => targetPlatform == TargetPlatform.android;

  /// Determine if the platform is Fuchsia
  static bool get isFuchsia => targetPlatform == TargetPlatform.fuchsia;

  /// Determine if the platform is MacOS
  static bool get isMacOS => targetPlatform == TargetPlatform.macOS;

  /// Determine if the platform is Windows
  static bool get isWindows => targetPlatform == TargetPlatform.windows;

  /// Determine if the platform is Linux
  static bool get isLinux => targetPlatform == TargetPlatform.linux;

  /// Determine if the platform is mobile
  static bool get isMobile => isIOS || isAndroid || isFuchsia;

  /// Determine if the platform is desktop
  static bool get isDesktop => isMacOS || isWindows || isLinux;

  ///
  bool? get debugWebOverride => kDebugMode ? _kIsWebOverride : null;

  /// Override the default target platform for testing
  set debugWebOverride(bool? isWeb) {
    _kIsWebOverride = isWeb;
  }

  /// Override the default target platform for testing
  void setDebugTargetPlatformOverride(TargetPlatform? platform) {
    debugDefaultTargetPlatformOverride = platform;
  }

  ///
  static T when<T>(
    T defaultValue, {
    T? web,
    T? android,
    T? fuchsia,
    T? iOS,
    T? linux,
    T? macOS,
    T? windows,
  }) {
    switch (Platform.targetPlatform) {
      case TargetPlatform.android:
        return android ?? defaultValue;
      case TargetPlatform.fuchsia:
        return fuchsia ?? defaultValue;
      case TargetPlatform.iOS:
        return iOS ?? defaultValue;
      case TargetPlatform.linux:
        return linux ?? defaultValue;
      case TargetPlatform.macOS:
        return macOS ?? defaultValue;
      case TargetPlatform.windows:
        return windows ?? defaultValue;
      case null:
        return web ?? defaultValue;
    }
  }

  ///
  static T whenGroup<T>(
    T defaultValue, {
    T? web,
    T? mobile,
    T? desktop,
  }) {
    switch (Platform.targetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return mobile ?? defaultValue;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return desktop ?? defaultValue;
      case null:
        return web ?? defaultValue;
    }
  }
}

///
extension JoltPlatformXT<T> on T {
  ///
  T platform(
    T defaultValue, {
    T? web,
    T? android,
    T? fuchsia,
    T? iOS,
    T? linux,
    T? macOS,
    T? windows,
  }) {
    switch (Platform.targetPlatform) {
      case TargetPlatform.android:
        return android ?? defaultValue;
      case TargetPlatform.fuchsia:
        return fuchsia ?? defaultValue;
      case TargetPlatform.iOS:
        return iOS ?? defaultValue;
      case TargetPlatform.linux:
        return linux ?? defaultValue;
      case TargetPlatform.macOS:
        return macOS ?? defaultValue;
      case TargetPlatform.windows:
        return windows ?? defaultValue;
      case null:
        return web ?? defaultValue;
    }
  }

  ///
  T platformGroup(
    T defaultValue, {
    T? web,
    T? mobile,
    T? desktop,
  }) {
    switch (Platform.targetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return mobile ?? defaultValue;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return desktop ?? defaultValue;
      case null:
        return web ?? defaultValue;
    }
  }
}
