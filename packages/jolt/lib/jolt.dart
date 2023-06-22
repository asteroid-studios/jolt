// Flutter exports
import 'package:hive_flutter/hive_flutter.dart';

// Package exports
export 'package:tinycolor2/tinycolor2.dart';

// Export the JoltApp widget
export 'src/app/app.dart';
export 'src/app/app_controller.dart';

// Theming exports
export 'src/theming/theming.dart';

// Widget exports
export 'src/widgets/widgets.dart';

// Utils exports
export 'src/utils/utils.dart';

// Flutter exports
export 'package:flutter/material.dart' show Scrollbar, SelectionArea;
export 'package:flutter/widgets.dart'
    hide
        Column,
        Form,
        FormField,
        FormFieldBuilder,
        FormFieldState,
        FormState,
        Icon,
        Row,
        Text;

///
class Jolt {
  /// The Hive key for storing Jolt preferences.
  static const storageKey = 'joltPreferences';

  /// Initializes Jolt.
  static Future<void> init({bool initializeHive = true}) async {
    if (initializeHive) await Hive.initFlutter();
    await Hive.openBox<dynamic>(Jolt.storageKey);
  }
}
