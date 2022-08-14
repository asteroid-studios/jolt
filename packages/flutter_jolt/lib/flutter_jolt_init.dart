import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_strategy/url_strategy.dart';

/// This method is used to prepare the joltDevicePreferences box
/// in Hive local Storage.
///
/// Paint dithering is also enabled by default
/// to allow for nicer gradients
///
/// setUrlPathStrategy is used to remove the '#' from the url on Web
Future<void> initializeJolt({
  /// Enable paint dithering, which is useful for smoother gradients
  bool enablePaintDithering = true,

  /// Remove the '#' from the url on web
  bool setUrlPathStrategy = true,
}) async {
  // Ensure the app is initialised
  WidgetsFlutterBinding.ensureInitialized();
  // Enable paint dithering, useful for smoother gradients
  if (enablePaintDithering) {
    Paint.enableDithering = true;
  }
  // Remove the '#' from the url on web
  if (setUrlPathStrategy && UniversalPlatform.isWeb) {
    setPathUrlStrategy();
  }
  // Initialise Hive
  await Hive.initFlutter();
  // Create a storage box for joltDevicePrefrences
  // Used for storing selected theme/typography etc
  await Hive.openBox('joltDevicePreferences');
}
