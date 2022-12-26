import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/utils/local_storage.dart';

/// This method is used to prepare the joltDevicePreferences box
/// in Hive local Storage.
///
/// Paint dithering is also enabled by default
/// to allow for nicer gradients
///
Future<void> initializeJolt({
  /// Enable paint dithering, which is useful for smoother gradients
  bool enablePaintDithering = true,
  bool initHive = true,
}) async {
  // Ensure the app is initialised
  WidgetsFlutterBinding.ensureInitialized();

  // Enable paint dithering, useful for smoother gradients
  if (enablePaintDithering) {
    Paint.enableDithering = true;
  }

  // Initialise Hive
  if (initHive) {
    await Hive.initFlutter();
  }
  // Create a storage box for joltDevicePreferences
  // Used for storing selected theme/typography etc
  await Hive.openBox(joltStorageKey);
}
